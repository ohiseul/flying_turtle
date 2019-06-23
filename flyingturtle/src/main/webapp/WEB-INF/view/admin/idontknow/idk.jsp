<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 소켓 관련  -->
<script src="http://172.30.1.23:10001/socket.io/socket.io.js"></script>
<input type="hidden" id="beginStatus" value="2">

<div id="basicModal" class="idontknowModal">
	<div class="idontknowModal-content" style="margin-top: 50px;">
		<span class="idontknowCloseBtn">&times;</span> <input id="studentId"
			type="hidden" value="${sessionScope.user.id}">
		<div>
			<c:choose>
				<c:when test="${sessionScope.user.id eq 'test5'}">
           	관리자 화면입니다.<br>
					<div id="idDiv">
						총인원:&nbsp; <span id="totalperson"></span>&nbsp; 명&nbsp; 알아요:&nbsp;
						<span id="knowpersone"></span>&nbsp; 명&nbsp; 몰라요:&nbsp; <span
							id="dontpersone"></span>&nbsp; 명<br> 알아요 결과::
						<ul id="whoResultK" style="border: 1px solid navy;"></ul>
						<br> 몰라요 결과::
						<ul id="whoResultD" style="border: 1px solid pink;"></ul>
						<br>
					</div>
				</c:when>
				<c:when
					test="${sessionScope.user.id ne 'test5' && sessionScope.user.id eq sessionScope.user.id }">
					<div id="personalstudentAlert" style="border: 1px solid yellow;"></div>
					<div id="statusBox">
						<input type="radio" name="status" value="알아요" /> <span class="up">알아요</span>
						<input type="radio" name="status" value="몰라요" /> <span class="up">몰라요</span>&nbsp;&nbsp;
						<button onclick="statusSubmit();">전송</button>
					</div>

				</c:when>
			</c:choose>
		</div>
		<div id="idkImgBox" style="width: 500px; height: 300px; display: inline;">
			<div style="display: inline-block;">
				<img id="iknowimg" alt="알아요"
					style="width: 50px; height: 50px; max-width: 250px; max-height: 300px;"
					src="<c:url value="/resources/images/idontknow/k3.png"/>">
			</div>
			<div style="display: inline-block;">
				<img id="idontimg" alt="몰라요"
					style="width: 50px; height: 50px; max-width: 250px; max-height: 300px;"
					src="<c:url value="/resources/images/idontknow/d2.png"/>">
			</div>
		</div>
	</div>
</div>

<script>
//=============================================================================node 관련  스트립트
var totalpwesone= 0;
var knowpersone = 0;
var dontpersone =0;

let socket;

// 연결 요청 : 서버 접속하기
socket = io.connect("http://172.30.1.23:10001");
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
  		$("#idkImgBox").html(`<div style="display: inline-block;">
				<img id="iknowimg" alt="알아요"
				style="width: 50px; height: 50px; max-width: 250px; max-height: 300px;"
				src="<c:url value="/resources/images/idontknow/k3.png"/>">
		</div>
		<div style="display: inline-block;">
			<img id="idontimg" alt="몰라요"
				style="width: 50px; height: 50px; max-width: 250px; max-height: 300px;"
				src="<c:url value="/resources/images/idontknow/d2.png"/>">
		</div>`);
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
   	                    recvId: "test5",
   	                    sendId:$("#studentId").val()
   	                }
   	            );
           	}
         if($('input[name="status"]:checked').val()=='알아요'){
        	 console.log("알아요다?");
                   socket.emit(
                           "know", 
                           {
                               recvId: "test5",
                               sendId:$("#studentId").val()
                           }
                       );
           	}
   		$("#statusBox").html(`전송완료<br><button onclick="rechoice();">다시선택</button>`);
    }else{
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
    	 //이미지 크기
    	 $("#idontimg").css("transform","scale("+dontpersone+"."+dontpersone+")");
    	 $("#iknowimg").css("transform","scale("+knowpersone+"."+knowpersone+")");
    });
	
    $("#statusBox").html(`<input type="radio" name="status" value="알아요" /> 
			          	  <span class="up">알아요</span>&nbsp;&nbsp; 
			          	  <input type="radio" name="status" value="몰라요" /> 
			          	  <span class="up">몰라요</span>
			          	  <button onclick="statusSubmit();">전송</button>`
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
        	 
        	 
        	 //이미지 크기
        	 $("#idontimg").css("transform","scale("+dontpersone+"."+dontpersone+")");
        	 $("#iknowimg").css("transform","scale("+knowpersone+"."+knowpersone+")");
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
    	 //이미지 크기
    	 $("#idontimg").css("-webkit-transform","scale("+dontpersone+"."+dontpersone+")");
    	 $("#iknowimg").css("-webkit-transform","scale("+knowpersone+"."+knowpersone+")");
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