
$(function () {
	attend();
	$("#attendBtn").text(localStorage.getItem('status'));
	$("#att-status").text(localStorage.getItem('status'));
//	console.dir(location.pathname.indexOf("/todo"))
	let topMenu = ["/notice", "/qna", "/video", "/todo", "/memo", "/dictionary", "/canvas", "/employment"]
	
	for (let i = 0; i < topMenu.length; i++) {
		if (location.pathname.indexOf(topMenu[i]) == -1) continue;
		
		menuIndex = i;
		break;
	}
//	menuIndex = menuIndex || 0;
	$(".menu-wrapper > .menu").removeClass("active").eq(menuIndex).addClass("active")
});
function attend(){
	let memberNo = $("input[name='memberNo']").val();
	let date = new Date();
		$.ajax({
			url:"/flyingturtle/user/attend/isCheck.do",
			data:{
				memberNo:memberNo
			}
		})
		.done(function(result) {
			console.log(result);
			if(result == 0){
				localStorage.removeItem("status");
				localStorage.setItem("status","출석");
			}
			else{
				$.ajax({
					url:"/flyingturtle/user/attend/selectCheckOut.do",
					data:{memberNo:memberNo
						},
					dataType:"json",
					success : function(result){
						console.log(result);
						/*alert(result.checkOut);*/
						if(result.checkOut == null){
							localStorage.removeItem("status");
							localStorage.setItem("status","출석완료");
						}
					}
							
				});
			}
		});
};

var status = "";
$("#attendance").click(function(e) {
	e.preventDefault();
	let memberNo = $("input[name='memberNo']").val();
	let date = new Date();
		$.ajax({
			url:"/flyingturtle/user/attend/isCheck.do",
			data:{
				memberNo:memberNo
			}
		})
		.done(function(result) {
			if(result == 1){
				let date = new Date().toTimeString();
				if(date<'18:20:00'){
					let check = confirm("조퇴하시겠습니까?");
					if(check){
						localStorage.removeItem("status");
						localStorage.setItem("status","조퇴완료");
						
						$.ajax({
							url:"/flyingturtle/user/attend/checkOut.do",
							data:{
								memberNo:memberNo
							}
						})
						.done(function(result){
							swal("조퇴 성공", "You clicked the button!", "success");
						});
					}
				}
				}
				else if(date >='18:20:00'){	
					let check = confirm("퇴실하시겠습니까?");
				
					if(check){
						localStorage.removeItem("status");
						localStorage.setItem("status","퇴실완료");
						$.ajax({
							url:"/flyingturtle/user/attend/checkOut.do",
							data:{
								memberNo:memberNo
							}
						})
						.done(function(result){
							swal("퇴실 성공", "You clicked the button!", "success");
						});
					}
				}
			else{
				localStorage.removeItem("status");
				localStorage.setItem("status","출석완료");
				$.ajax({
					url: "/flyingturtle/user/attend/checkIn.do",
					data:{
						memberNo: memberNo
					}
				})
				.done(function(result){
					console.log("성공");
					swal("출석 성공", "You clicked the button!", "success");
				});
			}
		});
	
});