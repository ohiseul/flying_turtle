var memberNo = $("#menu-memNo").val();
let flag = false;
let clzName;
let sbjNo;

// 임시메모 or 저장메모 클릭시
$(".nonSave, .save").click(function () {
	console.log("메모 분류 클릭----------------------");
	
	$(".choiceMenu div, .choiceMenu div input").attr("checked", false)
								   			   .removeClass("checked-menu");
	clzName = $(this).attr("class");
	
	// 선택메뉴 표시
	$(this).addClass("checked-menu");
	$("#"+clzName).attr("checked", true);
	
	// 클릭시 메모 불러오기
	if(clzName == 'save') {
		changeSort("selectSavedMemo.do");
	}
	else {
		$('input:radio[name=subject]').attr("checked", false);
		changeSort("loading.do");
	}
});

// 과목 클릭시 ============================================================= 버그
$(".label-subject").click( () => {
	console.log(".subject 과목 클릭----------------------");
	
	sbjNo = $("input[name='subject']:checked").val();
	console.log("클릭한 과목번호 : " + sbjNo);

	if(clzName == 'save') changeSort("selectSavedMemo.do", sbjNo);

});
// =================================================================== 버그

// sbjNo가 들어올때는 저장메모에서 과목을 클릭했을때
// 안들어오면 임시메모 선택시 or 저장메모 전체조회시
function changeSort(url, sbjNo) {
	console.log("메모 로딩 ---- ");
	alert("url " + url);

	$("#memoContainer").html("");
	if(sbjNo) flag = true; else flag = false;
	
	$.ajax({
		url:  url,
		dataType: "json",
		data: (flag) ? {memberNo, sbjNo} : {memberNo}
	})
	.done(function (memoList) {
		if(memoList.length == 0) {
			$("#memoContainer").append("<div>아직 작성한 메모가 없네요!</div>");
			return;
		} else {
			$(memoList).each(function (i) {
				new Sticky().createSticky($(this));
			});
		}
	});
};

$( changeSort("loading.do") );	// 첫화면 로딩


// 메모 추가(생성)
$("#addMemo").click( () => {
	var sticky = new Sticky();
	sticky.createSticky();
})

function Sticky() {
	this.note = null;
	this.editObj = null;
	this.bar = null;
}

Sticky.prototype.createSticky = function (sticky) {
	var obj = this;
	this.editObj = $("<div></div>").addClass("stickyEdit").attr("contenteditable", "false");
	this.bar = $("<div></div>")
	           .addClass("stickyBar")
	           .append('<div class="memobar checkDiv"><input type="checkbox" name="memo" value="" /></div>')
	           .append('<span class="memobar editableMemo">수정</span>')
	           .append('<span class="memobar editMemo">변경</span>')
	           .append('<span class="memobar delMemo">삭제</span>')
	           .append('<span class="memobar updateSbj">저장</span>')
			   .append('<span class="memobar saveMemo">저장</span>');
	
	var note = $("<div></div>").addClass("stickyNote")
	                           .append(this.bar)
	                           .append(this.editObj);
	
	$("#memoContainer").prepend(note);

	if (sticky) {
		note.attr("data-noteNo", sticky.attr("memoNo"))				// 노트 번호
			.children(".stickyEdit").html(sticky.attr("content"));	// content db내용
	}

	this.note = note;
	
	// 수정가능 상태
	this.bar.children("span.editableMemo").click(function () {
		note.find(".editMemo").css("display", "block");
		note.find(".stickyEdit").attr("contenteditable", "true");
	});
	this.bar.children("span.editMemo").click(() => obj.edit() );		// 변경
	this.bar.children("span.delMemo").click(() => obj.del() );			// 삭제
	this.bar.children("span.updateSbj").click(() => obj.updateSbj() );	// 저장
	
	// 메모 추가(생성)
	if (!sticky) {
		this.bar.children().css("display", "none");
		this.bar.children("span.saveMemo").css("display", "block").click( () => obj.save() );
		note.find(".stickyEdit").attr("contenteditable", "true").focus();
	}
};

// 저장 클릭시 과목 저장(과목이 이미 선택된 상황)
Sticky.prototype.updateSbj = function () {
	console.log("과목 분류 / 저장 ----------------------");
	
	var note = this.note;
	
	// 선택된 과목이 있을때만 저장
	if( sbjNo ) {

		$.get(
				"updateMemoSbj.do",
				{
					sbjNo : sbjNo,
					memoNo : note.attr("data-noteNo")
				}
		).done(function (result) {
			note.remove();
		});
	}
	else {
		alert("과목을 선택해 주세요");
	}
};

// 임시 메모 수정 내용 저장
Sticky.prototype.edit = function () {
	console.log(".edit 변경 클릭----------------------");
	
	var note = this.note;
	$.get(
		"editNonsaveMemo.do",
		{
			memoNo : note.attr("data-noteno"),
			content: note.children(".stickyEdit").html(),
		},
		function (data) {
			note.find(".editableMemo").css("display", "none");
			note.find(".stickyEdit").attr("contenteditable", "false");
		}
	);
};

// 메모 데이터 저장(생성시)
Sticky.prototype.save = function () {
	var note = this.note;
	let url;
	let content = note.children(".stickyEdit").html();
	
	if ($(":radio[name=updateSbj]:checked") == 'Y') url = "insertSavedMemo.do"
	else url = "copy.do"
	
	$.post( 
		url,
		($(":radio[name=updateSbj]:checked") == 'Y') ? {memberNo, sbjNo, content} : {memberNo, content}
	).done( (result) => {
		// 생성한 메모번호 받아와서 속성 설정해주기
		note.attr("data-noteNo", result.memoNo);
	});
};

// 메모 데이터 삭제
Sticky.prototype.del = function () {
	swal("삭제할건가요?", { buttons: ["아니요!", true] })
	.then((result) => {
	    if (result) {
			var note = this.note;
			// db & 화면 제거
			$.get(
				"delmemo.do",
				{memoNo : note.attr("data-noteNo")},
				function (data) {
					note.remove();
				}
			);
	    }
	});
};