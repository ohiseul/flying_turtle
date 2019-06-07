$(function () {
//	console.dir(location.pathname.indexOf("/todo"))
	let topMenu = ["/notice", "/qna", "/video", "/todo", "/dictionary", "/canvas", "/attend", "/employment"]
	
	for (let i = 0; i < topMenu.length; i++) {
		if (location.pathname.indexOf(topMenu[i]) == -1) continue;
		
		menuIndex = i;
		break;
	}
//	menuIndex = menuIndex || 0;
	$(".menu-wrapper > .menu").removeClass("active").eq(menuIndex).addClass("active")
});

$("#attendance").submit(function(e) {
	e.preventDefault();
	let memberNo = $("input[name='memberNo']").val();
		$.ajax({
			url:"/flyingturtle/user/attend/isCheck.do",
			data:{
				memberNo:memberNo
			}
		})
		.done(function(result) {
			if(result == 1){
				let check = confirm("퇴실하시겠습니까?");
				if(check){
					$.ajax({
						url:"/flyingturtle/user/attend/checkOut.do",
						data:{
							memberNo:memberNo
						}
					})
					.done(function(result){
						swal("퇴실 성공", "You clicked the button!", "success");
						$("#attendBtn").text("퇴실완료");
					});
				}
			}
			else{
				$.ajax({
					url: "/flyingturtle/user/attend/checkIn.do",
					data:{
						memberNo: memberNo
					}
				})
				.done(function(result){
					console.log("성공");
					swal("출석 성공", "You clicked the button!", "success");
					$("#attendBtn").text("퇴실");
				});
			}
		});
	
});