<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 소켓 관련  -->
<script src="http://203.236.209.132:10001/socket.io/socket.io.js"></script>
<input type="hidden" id="beginStatus" value="2">

<div id="basicModal" class="idontknowModal">
	<div class="idontknowModal-content"
		style="margin-top: 50px; width: 600px; min-height: 430px; height: auto; 
		       position: absolute; left: 30%;">
		<span class="idontknowCloseBtn" style="position: relative; top: 10px;">&times;</span>
		<input id="studentId" type="hidden" value="${sessionScope.user.id}">
		<div class="adm-top-title" style="display: inline; margin-bottom: 20px;
    								font-size: 15px; font-weight: bold;">
			<c:choose>
				<c:when test="${sessionScope.user.id eq 'test'}">
           <br>관리자 화면입니다.<br>
					<div id="idDiv" style="margin: 10px 0px;">
						총인원:&nbsp; <span id="totalperson" style="color: #003876;">0</span>&nbsp; 명&nbsp;
						<hr>
					</div>
				</c:when>
				<c:when
					test="${sessionScope.user.id ne 'test' && sessionScope.user.id eq sessionScope.user.id }">
					<div id="personalstudentAlert" style="border-bottom: 3px solid #003876; padding: 10px;">
						선생님을 기다리는 중입니다
					</div>
					<div id="statusBox" style="margin: 20px;">
						<input type="radio" name="status" value="알아요" /> <span class="up">알아요</span>
						<input type="radio" name="status" value="몰라요" /> <span class="up">몰라요</span>&nbsp;&nbsp;
						<button onclick="statusSubmit();" class="submitBtn">전송</button>
					</div>
				</c:when>
			</c:choose>
		</div>
		<table id="idkImgBox" style="width: 600px; height: 300px; margin-top: 5px;">
	
	 	<colgroup>
		    <col style="width:50%" />
		    <col style="width:50%" />		    
	  	</colgroup>		
	  	<tr>
			<td style="font-size: 20px; height:20px;">알아요: <span id="knowpersone">0</span> 명</td>
			<td style="font-size: 20px; height:20px;">몰라요: <span id="dontpersone">0</span> 명</td>
		</tr>
		<tr>
			<td>
				<div class="inneridkImgBox" id="allK">
					<img id="iknowimg" alt="알아요" style="width: 40px; height: 40px;"
						src="<c:url value="/resources/images/idontknow/k.png"/>">
				</div>
			</td>
			<td>
				<div class="inneridkImgBox" id="allD" >
					<img id="idontimg" alt="몰라요" style="width: 40px; height: 40px;"
						src="<c:url value="/resources/images/idontknow/d.png"/>">
				</div>
			</td>
		</tr>
		<tr>
			<td id="percentK"></td>
			<td  id="percentD"></td>
		</tr>
	
		</table>
		
		<c:choose>
				<c:when test="${sessionScope.user.id eq 'test'}">
				<div>
				<br>
					<div class="cnt-student-list yes" style="width: 100px;
    					border-top-right-radius: 5px; background: navy;
    					color: white;"> 알아요한 학생들 </div>
					<ul id="whoResultK" style="border-top: 1px solid navy; padding: 10px;"></ul><br> 
					<div class="cnt-student-list no" style="width: 100px;
    					border-top-right-radius: 5px; background: pink;
    					font-weight: bold;"> 몰라요한 학생들 </div>
					<ul id="whoResultD" style="border-top: 1px solid pink; padding: 10px;"></ul><br>
				</div>
				</c:when>
			</c:choose>
	</div>
</div>

<script>
//=============================================================================node 관련  스트립트
var totalpwesone= 0;
var knowpersone = 0;
var dontpersone =0;

let socket;

// 연결 요청 : 서버 접속하기
socket = io.connect("http://203.236.209.132:10001");
//로그인=================
	$("#modalBtn").click(function () {
            socket.emit("login", $("#studentId").val());
	});


	//입장한 사람 인원 업데이트
    socket.on("welcom", function (data) {
    	$("#totalperson").html(data.total);
		$("#knowpersone").html(data.personK);
		$("#dontpersone").html(data.personD);
    	totalpwesone = data.total;
	});	
    //선생님 들어오시면 아이들에게 알람
    socket.on("teacher", function (data) {
  		 $('#personalstudentAlert').html(data);
  		 $("#beginStatus").val(1);
  			noEvent();
			document.onkeydown = noEvent;
	});
    
    
  // 새로 고침 방지
function noEvent() {    		
        if ($("#beginStatus").val() == "1") {
            if (event.keyCode == 116) {
                alert("새로고침을 할 수 없습니다.");
                event.keyCode = 2;
                return false;
            } else if (event.ctrlKey
                    && (event.keyCode == 78 || event.keyCode == 82)) {
                return false;
            }
        }
document.onkeydown = noEvent;
}

