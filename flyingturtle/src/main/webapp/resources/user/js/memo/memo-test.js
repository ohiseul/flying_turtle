var memberNo = $("#menu-memNo").val();
let flag = false;
let sbjNo;

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
//	alert("누른 과목 번호: " + currSbjNo)
//	alert('전역변수 sbjNo ! '+ sbjNo);
//	alert("== ? "+ (currSbjNo == sbjNo) );

	let save;
	if( currSbjNo == sbjNo ) {
		alert("true 임!");
		$('.label-subject').removeClass("clicked-sbj");
		sbjNo = '';	save = '';
	}
	else {
		$('.label-subject').removeClass("clicked-sbj");
		$(this).addClass("clicked-sbj");
		sbjNo = currSbjNo;
	}
	
	if( sbjNo == 'nonSave' ) {
//		alert('N 실행');
		save = 'N';
		changeSort("selectMemoList.do", save);	// 과목 선택X시 메모 조회
	}
	else if(sbjNo == "" && save == "") {
//		alert('아무것도 선택안함');
		changeSort("selectMemoList.do");
	}
	else {
//		alert('Y 실행 why~~');
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
	this.editObj = $("<div></div>").addClass("stickyEdit").attr("contenteditable", "false");
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
					           <div class="hiddenDiv">
									<span class='memobar saveMemo'>저장</span>
					           <div>
					           `
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
		alert('zmfflr');
		note.find("div.right").css("display", "none");
		note.find("div.hiddenDiv").css("display", "block");
		note.find(".stickyEdit").attr("contenteditable", true).focus();
	});
	this.bar.find("span.editMemo").click(() => obj.edit() );		// 저장(수정 내용 저장)
	this.bar.find("span.delMemo").click(() => obj.del() );			// 삭제
	this.bar.find("span.updateSbj").click(() => obj.updateSbj() );	// 이동
	
	// 메모 추가(생성)
	if (!sticky) {
		$(".emptyMemo").remove();
		this.bar.find("div.right").css("display", "none");
//		this.bar.append("<span class='memobar saveMemo'>저장</span>");	// 추가 후 save 버튼
		note.find(".stickyEdit").attr("contenteditable", "true").focus();
		this.bar.find("span.saveMemo").click( () => obj.save() );
	}
};

//저장 (수정 내용 저장)
Sticky.prototype.edit = function () {
	alert('저장');
	var note = this.note;
	$.post( "updateMemo.do", { memoNo : note.attr("data-noteno"), content: note.find(".stickyEdit").html() },
		function (data) {
			note.find("span.editMemo").css("display", "none");
			note.find("span.date").text(new Date(data.editDate).toLocaleDateString() + "에 수정됨");
			note.find(".stickyEdit").attr("contenteditable", "false");
		}
	);
};

// 저장 : 과목 저장(과목이 이미 선택된 상황)
Sticky.prototype.updateSbj = function () {
	var note = this.note;
	let checkSbj = $(':checkbox[name=subject]:checked').val();
	alert("체크박스 번호 : " + checkSbj );
	
	// 선택된 과목이 있을때만 저장	
	if( checkSbj ) {
		$.get( "updateMemoSbj.do", { sbjNo : checkSbj, memoNo : note.attr("data-noteNo") } )
		.done(function (result) { 
//			note.remove();
			alert("저장 성공");
		});
	} else alert("과목을 선택해 주세요");
};

// 추가 : 메모 데이터 저장(생성시)
Sticky.prototype.save = function () {
	var note = this.note;
	let content = note.find(".stickyEdit").html();
	
	$.post( "copy.do", (sbjNo) ? {memberNo, sbjNo, content} : {memberNo, content} )
	.done( (result) => {
		this.bar.find("span.saveMemo").remove();
		
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
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
	})
	.then((willDelete) => {
	    if (willDelete) {
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
	과목 추가
==========================================================	*/
$(".subject-list").on('click', 'label[for=new]', function() { $(this).text(""); })
				  .on('keyup', 'label[for=new]', function(e) {
						// 과목 생성
						if(e.keyCode == 13) {
							let text = $(this).text();
							let delBr =  text.replace(/\n/g, "");
							alert( delBr ); 
							$.post(
								"insertMemoSbj.do",
								{subjectName: delBr, memberNo}
							).done(function (result) {
								$("#new").attr({
									"id" : "sub"+result.sbjNo,
									"value" : result.sbjNo
								});
								$("label[for=new]").parent().attr("id", result.sbjNo);
								$("label[for=new]").attr("for", "sub"+result.sbjNo).removeAttr("contenteditable");
								
								$(this).prop('checked', true);
								sbjNo = $("input:radio[name='subject']:checked").val();
							});
						}
				  });
// 화면 추가
$("#addButton").click( function() {
	$(".emptySbj").remove();
	
	if( $("#new").length ) {
		Swal.fire("과목명을 입력해 주세요!");
		return;
	}
	$(".subject-list").append(
		`<div><input type="radio" name="subject" value="" id="new" />
		<label for="new" class="label-subject" contenteditable >과목명을 입력하세요</label></div>`
	);
});

// 과목삭제
$("#minusButton").click( function() {
	if(sbjNo) {
		Swal.fire({
			  title: "과목을 삭제할까요?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
				let delSbjId = "#" + sbjNo;
				$.get( 'deleteMemoSbj.do', {sbjNo}, () => { $(delSbjId).remove(); } );
				Swal.fire( "과목이 삭제됐어요!", {icon: "success"} );
				
				if( $(".subject-list").find(".label-subject") ) {
					$(".subject-list").append("<div class='emptySbj'>생성한 과목이 없습니다.</div>");
				}
				sbjNo = "";
			};
		});
	}
	else Swal.fire("삭제할 과목이 없어요!");
});