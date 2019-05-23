window.onload = function() {
	$('head').append(`<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<link rel="stylesheet" href="/flyingturtle/resources/user/css/video/subject.css">
	<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/write.css">`);
};

//editer js는 js파일에 들어가면 실행이 안됨 몇번이나 시도함

$( function() {
	
	$(".buttonList1").on("click",".menuInput",function() {
		alert("한번");
		var num = $(this).attr("data-sbjno");
		console.log(num);
		location.href = "/flyingturtle/user/video/list.do?subjectNo="+num;
	});

	});