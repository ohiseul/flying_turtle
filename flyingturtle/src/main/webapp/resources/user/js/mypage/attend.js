/*출석현황 보기*/
$(".attendance").click(function(){ 
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	month = (month<10 ? '0' +month : month);
	  for(let i = 2017 ; i <= year ; i++) {
          $('#year').append('<option value="' + i+ '">' + i + '년</option>');
      }
	  for(let i=1; i <= 12; i++) {
          var mon = i > 9 ? i : "0"+i ;            
          $('#months').append('<option value="' + mon + '">' + mon + '월</option>');    
       }    
	  
	  $("#year > option[value="+year+"]").attr("selected","true");
	  $("#months > option[value="+month+"]").attr("selected","true");
	let memberNo = $("input[name='memberNo']").val();
	console.log(memberNo);
	$.ajax({
		url:"/flyingturtle/user/attend/attendList.do?month="+(date.getYear()+1900)+""+month,
		data:{memberNo:memberNo
			},
		dataType:"json",
		success : function(result){
			console.dir(result);
			console.log(result,"result");
			html="";
			for(let i = 0; i<result.length;i++){
				let data = result[i];
				var checkIn = new Date(data.checkIn);
				var checkOut = new Date(data.checkOut);
				var regDate = new Date(data.attendRegDate).toLocaleDateString();
				html +=`<div class="attend">
					<span id="regdate"><h5>${regDate}</h5></span>
					<div><h6>입실:${checkIn.getHours()+':'+checkIn.getMinutes()}</h6></div>`;
					if( checkOut.getHours() == '9' ){
						html += `<div><h6>퇴실: -&nbsp;&nbsp;&nbsp; </h6></div>`;
					}
					else{
						html += `<div><h6>퇴실:${checkOut.getHours()+':'+checkOut.getMinutes()}</h6></div>`;
					}
				html += `<div id="codeName"><h5>${data.codeName}</h5></div>
					</div>`;
			}
			$(".attend-area").html(html);
		}
	});
});
// selectbox 선택 시 
$("#months").change(function(){
	var year = $("#year").val();
	var month = $(this).val();
	var date = year+month;
	let memberNo = $("input[name='memberNo']").val();
	$.ajax({
		url:"/flyingturtle/user/attend/attendList.do",
		data:{memberNo:memberNo,
			month:date
			},
		dataType:"json",
		success : function(result){
			console.dir(result);
			console.log(result,"result");
			html="";
			for(let i = 0; i<result.length;i++){
				let data = result[i];
				var checkIn = new Date(data.checkIn);
				var checkOut = new Date(data.checkOut);
				var regDate = new Date(data.attendRegDate).toLocaleDateString();
				html +=`<div class="attend">
					<span id="regdate"><h5>${regDate}</h5></span>
					<div><h6>입실:${checkIn.getHours()+':'+checkIn.getMinutes()}</h6></div>
					<div><h6>퇴실:${checkOut.getHours()+':'+checkOut.getMinutes()}</h6></div>
					<div id="codeName"><h5>${data.codeName}</h5></div>
					</div>`;
			}
			$(".attend-area").html(html);
		}
	});
});



