var memberNo = $("#menu-memNo").val();
let flag = false;
let clzName;
let sbjNo;

// sbjNo가 들어올때는 저장메모에서 과목을 클릭했을때, 안들어오면 임시메모 선택시 or 저장메모 전체조회시
function changeSort(url, save, sbjNo) {
	$("#memoContainer").html("");
	
	if(sbjNo) flag = true; else flag = false;
	
	$.ajax({
		url:  url,
		dataType: "json",
		data: (flag) ? {memberNo, save, sbjNo} : {memberNo, save}
	})
	.done(function (memoList) {
		if( memoList.length == 0 ) $("#memoContainer").append("<div class='emptyMemo'> 작성한 메모가 없네요! </div>");
		else {
			$(memoList).each(function (i) {
				new Sticky().createSticky($(this));
			});
		}
	});
};

$( changeSort("selectMemoList.do", 'N') );	// 첫화면 로딩


/* =======================================================
	저장분류 , 과목 선택시 메모 조회
==========================================================	*/

$(".nonSave, .save").click(function () {
	let save;
	clzName = $(this).attr("class");
	$(".choiceMenu div, .choiceMenu div input").prop("checked", false).removeClass("checked-menu");
	$('input:radio[name=subject]').prop("checked", false);	// 탭 이동시 과목 선택 해제
	
	// 분류 선택 css
	$(this).addClass("checked-menu");
	$("#"+clzName).prop("checked", true);
	
	if(clzName == 'nonSave') save = 'N';
	else save = 'Y';
	
	changeSort("selectMemoList.do", save);	// 과목 선택X시 메모 조회
});

$("input:radio[name='subject']").change( () => {
	sbjNo = $("input:radio[name='subject']:checked").val();
	if(clzName == 'save') changeSort("selectMemoList.do", 'Y', sbjNo);	// 저장 + 과목 선택시
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
})

Sticky.prototype.createSticky = function (sticky) {
	var obj = this;
	this.editObj = $("<div></div>").addClass("stickyEdit").attr("contenteditable", "false").addClass("scroll");
	this.bar = $("<div></div>")
	           .addClass("stickyBar")
//	           .append('<div class="memobar checkDiv"><input type="checkbox" name="memo" /></div>')
	           .append('<span class="memobar editableMemo">수정</span>')
	           .append('<span class="memobar editMemo">변경</span>')
	           .append('<span class="memobar delMemo">삭제</span>')
	           .append('<span class="memobar updateSbj">저장</span>')
			   .append('<span class="memobar saveMemo">저장</span>')
			   .append('<span class="memobar date"></span>');
	
	var note = $("<div></div>").addClass("stickyNote")
	                           .append(this.bar)
	                           .append(this.editObj);
	
	$("#memoContainer").prepend(note);

	if (sticky) {
		let regDate = sticky.attr("editDate") || sticky.attr("regDate");
		let date = new Date(regDate).toLocaleDateString();
		
		note.find("input:checkbox[name=memo]").attr("value", sticky.attr("memoNo"));
		note.find("span.date").text(date + "에 마지막으로 작성");
		note.attr("data-noteNo", sticky.attr("memoNo"))						// 노트 번호
			.children(".stickyEdit").html(sticky.attr("content"));			// content db 내용
	}

	this.note = note;
	
	// 수정
	this.bar.children("span.editableMemo").click(function () {
		note.find(".editMemo").css("display", "block");
		note.find(".stickyEdit").attr("contenteditable", "true");
	});
	this.bar.children("span.editMemo").click(() => obj.edit() );		// 변경(수정 내용 저장)
	this.bar.children("span.delMemo").click(() => obj.del() );			// 삭제
	this.bar.children("span.updateSbj").click(() => obj.updateSbj() );	// 저장
	
	// 메모 추가(생성)
	if (!sticky) {
		$(".emptyMemo").remove();
		this.bar.children().css("display", "none");
		note.find(".stickyEdit").attr("contenteditable", "true").focus();
		this.bar.children("span.saveMemo").css("display", "block").click( () => obj.save() );
	}
};

