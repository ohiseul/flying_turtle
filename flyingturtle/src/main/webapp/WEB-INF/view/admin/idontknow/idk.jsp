<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 소켓 관련  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://172.168.0.106:10001/socket.io/socket.io.js"></script>
 
<div id="basicModal" class="idontknowModal">
 <div class="idontknowModal-content">
   <span class="idontknowCloseBtn">&times;</span>
    <p>
       <input id="studentId" type="hidden" value="${sessionScope.user.id}">
    <c:choose>
        <c:when test="${sessionScope.user.id eq 'adtest'}">
           	관리자 화면입니다.<br>
			<div id="idDiv">학생인원:<div id="totalperson"></div></div>
		    		  <div id="whoin" style="border: 1px solid red; "></div>
		    		  <div id="whoout" style="border: 1px solid blue; "></div>
		    		  <div id="whoResult"></div>
		    <button id="pieResult">결과보기</button> 
        </c:when>
        <c:otherwise>
          	사용자 화면 입니다
          	<div id="studentAlert" style="border: 1px solid yellow; "></div>
          	<div id="statusBox">
          	  <input type="radio" name="status" value="몰라요" /> 
          	  <span class="up">몰라요</span>&nbsp;&nbsp; 
          	  <input type="radio" name="status" value="알아요" /> 
          	  <span class="up">알아요</span>
          	  <button id="statusSumit">전송</button>
          	</div>
          	      	        	
         </c:otherwise>
    </c:choose>

        <div id="app" class="container" >
                <div id="piechart">
                </div>
        </div>
   
    </p>
   </div>
</div>
<script>
//=============================================================================node 관련  스트립트
            var totalpwesone= 0;
            var knowpersone= 0;
            var dontpersone= 0;
        let socket;
            // 연결 요청 : 서버 접속하기
            socket = io.connect("http://172.168.0.106:10001");
//로그인=================
	$("#modalBtn").click(function () {
            socket.emit("login", $("#studentId").val());
	});
            socket.on("login", function (id) {
               	if($('#whoin').text().includes(id)==true){
               		console.log("이미있어");
               	}else if ($('#whoin').text().includes(id)==false){
            		$('#whoin').append('<li id="'+id+'">'+id+'</li>');
            		if(id != "선생님"){
	               		totalpwesone++;        			
	               		console.log("한명 들어왔네:"+totalpwesone+"명 됐다");
	               		$("#totalperson").html(totalpwesone);
            		}else{
            			alert("선생님 들어오셨어");
            		}
               	}
               		
            });
            
            socket.on("teacher", function (data) {
          		 $('#studentAlert').append('\n'+data+'\n');
       		});
//로그아웃================
	$(".idontknowCloseBtn").click(function () {
            socket.emit("loginOut", $("#studentId").val());
	});
            socket.on("loginOut", function (id) {
               		 $('#'+id).remove();
               		if(id != "선생님"){
               		totalpwesone--;
               		console.log("한명 나갔네:"+totalpwesone+"명 됐다");
             		}
            });
            socket.on("teacherOut", function (data) {
          		 $('#studentAlert').append('\n'+data+'\n');
       		});
//상태값 노드로 전송================     
   $("#statusSumit").click(function () {
   	if($('input[name="status"]:checked').val() != null){
       	if($('input[name="status"]:checked').val()=='몰라요'){
       		console.log("몰라요다?");
               // 노드로 데이터 전송
   	            socket.emit(
   	                "dont", 
   	                {
   	                    recvId: "adtest",
   	                    sendId:$("#studentId").val()
   	                }
   	            );
           	}
         if($('input[name="status"]:checked').val()=='알아요'){
        	 console.log("알아요다?");
                   socket.emit(
                           "know", 
                           {
                               recvId: "adtest",
                               sendId:$("#studentId").val()
                           }
                       );
           	}
   		$("#statusBox").html("전송완료");
    }else{
   		alert("상태값을 선택해주세요");
   	}
});
//몰라요==================
        //선생님이 아이들 몰라요 보는거 
        socket.on("dont", function (data) {
        	alert("몰라요 값 왔어");
        	$("#whoResult").append("몰라요에서 아이디 붙임:"+data);
        });
       //차트에 몰라요 수 변동
        socket.on("dknum", function (data) {
        	console.log("차트 몰라요 값 왔어"+data);
        	dontpersone = data;
        });
        //비활성화시 학생들이 보는 알람
        socket.on("dontf", function (data) {
        	$("#studentAlert").append('\n'+data+'\n');
        });        
//알아요==================
        //선생님이 아이들 알아요 보는거 
        socket.on("know", function (data) {
        	console.log("알아요 값 왔어");
        	$("#whoResult").append("알아요에서 아이디 붙임:"+data);
        });
        //차트에 알아요 수 변동
        socket.on("knum", function (data) {
        	console.log("차트 알아요 값 왔어"+data);
        	knowpersone = data;
        });
      	//비활성화시 학생들이 보는 알람
        socket.on("knowf", function (data) {
        	$("#studentAlert").append('\n'+data+'\n');
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
      function openModal() {
      	modal.style.opacity = "1";
      	modal.style.display = "block";
      }

      // Func To Close Modal
      function closeModal() {
      	modal.style.opacity = "0";
      	modal.style.display = "none";
      }

      function outerExit(e) {
      	if (e.target == modal) {
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
      function openModal() {
      	modal.style.opacity = "1";
      	modal.style.height = "100%";
      }

      // Func To Close Modal
      function closeModal() {
      	modal.style.opacity = "0";
      	modal.style.height = '0';
      }

      function outerExit(e) {
      	if (e.target == modal) {
      		modal.style.opacity = "0";
      		modal.style.height = '0';
      	}
      }

</script>