//로그아웃================
	$(".idontknowCloseBtn").click(function () {
		    socket.emit("logOut", $("#studentId").val());
	});
	
    //선생님이 나가시면 알람+학생화면 초기화
    socket.on("teacherOut", function (data) {
    	//인원변수 초기화
     	 $("#totalperson").html(data.total)
    	 $("#knowpersone").html(data.personK);
    	 $("#dontpersone").html(data.personD);
 	     totalpwesone = data.total;
	     knowpersone = data.personK;
	     dontpersone = data.personD;
	    //선생님 리스트 비우기
    	 $("#whoResultD").empty();
    	 $("#whoResultK").empty();
	    //아이들에게 알림
  		$("#personalstudentAlert").html(data.msg);
  		//이미지 초기화
  		$("#idkImgBox").html(
  			`<tr>
  				<td style="font-size: 20px; height:20px;">알아요: <span id="knowpersone">0</span> 명</td>
  				<td style="font-size: 20px; height:20px;">몰라요: <span id="dontpersone">0</span> 명</td>
  			</tr>
  			<tr>
  				<td>
  					<div class="inneridkImgBox" id="allK">
  						<img id="iknowimg" alt="알아요" style="width: 40px; height: 40px;"
  							src="<c:url value="/resources/images/idontknow/k.png"/>">
  					</div>
  				</td>
  				<td>
  					<div class="inneridkImgBox" id="allD" >
  						<img id="idontimg" alt="몰라요" style="width: 40px; height: 40px;"
  							src="<c:url value="/resources/images/idontknow/d.png"/>">
  					</div>
  				</td>
  			</tr>
  			<tr>
				<td id="percentK"></td>
				<td  id="percentD"></td>
			</tr>`
		);
  		$("#beginStatus").val(2);
   		noEvent();
  		 
document.onkeydown = noEvent;
	});
            
//상태값 노드로 전송================     
function statusSubmit() {
	//이미 이전에 들어와있는 학생을 체크하기 위해서 로그인 처리 한번 더 
	socket.emit("login", $("#studentId").val());
	
   	if($('input[name="status"]:checked').val() != null){
       	if($('input[name="status"]:checked').val()=='몰라요'){
       		console.log("몰라요다?");
               // 노드로 데이터 전송
   	            socket.emit(
   	                "dont", 
   	                {
   	                    recvId: "test",
   	                    sendId:$("#studentId").val()
   	                }
   	            );
           	}
         if($('input[name="status"]:checked').val()=='알아요'){
        	 console.log("알아요다?");
                   socket.emit(
                           "know", 
                           {
                               recvId: "test",
                               sendId:$("#studentId").val()
                           }
                       );
           	}
   		$("#statusBox").html(`전송완료 <button onclick="rechoice();" class="submitBtn"
   			style="position: relative;left: 30px;"> 다시선택 </button>`
   		);
   		
    } else {
   		alert("상태값을 선택해주세요");
   	}
}

//다시선택누르면
function rechoice() {
	socket.emit("rechoice", $("#studentId").val());	
	
    socket.on("renum", function (data) {
      	knowpersone = data.personK;
    	dontpersone = data.personD;
      	 $("#knowpersone").html(data.personK);
    	 $("#dontpersone").html(data.personD);
    	 
    	 var pk = knowpersone/totalpwesone*100;
    	 var pd = dontpersone/totalpwesone*100;
    	 $("#percentK").html(pk.toFixed(0)+`%`);
    	 $("#percentD").html(pd.toFixed(0)+`%`);
    	 
    	 //이미지 크기
    	 if( pd >= 51 && dontpersone >4){    		 
        	 $("#idontimg").attr("src",'<c:url value="/resources/images/idontknow/allD.png"/>');
        	 $("#idontimg").attr("width","240");
        	 $("#idontimg").attr("height","300");
       	 }else if(pd <51){
       		 	$("#idontimg").attr("src","<c:url value="/resources/images/idontknow/d.png"/>");
       	}
       	if(dontpersone>=1){
        	 $("#idontimg").css("transform","scale("+dontpersone+"."+dontpersone+")");    		 
        }
       	
        if(pk >= 51 && knowpersone >4){    		 
        	 $("#iknowimg").attr("src",'<c:url value="/resources/images/idontknow/allK.png"/>');
        	 $("#iknowimg").attr("width","240");
        	 $("#iknowimg").attr("height","300");	 
      	 }else if(pk <51){
	      	$("#iknowimg").attr("src","<c:url value="/resources/images/idontknow/k.png"/>");  			 
  		 }
      		 
      	if(knowpersone>=1){
      		$("#iknowimg").css("transform","scale("+knowpersone+"."+knowpersone+")");        
      	 }
    });
	
    $("#statusBox").html(`<input type="radio" name="status" value="알아요" /> 
			          	  <span class="up">알아요</span>&nbsp;&nbsp; 
			          	  <input type="radio" name="status" value="몰라요" /> 
			          	  <span class="up">몰라요</span>
			          	  <button onclick="statusSubmit();" class="submitBtn">전송</button>`
	);
}


