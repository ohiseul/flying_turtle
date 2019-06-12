
// 로딩시 메모장 불러오기
$(function () {
	$.ajax({
		url:  "loading.do",
		dataType: "json"
	})
	.done(function (memoList) {
		console.log("결과 -- ")
		console.dir(memoList);
		$(memoList).each(function () {
			console.log("반복 ..");
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

// 메모장 화면 구현 함수
Sticky.prototype.createSticky = function (sticky) {
	var obj = this;
	
	this.
	
	
	
	this.editObj = $("<div></div>").addClass("stickyEdit").attr("contenteditable", "false");
	this.bar = $("<div></div>")
	           .addClass("stickyBar")
	           .append('<div class="memobar checkDiv"><input type="checkbox" name="memo" value="" /></div>')
	           .append('<span class="memobar editMemo">수정</span>')
	           .append('<span class="memobar delMemo">삭제</span>');
	
	var note = $("<div></div>").addClass("stickyNote")
	                           .append(this.bar)
	                           .append(this.editObj);
	
	$("#stickyContainer").append(note);

	// 데이터베이스에서 자료를 가져온 경우
	if (sticky) {
		// 노트 번호
		note.children(".input[type=checkbox]").attr("value", sticky.attr("memoNo"));
		// content 내용
		note.children(".stickyEdit").html(sticky.attr("content"));
	};

	this.note = note;
	
	// 수정
	this.bar.children("span.editMemo").click(function () {
		let editNote = note.find(".stickyEdit");
		editNote.attr("contenteditable", "true");
	});
	
	// 삭제
	this.bar.children("span.delMemo").click(() => obj.del() );
	
	// 화면에서 메모 저장 버튼을 최초 누른 경우 저장
	if (!sticky) {
		this.save();
	}
};

// 메모 데이터 저장
Sticky.prototype.save = function () {
	var note = this.note;
	var pos = note.offset();
	$.get(
		"<c:url value='save.json'/>",
		{x: pos.left, y: pos.top, color: this.color},
		function (data) {
			note.attr("id", data.id)
		}
	);
};

// 메모 데이터 삭제
Sticky.prototype.del = function () {
	swal({
	    title: '삭제하시겠습니까?',
	    text: "",
	    type: 'warning',
	    showCancelButton: true,
	    confirmButtonColor: '#003876',
	    cancelButtonColor: '#d33',
	    confirmButtonText: 'confirm'
	}).then((result) => {
	    if (result.value) {
			var note = this.note;
			// 화면 제거
			$.get(
					"<c:url value='del.json'/>",
				{id: note.attr("id")},
				function (data) {
					note.remove();			
				}
			);
	    }
	});
};

/*
// 메모 데이터 수정
Sticky.prototype.edit = function () {
	var note = this.note;
	var pos = note.offset();
	$.get(
			"<c:url value='edit.json'/>",
		{id: note.attr("id"), x: pos.left, y: pos.top, content: note.children(".stickyEdit").html(), foldYn: this.foldYn, fixedYn: this.fixedYn},
		function (data) {}
	);
};
*/









/*var note = $(".stickyNote");

console.dir(note);

note.find(".editMemo").click(function () {
	alert("클릭함");
	console.dir($(this));
	$(this).attr("contenteditable", "true");
});
*/


