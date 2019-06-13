// 로딩시 메모장 불러오기
$(function () {
	$.ajax({
		url:  "loading.do",
		dataType: "json"
	})
	.done(function (memoList) {
		console.log("결과 -- ")
		console.dir(memoList);

		if(memoList.length == 0) {
			$("#stickyContainer").append("<div>아직 작성한 메모가 없네요!</div>");
		}
		
		$(memoList).each(function (i) {
			console.log("반복 ..");
			if(memoList[i].save == 'N'){
				
			} else {
				
			}
			new Sticky().createSticky($(this));
		});
	});	
});

// 메모장 생성
//var createSticky = () => {
//	var sticky = new Sticky();
//	sticky.createSticky();
//};

// 메모장 인스턴스
function Sticky() {
	this.note = null;
	this.editObj = null;
	this.bar = null;
}

// 메모장 화면 구현
Sticky.prototype.createSticky = function (sticky) {
	var obj = this;
	this.editObj = $("<div></div>").addClass("stickyEdit").attr("contenteditable", "false");
	this.bar = $("<div></div>")
	           .addClass("stickyBar")
	           .append('<div class="memobar checkDiv"><input type="checkbox" name="memo" value="" /></div>')
	           .append('<span class="memobar editMemo">수정</span>')
	           .append('<span class="memobar edit-saveMemo">변경</span>')
	           .append('<span class="memobar delMemo">삭제</span>')
	           .append('<span class="memobar sort">저장</span>');
	
	var note = $("<div></div>").addClass("stickyNote")
	                           .append(this.bar)
	                           .append(this.editObj);
	
//	$("#stickyContainer").append(note);
	$(".nonSavePage").append(note);

	// 데이터베이스에서 자료를 가져온 경우
	if (sticky) {
		// 노트 번호
		note.attr("data-noteNo", sticky.attr("memoNo"));
		// content 내용
		note.children(".stickyEdit").html(sticky.attr("content"));
	}

	this.note = note;
	
	// 수정
	this.bar.children("span.editMemo").click(function () {
		let saveBtn = note.find(".edit-saveMemo");
		saveBtn.css("display", "block");
		
		let editNote = note.find(".stickyEdit");
		editNote.attr("contenteditable", "true");
	});
	// 수정 내용 저장
	this.bar.children("span.edit-saveMemo").click(() => obj.edit() );

	// 삭제
	this.bar.children("span.delMemo").click(() => obj.del() );
	
	// 메모 분류, 저장 
	this.bar.children("span.saveMemo").click(() => obj.sort() );
	
	// 임시메모 과목에 저장
//	if (!sticky) {
//		this.save();
//	}
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
		}
	);
};

// 메모 데이터 저장(생성시)
//Sticky.prototype.save = function () {
//	var note = this.note;
//	var pos = note.offset();
//	$.get(
//		"<c:url value='save.json'/>",
//		{x: pos.left, y: pos.top, color: this.color},
//		function (data) {
//			note.attr("id", data.id)
//		}
//	);
//};

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

// 저장 클릭하면 과목에 저장
Sticky.prototype.sort = function () {
	// 클릭한 과목번호 가져오기
	// 메모에 해당과목값 설정, 저장여부 변경 (N -> Y) 
};







// 임시메모 or 저장메모 클릭 :::: 구현 중
$(".nonSave, .save").click(function (){
	alert("클릭");
	
	// 해당메뉴 페이지 보이게 구현 
	let name = $(this).attr("class");
	alert(name + "name!");
	
	// 선택메뉴 표시
	$(".choiceMenu div").removeClass("checked-menu")
	$(this).addClass("checked-menu");
	
	
	// 선택한 메뉴에 해당하는 페이지 show
	console.dir($("."+name+"Page"));
	$("."+name+"Page").show();
	
});