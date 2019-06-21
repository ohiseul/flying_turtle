var memberNo = $("#menu-memNo").val();
let flag = false;
let sbjNo;

$('.subject-list').on('click', 'input[name=subject]', function () {
	if( $('input[name=subject]:checked').length > 1 ){
		Swal.fire({ 
			type: 'warning', 
			title: '과목은 하나만 선택 가능해요',
			text: '준비중입니다.',
			showConfirmButton: false,
			timer: 600 
		});
		$('input[name=subject]').prop("checked",false);
	};
})


function changeSort(url, save, sbjNo) {
	$("#memoContainer").html("");
	let data;
	
	if(save && sbjNo) data = {memberNo, save, sbjNo};
	else if(save)	  data = {memberNo, save};
	else 			  data = {memberNo};
	
	$.ajax({
		url:  url,
		data: data,
		dataType: "json"
	})
	.done(function (memoList) {
		if( memoList.length == 0 ) {
			$("#memoContainer").append("<div class='emptyMemo'> 작성한 메모가 없네요! </div>");
		}
		else {
			$(memoList).each(function (i) {
				new Sticky().createSticky($(this));
			});
		}
	});
};

$( changeSort("selectMemoList.do") );	// 첫화면 로딩

/* =======================================================
	저장분류 , 과목 선택시 메모 조회
==========================================================	*/

$(".subject-list").on('click', '.label-subject', function () {
	
	let currSbjNo= $(this).attr('id');		// div

	let save;
	if( currSbjNo == sbjNo ) {
		$('.label-subject').removeClass("clicked-sbj");
		sbjNo = '';	save = '';
	}
	else {
		$('.label-subject').removeClass("clicked-sbj");
		$(this).addClass("clicked-sbj");
		sbjNo = currSbjNo;
	}
	
	if( sbjNo == 'nonSave' ) {
		save = 'N';
		changeSort("selectMemoList.do", save);	// 과목 선택X시 메모 조회
	}
	else if(sbjNo == "" && save == "") {
		changeSort("selectMemoList.do");
	}
	else {
		save = 'Y';
		changeSort("selectMemoList.do", save, sbjNo);
	}
});


/* =======================================================
	메모 
==========================================================	*/
function Sticky() {
	this.note = null;
	this.editObj = null;
	this.bar = null;
}

// 메모 추가(생성)
$("#addMemo").click( () => {
	var sticky = new Sticky();
	sticky.createSticky();
});

Sticky.prototype.createSticky = function (sticky) {
	var obj = this;
	this.editObj = $("<div></div>").addClass("stickyEdit")
								   .attr({
									   "contenteditable" : false,
									   "placeholder" : "내용을 입력해 주세요"
								   	});
//									.append('<div class="title"><h3>title</h3></div>')
//									.append('<div class="memo-content"></div>');
	this.bar = $("<div></div>").addClass("stickyBar")
							.append(
								`<div class="stickyBar-bottom"><span class="memobar date"></span></div>
					           <div class="stickyBar-bottom right">
						           <span class="memobar updateSbj">이동</span>
						           <span class="memobar delMemo">삭제</span>
						           <span class="memobar editableMemo">수정</span>
					           </div>
					           <div class="hiddenDiv">
									<span class="memobar cancleEdit">취소</span>
									<span class="memobar editMemo">저장</span>
					           </div>
					           <div class="add-saveBtn">
									<span class="memobar cancleAddMemo">취소</span>
									<span class='memobar saveMemo'>저장</span>
					           <div>`
							);
	
	var note = $("<div></div>").addClass("stickyNote")
								.prepend(this.editObj)
	                           .append(this.bar);
	
	$("#memoContainer").prepend(note);

	if (sticky) {
		let regDate = sticky.attr("editDate") || sticky.attr("regDate");
		let date = new Date(regDate).toLocaleDateString();
		
//		note.find("input:checkbox[name=memo]").attr("value", sticky.attr("memoNo"));
		note.find("span.date").text(date + "에 마지막으로 작성");
		note.attr("data-noteNo", sticky.attr("memoNo"))						// 노트 번호
			.children(".stickyEdit").html(sticky.attr("content"));			// content db 내용
	}

	this.note = note;
	
	// 수정 - editable
	this.bar.find("span.editableMemo").click(function () {
		note.find("div.right").css("display", "none");
		note.find("div.hiddenDiv").css("display", "block");
		note.find(".stickyEdit").attr("contenteditable", true).focus();
	});
	// 수정 취소
	this.bar.find("span.cancleEdit").click(() => {
		note.find("div.hiddenDiv").css("display", "none");
		note.find("div.right").css("display", "block");
		note.find(".stickyEdit").attr("contenteditable", false);
	} );
	this.bar.find("span.editMemo").click(() => obj.edit() );		// 저장(수정 내용 저장)
	this.bar.find("span.delMemo").click(() => obj.del() );			// 삭제
	this.bar.find("span.updateSbj").click(() => obj.updateSbj() );	// 이동
	
	// 메모 추가(생성)
	if (!sticky) {
		$(".emptyMemo").remove();
		this.bar.find("div.right").css("display", "none");
		this.bar.find("div.add-saveBtn").css("display", "block");
		note.find(".stickyEdit").attr("contenteditable", "true").focus();
		this.bar.find("span.saveMemo").click( () => obj.save() );
		this.bar.find("span.cancleAddMemo").click(() => { note.remove() } );
	}
};

// 수정 내용 저장
Sticky.prototype.edit = function () {
	var note = this.note;
	$.post( "updateMemo.do", { memoNo : note.attr("data-noteno"), content: note.find(".stickyEdit").html() },
		function (data) {
			note.find("div.hiddenDiv").css("display", "none");
			note.find("div.right").css("display", "block");
			note.find("span.date").text(new Date(data.editDate).toLocaleDateString() + "에 수정됨");
			note.find(".stickyEdit").attr("contenteditable", "false");
		}
	);
};

