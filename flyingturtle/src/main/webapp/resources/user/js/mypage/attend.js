

/*출석현황 보기*/
$(".attendance").click(function(){  
	alert("클릭함");
	let memberNo = $("input[name='memberNo']").val();
	console.log(memberNo);
	$.ajax({
		url:"/flyingturtle/user/attend/attendList.do",
		data:{memberNo:memberNo
			},
		dataType:"json",
		success : function(result){
			console.dir(result);
			console.log(result,"result");
			html="";
			for(let i = 0; i<result.length;i++){
				console.log(result[i].codeName);
				html +=`<div class="attend">
					<span>${result[i].attendRegDate}</span>
					<div>${result[i].checkIn}</div>
					<div>${result[i].checkOut}</div>
					<div>${result[i].codeName}</div>
					</div>`;
			}
			$(".attend-area").html(html);
		}
	});
});