// 저장 : 과목 저장(과목이 이미 선택된 상황)
Sticky.prototype.updateSbj = function () {
	console.log("과목 분류 / 저장 ----------------------");
	
	var note = this.note;
	
	// 선택된 과목이 있을때만 저장
	if( sbjNo ) {
		$.get( "updateMemoSbj.do", { sbjNo : sbjNo, memoNo : note.attr("data-noteNo") } )
		.done(function (result) { note.remove(); });
	}
	else {
		alert("과목을 선택해 주세요");
	}
};

// 변경 : 임시 메모 수정 내용 저장 =========================================================
Sticky.prototype.edit = function () {
	console.log(".edit 변경 클릭----------------------");
	
	var note = this.note;
	$.post( "updateMemo.do", { memoNo : note.attr("data-noteno"), content: note.children(".stickyEdit").html() },
		function (data) {
			note.find(".editMemo").css("display", "none");
			note.find("span.date").text(new Date(data.editDate).toLocaleDateString() + "에 수정됨");
			note.find(".stickyEdit").attr("contenteditable", "false");
		}
	);
};

// 추가 : 메모 데이터 저장(생성시)
Sticky.prototype.save = function () {
	var note = this.note;
	let content = note.children(".stickyEdit").html();
	let isCheckedSbj = $(":radio[name=updateSbj]:checked").val();
	
	$.post( "copy.do", (isCheckedSbj == 'Y') ? {memberNo, sbjNo, content} : {memberNo, content} )
	.done( (result) => {
//		if(! $("#stickyContainer").hasClass(".memoContainer") ) $("#stickyContainer").html("");
		this.bar.children("span.saveMemo").css({ "opacity": "0", "display" : "none" });
		this.bar.children(".editableMemo, .delMemo, .updateSbj, .checkDiv").css("display", "block");
		note.find(".stickyEdit").attr("contenteditable", "false");
		note.attr("data-noteNo", result);	// 생성된 메모번호 속성으로 설정
	});
};

// 삭제 : 메모 데이터 삭제
Sticky.prototype.del = function () {
	var note = this.note;
	swal({
		  title: "메모를 삭제할까요?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
	})
	.then((willDelete) => {
	    if (willDelete) {
			$.get( 
				"delmemo.do", {memoNo : note.attr("data-noteNo")},
				function (data) {
					note.remove();
					if(! note.has(".stickyNote") ) {$("#memoContainer").append("<div class='emptyMemo'> 작성한 메모가 없네요! </div>") };
				}
			);
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
							alert($(this).text().trim() ); 
							$.post(
								"insertMemoSbj.do",
								{subjectName: $(this).text(), memberNo}
							).done(function (result) {
								$("#new").attr({
									"id" : "sub"+result.sbjNo,
									"value" : result.sbjNo
								});
								$("label[for=new]").parent().attr("id", result.sbjNo);
								$("label[for=new]").attr("for", "sub"+result.sbjNo).removeAttr("contenteditable");
							});
						}
				  });
// 화면 추가
$("#addButton").click( function() {
	if( $("#new").length ) {
		swal("과목명을 입력해 주세요!");
		return;
	}
	$(".subject-list").append(
		`<div><input type="radio" name="subject" value="" id="new" />
		<label for="new" class="label-subject" contenteditable >과목명을 입력하세요</label></div>`
	);
});

// 과목삭제
$("#minusButton").click( function() {
	swal({
		  title: "과목을 삭제할까요?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
	})
	.then((willDelete) => {
		if (willDelete) {
			$.get( 'deleteMemoSbj.do', {sbjNo}, () => { $("#"+sbjNo).remove(); } );
			swal( "과목이 삭제됐어요!", {icon: "success"} );
		}
	});
});