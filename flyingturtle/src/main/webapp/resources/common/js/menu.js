var memberNo = $("input[name='memberNo']").val();
var loginMemberId = $("input[name='loginMemberId']").val();
var date = new Date().toTimeString();
var jqueryObj = $;

$(function () {
	"<script src='flyingturtle/resources/common/js/notify.js'></script>}"

// console.dir(location.pathname.indexOf("/todo"))
	let topMenu = ["/notice","/employment","/qna", "/todo", "/dictionary", "/video", "/memo", "/canvas"]
	menuIndex = -1;	
	for (let i = 0; i < topMenu.length; i++) {
		if (location.pathname.indexOf(topMenu[i]) == -1) continue;
		
		menuIndex = i;
		break;
	}
// menuIndex = menuIndex || 0;
	console.log(menuIndex, menuIndex || menuIndex == 0);
	if(menuIndex >= 0) $(".menu-wrapper > .menu").removeClass("active").eq(menuIndex).addClass("active");
	
	
	socket.emit("notelogin", loginMemberId);
	
	socket.on("notemsg", function (msg) {
		// 알림...
		jqueryObj.notify(msg, "info");
	});
});
attend();
cnt();
$("#attendBtn").text(localStorage.getItem('status'));
$("#att-status").text(localStorage.getItem('status'));
function cnt(){
	$.ajax({
		url:"/flyingturtle/user/main/attendCnt.do",
		data:{memberNo:memberNo}
	})
	.done(function(result){

		if(result.length == 0){
            html="";
            html += `<div class="attend-area">
                        <div class="attendCnt">전체</div>
                        <div class="attendCnt">0회</div>
                    </div>
                    <div class="attend-area">
                        <div class="attendCnt">출석</div>
                        <div class="attendCnt">0회</div>
                    </div>
                    <div class="attend-area">
                        <div class="attendCnt">지각</div>
                        <div class="attendCnt">0회</div>
                    </div>
                    <div class="attend-area">
                        <div class="attendCnt">조퇴</div>
                        <div class="attendCnt">0회</div>
                    </div>
                    <div class="attend-area">
                        <div class="attendCnt">결석</div>
                        <div class="attendCnt">0회</div>
                    </div>`
		}
		else{
			html="";
			html += `<div class="attend-area">
				<div class="attendCnt">전체</div>
				<div class="attendCnt">${result.allCount}회</div>
				</div>
				<div class="attend-area">
				<div class="attendCnt">출석</div>
				<div class="attendCnt">${result.checkInCount}회</div>
				</div>
				<div class="attend-area">
				<div class="attendCnt">지각</div>
				<div class="attendCnt">${result.lateCount}회</div>
				</div>
				<div class="attend-area">
				<div class="attendCnt">조퇴</div>
				<div class="attendCnt">${result.earlyCount}회</div>
				</div>
				<div class="attend-area">
				<div class="attendCnt">결석</div>
				<div class="attendCnt">${result.absentCount}회</div>
				</div>`
		}
			$("#attendCnt-area").html(html);
	})
};

function attend(){
	
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
				localStorage.setItem("status","출석전");
                $("#attendBtn").text(localStorage.getItem('status'));
                $("#att-status").text(localStorage.getItem('status'));
			}
			else{
				$.ajax({
					url:"/flyingturtle/user/attend/selectCheckOut.do",
					data:{memberNo:memberNo
						},
					dataType:"json",
					success : function(result){
						
						console.log("checkout 체크 ",result);
						// 체크인 시간이 9시 40분보다 늦으면 지각
						if(result.checkOut == null){
							let checkIn = new Date(result.checkIn).toTimeString();
							console.log("checkIn",checkIn);
							
							if(checkIn>'09:40:00'){
								localStorage.removeItem("status");
								localStorage.setItem("status","지각");
				                $("#attendBtn").text(localStorage.getItem('status'));
				                $("#att-status").text(localStorage.getItem('status'));
							}
							else if(checkIn<='09:40:00'){
								localStorage.removeItem("status");
								localStorage.setItem("status","출석완료");
								$("#attendBtn").text(localStorage.getItem('status'));
								$("#att-status").text(localStorage.getItem('status'));
							}
						}
						else {
							let checkOut = new Date(result.checkOut).toTimeString();
							if(checkOut<'18:20:00'){
								localStorage.removeItem("status");
								localStorage.setItem("status","조퇴완료");
								$("#attendBtn").text(localStorage.getItem('status'));
								$("#att-status").text(localStorage.getItem('status'));
								$("#attendBtn,#attendance").off("click");
							}
							else if(checkOut>='18:20:00'){
								localStorage.removeItem("status");
								localStorage.setItem("status","퇴실완료");
								$("#attendBtn").text(localStorage.getItem('status'));
								$("#att-status").text(localStorage.getItem('status'));
								$("#attendBtn,#attendance").off("click");
							}
						}
						
					}
							
				});
			}
		});
};


var status = "";
$("#attendance").click(function(e) {
	console.log("date",date);
	e.preventDefault();
		$.ajax({
			url:"/flyingturtle/user/attend/isCheck.do",
			data:{
				memberNo:memberNo
			}
		})
		.done(function(result) {
			
			if(result == 1){
				if(date<'18:20:00'){
					Swal.fire({
							title:'조퇴하시겠습니까?',
							type:'question',
							showCancelButton: true,
							confirmButtonColor: '#3085d6',
							cancelButtonColor: '#d33',
							confirmButtonText: 'Yes!'
					}).then ( (check) => {
						if(check.value){
							$.ajax({
								url:"/flyingturtle/user/attend/checkOut.do",
								data:{
									memberNo:memberNo
								}
							})
							.done(function(result){
								Swal.fire("조퇴 성공", "You clicked the button!", "success");
								$("#attendBtn").text("조퇴완료");
								$("#att-status").text("조퇴완료");
								$("#attendance").off("click");
							});
						}
						
					});
				}
				else{
					Swal.fire({
						title:'퇴실하시겠습니까?',
						type:'question',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33',
						confirmButtonText: 'Yes, delete it!'
				}).then( (check) => {
							if(check.value){
								$.ajax({
									url:"/flyingturtle/user/attend/checkOut.do",
									data:{
										memberNo:memberNo
									}
								})
								.done(function(result){
		
									Swal.fire("퇴실 성공", "You deleted the button!", "success");
									$("#attendBtn").text("퇴실완료");
									$("#att-status").text("퇴실완료");
									$("#attendance").off("click");
								});
							}
								
						});
			}
			}
			else if(result == 0){
				$.ajax({
					url: "/flyingturtle/user/attend/checkIn.do",
					data:{
						memberNo: memberNo
					}
				})
				.done(function(result){
					if(date<'09:40:00'){
						Swal.fire("출석 성공", "You clicked the button!", "success");
						$("#attendBtn").text("출석완료");
						$("#att-status").text("출석완료");
					}
					else{
						Swal.fire("지각입니다", "You clicked the button!", "success");
						$("#attendBtn").text("지각");
						$("#att-status").text("지각");
					}
				});
			}
			
		});

		
		
});