//몰라요==================
        //선생님이 아이들 몰라요 보는거 
        socket.on("whoDont", function (data) {
        	if($("#whoResultD").html().includes(data)==false){ 
	        	console.log("몰라요 값 왔어");
	        	$("#K"+data).remove();
	        	$("#whoResultD").append('<li id="D'+data+'">'+data+'</li>');
	    	}else{
	    		console.log("학생이 또 같은 값을 선택했네요");
	    	}
        });
        //차트에 몰라요 수 변동
        socket.on("dknum", function (data) {
          	knowpersone = data.personK;
        	dontpersone = data.personD;
          	 $("#knowpersone").html(data.personK);
        	 $("#dontpersone").html(data.personD);
        	 var pk = knowpersone/totalpwesone*100;
        	 var pd = dontpersone/totalpwesone*100;
        	 $("#percentK").html(pk.toFixed(0)+`%`);
        	 $("#percentD").html(pd.toFixed(0)+`%`);
        	 //이미지 크기
        	 if( pd >= 51 && dontpersone >4){    		 
            	 $("#idontimg").attr("src",'<c:url value="/resources/images/idontknow/allD.png"/>');
            	 $("#idontimg").attr("width","240");
            	 $("#idontimg").attr("height","300");
           	 }else if(pd <51){
           		 	$("#idontimg").attr("src","<c:url value="/resources/images/idontknow/d.png"/>");
           	}
           	if(dontpersone>=1){
            	 $("#idontimg").css("transform","scale("+dontpersone+"."+dontpersone+")");    		 
            }
           	
            if(pk >= 51 && knowpersone >4){    		 
            	 $("#iknowimg").attr("src",'<c:url value="/resources/images/idontknow/allK.png"/>');
            	 $("#iknowimg").attr("width","240");
            	 $("#iknowimg").attr("height","300");	 
          	 }else if(pk <51){
    	      	$("#iknowimg").attr("src","<c:url value="/resources/images/idontknow/k.png"/>");  			 
      		 }
          		 
          	if(knowpersone>=1){
          		$("#iknowimg").css("transform","scale("+knowpersone+"."+knowpersone+")");        
          	 }
//         	 if(dontpersone > 4 ){    		 
//             	 $("#allD").html(`<img id="idontimg" alt="많이몰라요" style="width: 240px; height: 300px;"
//          				src="<c:url value="/resources/images/idontknow/allD.png"/>">`);
//             	 }else{
//                 	var dh =  Number($("#idontimg").css("height").replace(/[^-\d\.]/g, ''))+(dontpersone*10);
//                 	var dw =  Number($("#idontimg").css("width").replace(/[^-\d\.]/g, ''))+(dontpersone*10);
//             	 	$("#idontimg").css("height",dh);    		 
//             	 	$("#idontimg").css("width",dw);     		 
//             	 }
//             	 if(knowpersone> 4 ){    		 
//             	 $("#allK").html(`<img id="idontimg" alt="많이몰라요" style="width: 240px; height: 300px;"
//         			src="<c:url value="/resources/images/idontknow/allK.png"/>">`);
//                	 }else{
//                 	var kh =  Number( $("#iknowimg").css("height").replace(/[^-\d\.]/g, ''))+(knowpersone*10);
//                 	var kw =  Number( $("#iknowimg").css("width").replace(/[^-\d\.]/g, ''))+(knowpersone*10);
//     	        	$("#iknowimg").css("height",kh);    	 
//     	        	$("#iknowimg").css("width",kw);     
//                	 }
        });
        //비활성화시 학생들이 보는 알람
        socket.on("dontf", function (data) {
        	$("#personalstudentAlert").html(data);
        });        
