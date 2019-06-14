var memberNo = $("#menu-memNo").val();
let flag = false;

//임시메모 or 저장메모 클릭시
$(".nonSave, .save").click(function (){
	$(".choiceMenu div, .choiceMenu div input").attr("checked", false)
											   .removeClass("checked-menu");
	let clzName = $(this).attr("class");
	
	// 선택메뉴 표시
	$(this).addClass("checked-menu");
	$("#"+clzName).attr("checked", true);
	
	// 클릭시 메모 불러오기
	if(clzName == 'nonSave') {
		$('input:radio[name=subject]').attr("checked", false);
		changeSort("nonSave", "loading.do")
	} 
	else {
		$(".updateSbj").css("display", "none");

		flag = true;
		$('input:radio[name=subject]').eq(0).attr("checked", true);
		changeSort("save", "selectSavedMemo.do");
	}
});

// 메모 로딩
function changeSort(selector, url) {
	$("#memoContainer").html("");
	let sbjNo = $("input[name='subject']:checked").val();
	
	$.ajax({
		url:  url,
		dataType: "json",
		data: (flag) ? {memberNo, sbjNo} : {memberNo}
	})
	.done(function (memoList) {
		if(memoList.length == 0) $("#memoContainer").append("<div>아직 작성한 메모가 없네요!</div>");

		$(memoList).each(function (i) {
			new Sticky().createSticky($(this));
		});
	});
};

$( changeSort("nonSave", "loading.do") );	// 첫화면 로딩

// 메모 추가(생성)
//$("#addMemo").click( () => {
//	var sticky = new Sticky();
//	sticky.createSticky();
//})

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
	           .append('<span class="memobar editMemo">수정</span>')
	           .append('<span class="memobar edit-saveMemo">변경</span>')
	           .append('<span class="memobar delMemo">삭제</span>')
	           .append('<span class="memobar updateSbj">저장</span>');
	
	var note = $("<div></div>").addClass("stickyNote")
	                           .append(this.bar)
	                           .append(this.editObj);
	
	$("#memoContainer").append(note);

	if (sticky) {
		note.attr("data-noteNo", sticky.attr("memoNo"));			// 노트 번호
		note.children(".stickyEdit").html(sticky.attr("content"));	// content 내용
	}

	this.note = note;
	
	// 수정
	this.bar.children("span.editMemo").click(function () {
		note.find(".edit-saveMemo").css("display", "block");
		note.find(".stickyEdit").attr("contenteditable", "true");
	});

	this.bar.children("span.edit-saveMemo").click(() => obj.edit() );	// 변경
	
	this.bar.children("span.delMemo").click(() => obj.del() );			// 삭제
	
	this.bar.children("span.updateSbj").click(() => obj.updateSbj() );	// 저장
	
	// 메모 추가(생성)
//	if (!sticky) {
//		note.find(".stickyEdit").attr("contenteditable", "true").focus();
//		this.save();
//	}
};

//저장 클릭하면 과목에 저장
Sticky.prototype.updateSbj = function () {
	alert("저장 - 과목 선택");
	
	var note = this.note;
//	let status = $("input[name='updateSbj']:checked").val();
	
	// 저장메모 탭에서도 과목변경이 가능해야 하는데 어떻게 해결할 것인지?
	if ( $("#nonSave").is(':checked') ) {
		alert("임시메모 선택중 ..");
		
		let checkedSbj = $("input[name='subject']:checked").val();
		
		$.get(
				"updateMemoSbj.do",
				{
					sbjNo : checkedSbj,
					memoNo : note.attr("data-noteNo")
				}
		).done(function (result) {
			note.remove();
		});
	}
};

// 임시 메모 수정 내용 저장
Sticky.prototype.edit = function () {
	var note = this.note;
	$.get(
		"editNonsaveMemo.do",
		{
			memoNo : note.attr("data-noteno"),
			content: note.children(".stickyEdit").html(),
		},
		function (data) {
			note.find(".edit-saveMemo").css("display", "none");
			note.find(".stickyEdit").attr("contenteditable", "false");
		}
	);
};

// 메모 데이터 저장(생성시)
Sticky.prototype.save = function () {
	var note = this.note;
	let sbjNo = $("input[name='subject']:checked").val();
	
	$.get(
		"addMemo.do",
		{
			memberNo,
			content: note.children(".stickyEdit").html(),
			sbjNo
		},
		function (result) {
			// 생성한 메모번호 받아와서 속성 설정해주기
//			note.attr("data-noteNo", result.memoNo);
		}
	);
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









// 과목 선택시 해당하는 메모만 보이게
//$(".nonSave, .save").click(function (){
//	let sbjNo = $("input[name='subject']:checked").val();
//	
//	$.get(
//		""
//	);
//	
//});