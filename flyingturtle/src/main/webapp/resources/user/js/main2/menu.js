$("#attendance").submit(function(e) {
	e.preventDefault();
	let memberNo = $("input[name='memberNo']").val();
		$.ajax({
			url: "/flyingturtle/user/attend/checkIn.do",
			data:{
				memberNo: memberNo
			}
		})
		.done(function(result){
			
		});
});