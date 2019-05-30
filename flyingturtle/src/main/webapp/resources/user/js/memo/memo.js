window.onload = function() {
	$('head').append(`<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/memo/memo.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/flyingturtle/resources/user/css/memo/sweet/sweetalert2.min.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/resources/user/js/memo/sweet/sweetalert2.all.min.js""/>"></script>`);

};



"<c:url value='commentwrite.do'/>",
$(function () {
	$.ajax({
		url:  "<c:url value='list.json'/>",
		dataType: "json"
	})
	.done(function (sList) {
		$(sList).each(function () {
			new Sticky().createSticky($(this));
		});
	});	
});

var createSticky = () => {
	var sticky = new Sticky();
	sticky.createSticky();
};

function Sticky() {
	this.note = null;
	this.color = null;
	this.editObj = null;
	this.bar = null;
	this.foldYn = 'n';
	this.fixedYn = 'n';
}

Sticky.prototype.createSticky = function (sticky) {
	var obj = this;
	this.color = sticky ? sticky.attr("color") : $("#color").val();
	this.editObj = $("<div></div>").addClass("stickyEdit").attr("contenteditable", "true").css("background-color", this.color);
	this.bar = $("<div></div>")
	           .addClass("stickyBar")
	           .append('<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>')
	           .append('<span class="glyphicon glyphicon-pushpin" aria-hidden="true"></span>')
			   .append('<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>');
	
	var note = $("<div></div>").addClass("stickyNote")
	                           .append(this.bar)
	                           .append(this.editObj);
	
	$("#stickyContainer").append(note);	

	// drag 관련 설정
	note.draggable({
        stop: function() {
        	obj.edit();
        }
	})
	.keyup(function() {
		obj.edit();
	})
	.click(function () {
		if (obj.fixedYn == 'y') return ;
		
		$(this).draggable("enable");
	})
	.dblclick(function () {
		$(this).draggable("disable");
	});
	
	// 데이터베이스에서 자료를 가져온 경우	
	if (sticky) {
		note.attr("id", sticky.attr("id"))
		    .css({"position": "absolute", "left": sticky.attr("x") + "px", "top": sticky.attr("y") + "px", "background": sticky.attr("color")});
		note.children(".stickyEdit").html(sticky.attr("content"));
		
		if (sticky.attr("foldYn") == 'y') {
			note.addClass("h20");
			this.bar.children("span:first-child").removeClass("glyphicon-chevron-up").addClass("glyphicon-chevron-down");
		}
		if (sticky.attr("fixedYn") == 'y') {
			this.fixedYn = "y";
			this.bar.children("span.glyphicon-pushpin").addClass("bgchoice");
			note.draggable("disable");
		}
	};	

	this.note = note;
	
	this.bar.children("span.glyphicon-trash").click(() => obj.del());
	
	this.bar.children("span.glyphicon-pushpin").click(function (event) {
		$(this).toggleClass("bgchoice");
		if (obj.fixedYn == "n") {
			obj.fixedYn = "y";
			$(this).parent().parent().draggable("disable");
		}
		else {
			obj.fixedYn = "n";
			$(this).parent().parent().draggable("enable");
		}
		obj.edit();
		
		return false;
	});
	
	this.bar.children("span.glyphicon-chevron-up, span.glyphicon-chevron-down").click(function () {
		obj.note.toggleClass("h20");
		setTimeout(() => {
			$(this).toggleClass("glyphicon-chevron-up");
			$(this).toggleClass("glyphicon-chevron-down");		
			
			// 접히지 않은 상태
			if ($(this).hasClass("glyphicon-chevron-up")) {
				obj.foldYn = 'n';
			}
			else {
				obj.foldYn = 'y';
			}
			obj.edit();
		}, 500);
	});
	
	
	// 화면에서 메모 추가 버튼을 최초 누른 경우
	if (!sticky) {
		this.save();
	}
};

// 최초 메모 생성시 데이터 저장
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

// 최초 메모 생성시 데이터 저장
Sticky.prototype.del = function () {
	
	swal({
	    title: '삭제하시겠습니까?',
	    text: "",
	    type: 'warning',
	    showCancelButton: true,
	    confirmButtonColor: '#3085d6',
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

Sticky.prototype.edit = function () {
	var note = this.note;
	var pos = note.offset();
	$.get(
			"<c:url value='edit.json'/>",
		{id: note.attr("id"), x: pos.left, y: pos.top, content: note.children(".stickyEdit").html(), foldYn: this.foldYn, fixedYn: this.fixedYn},
		function (data) {}
	);
};