// 저장 : 과목 저장(과목이 이미 선택된 상황)
Sticky.prototype.updateSbj = function () {
	var note = this.note;
	let checkSbj = $(':checkbox[name=subject]:checked').val();
	
	// 선택된 과목이 있을때만 저장	
	if( checkSbj ) {
		$.get( "updateMemoSbj.do", { sbjNo : checkSbj, memoNo : note.attr("data-noteNo") } )
		.done(function (result) { 
//			note.remove();
		});
	} else Swal.fire({ 
		type: 'warning',
		title: "과목을 선택해 주세요",
		showConfirmButton: false,
		timer: 600 
	});
};

// 추가 : 메모 데이터 저장(생성시)
Sticky.prototype.save = function () {
	var note = this.note;
	let content = note.find(".stickyEdit").html();
	
	$.post( "copy.do", (sbjNo == null || sbjNo != 'nonSave') ? {memberNo, sbjNo, content} : {memberNo, content} )
	.done( (result) => {
		this.bar.find("span.saveMemo").remove();
		this.bar.find("span.cancleAddMemo").attr("display", 'none');
		
		this.bar.find(".right").css("display", "block");
		note.find(".stickyEdit").attr("contenteditable", "false");
		
		note.attr("data-noteNo", result.memoNo);	// 생성된 메모번호 속성으로 설정
		note.find("span.date").text( new Date(result.regDate).toLocaleDateString() + "에 등록됨" );
	});
};

// 삭제 : 메모 데이터 삭제
Sticky.prototype.del = function () {
	var note = this.note;
	Swal.fire({
		  title: "메모를 삭제할까요?",
		  type: 'question',
		  showCancelButton: true,
		  confirmButtonText: 'Yes',
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33'
	})
	.then((willDelete) => {
	    if (willDelete.value) {
			$.get(
				"delmemo.do", { memoNo : note.attr("data-noteNo") },
				function (data) {
					if(  $("#memoContainer").find("div").length == 0 ){
						 $("#memoContainer").append("<div class='emptyMemo'> 작성한 메모가 없네요! </div>");
					};
					note.remove();
			});
	    }
	});
};


/* =======================================================
	과목 추가 br 태그 삭제하기!
==========================================================	*/
$(".subject-list").on('click', '.newSbjSave', function(e) {
					// 과목 생성
					let text = $('#new').text();
					if( text == '' || text == null ){
						Swal.fire({ 
							type: 'warning', title: "과목명을 입력해 주세요!", 
							showConfirmButton: false, timer:600
						});
						return;
					}
					
					$.post(
						"insertMemoSbj.do",
						{subjectName: text, memberNo}
					).done(function (result) {
						$('.newSbjSave').remove();
						
						$("#new").parent().attr("id", "div"+ result.sbjNo);
						$("#new").attr({
							"id" : result.sbjNo,
							"contenteditable" : false
						}).text(result.subjectName)
						$("#check").val(result.sbjNo).attr("id", "sub"+result.sbjNo);
					});
				 });
// 화면 추가
$("#addButton").click( function() {
	
	if( $("#new").length ) {
		Swal.fire({
			type: 'warning', title: "과목명을 입력해 주세요!", 
			showConfirmButton: false, timer:600
		});
		return;
	}
	
	$(".subject-list").append(
		`<div>
			<div id="new" class="label-subject" contenteditable="true" placeholder="과목명을 입력하세요"></div>
			<div>
				<div class="newSbjSave">저장</div>
				<input type="checkbox" name="subject" id="check" />
			</div>
		</div>`
	);
	$("#new").focus();
});

// 과목삭제
$("#minusButton").click( function() {
	sbjNo = $('input[name=subject]:checked').val();
	
	if(sbjNo) {
		Swal.fire({
			  title: "과목을 삭제할까요?",
			  type: 'question',
			  showCancelButton: true,
			  confirmButtonText: 'Yes',
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33'
		})
		.then((willDelete) => {
			if (willDelete.value) {
				let delSbjId = "#div" + sbjNo;
				$.get( 'deleteMemoSbj.do', {sbjNo}, () => { $(delSbjId).remove(); } );
				Swal.fire({
				  type: 'success',
				  title: '과목이 삭제됐어요!',
				  showConfirmButton: false,
				  timer: 600
				});
				sbjNo = "";
			};
		});
	}
	else Swal.fire({ 
		type: 'warning', 
		title: "삭제할 과목을 선택하세요", 
		showConfirmButton: false,
		timer: 600
	});
});

// 과목명 수정 - ui
$("#editButton").click(function () {
	sbjNo = $('input[name=subject]:checked').val();
	let check = $("input[name=subject]:checked").val();

	if(sbjNo) {
		$("#sub" + check).css("display", "none")
						.after("<div class='editSbj' style='cursor:pointer'>저장</div>");
		$("#"+check).attr("contenteditable", true).focus();
	}
	else Swal.fire({
		type: 'warning', 
		title: "수정할 과목을 선택해주세요!", 
		showConfirmButton: false,
		timer: 600 
	});
});

// 과목명 수정 - db
$(".subject-list").on('click', '.editSbj', function () {
	let check = $("input[name=subject]:checked").val();
	
	$.post(
		'updateSbjName.do',
		{subjectName : $("#"+check).text(), sbjNo }
	).done(function () {
		$('.editSbj').remove();
		$("#"+check).attr("contenteditable", false);
		$("#sub" + check).css("display", "block");
	});
	
	sbjNo ='';
});