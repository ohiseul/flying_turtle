
$( function() {
	
	$(".buttonList1").on("click",".menuInput",function() {
		var num = $(this).attr("data-sbjno");
		console.log(num);
		location.href = "/flyingturtle/user/video/list.do?subjectNo="+num;
	});
});