//알아요==================
        //선생님이 아이들 알아요 보는거 
        socket.on("whoKnow", function (data) {
        	if($("#whoResultK").html().includes(data)==false){        		
	        	console.log("알아요 값 왔어");
	        	$("#D"+data).remove();
	        	$("#whoResultK").append('<li id="K'+data+'">'+data+'</li>');
        	}else{
        		console.log("학생이 또 같은 값을 선택했네요");
        	}
        });
        //차트에 알아요 수 변동
        socket.on("knum", function (data) {
          	knowpersone = data.personK;
        	dontpersone = data.personD;
         	 $("#knowpersone").html(data.personK);
        	 $("#dontpersone").html(data.personD);
       	 var pk = knowpersone/totalpwesone*100;
    	 var pd = dontpersone/totalpwesone*100;
    	 $("#percentK").html(pk.toFixed(0)+`%`);
    	 $("#percentD").html(pd.toFixed(0)+`%`);
    	 //이미지 크기
    	 if( pd >= 51 && dontpersone >4){    		 
        	 $("#idontimg").attr("src",'<c:url value="/resources/images/idontknow/allD.png"/>');
        	 $("#idontimg").attr("width","240");
        	 $("#idontimg").attr("height","300");
       	 }else if(pd <51){
       		 	$("#idontimg").attr("src","<c:url value="/resources/images/idontknow/d.png"/>");
       	}
       	if(dontpersone>=1){
        	 $("#idontimg").css("transform","scale("+dontpersone+"."+dontpersone+")");    		 
        }
       	
        if(pk >= 51 && knowpersone >4){    		 
        	 $("#iknowimg").attr("src",'<c:url value="/resources/images/idontknow/allK.png"/>');
        	 $("#iknowimg").attr("width","240");
        	 $("#iknowimg").attr("height","300");	 
      	 }else if(pk <51){
	      	$("#iknowimg").attr("src","<c:url value="/resources/images/idontknow/k.png"/>");  			 
  		 }
      		 
      	if(knowpersone>=1){
      		$("#iknowimg").css("transform","scale("+knowpersone+"."+knowpersone+")");        
      	 }
//     	 if(dontpersone > 4 ){    		 
//         	 $("#allD").html(`<img id="idontimg" alt="많이몰라요" style="width: 240px; height: 300px;"
//      				src="<c:url value="/resources/images/idontknow/allD.png"/>">`);
//         	 }else{
//             	var dh =  Number($("#idontimg").css("height").replace(/[^-\d\.]/g, ''))+(dontpersone*10);
//             	var dw =  Number($("#idontimg").css("width").replace(/[^-\d\.]/g, ''))+(dontpersone*10);
//         	 	$("#idontimg").css("height",dh);    		 
//         	 	$("#idontimg").css("width",dw);     		 
//         	 }
//         	 if(knowpersone> 4 ){    		 
//         	 $("#allK").html(`<img id="idontimg" alt="많이몰라요" style="width: 240px; height: 300px;"
//     			src="<c:url value="/resources/images/idontknow/allK.png"/>">`);
//            	 }else{
//             	var kh =  Number( $("#iknowimg").css("height").replace(/[^-\d\.]/g, ''))+(knowpersone*10);
//             	var kw =  Number( $("#iknowimg").css("width").replace(/[^-\d\.]/g, ''))+(knowpersone*10);
// 	        	$("#iknowimg").css("height",kh);    	 
// 	        	$("#iknowimg").css("width",kw);     
//            	 }
        });
      	//비활성화시 학생들이 보는 알람
        socket.on("knowf", function (data) {
        	$("#personalstudentAlert").html(data);
        });
      	

//============================================================================모달관련 스트립트 
      //Get Elements & Store In Vars
      var modal = document.getElementById("basicModal");
      var modalBtn = document.getElementById("modalBtn");
      var closeBtn = document.getElementsByClassName("idontknowCloseBtn")[0];

      // Listeners For Open & Close
      modalBtn.addEventListener("click", openModal);
      closeBtn.addEventListener("click", closeModal);
      window.addEventListener("click", outerExit);

      // Func To Open Modal
      function openModal(e) {
         e.preventDefault();
         modal.style.opacity = "1";
         modal.style.display = "block";
      }

      // Func To Close Modal
      function closeModal(e) {
         e.preventDefault();
         modal.style.opacity = "0";
         modal.style.display = "none";
      }

      function outerExit(e) {
         if (e.target == modal) {
            e.preventDefault();
            modal.style.display = "none";
         }
      } // Get Elements & Store In Vars
      var modal = document.getElementById("basicModal");
      var modalBtn = document.getElementById("modalBtn");
      var closeBtn = document.getElementsByClassName("idontknowCloseBtn")[0];
      
      // Listeners For Open & Close
      modalBtn.addEventListener("click", openModal);
      closeBtn.addEventListener("click", closeModal);
      window.addEventListener("click", outerExit);

      // Func To Open Modal
      function openModal(e) {
         e.preventDefault();
         modal.style.opacity = "1";
         modal.style.height = "100%";
         
         /* 추가한css */
         modal.style.width = "100%";
      }

      // Func To Close Modal
      function closeModal(e) {
         e.preventDefault();
         modal.style.opacity = "0";
         modal.style.height = '0';
      }

      function outerExit(e) {
         if (e.target == modal) {
            e.e.preventDefault();
            modal.style.opacity = "0";
            modal.style.height = '0';
         }
      }
</script>