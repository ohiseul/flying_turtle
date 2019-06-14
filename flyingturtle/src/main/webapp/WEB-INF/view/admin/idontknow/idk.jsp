<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#app{
  padding: 50px 0;
}

.custom-legend{
  cursor: pointer;
}

text.custom-legend-value{
  font-size: 28px;
  fill: black;
  alignment-baseline: hanging;
}
text.custom-legend-title{
  font-size: 15px;
  fill: grey;
  alignment-baseline: hanging;
}

.c3-arc.c3-arc-알아요,
.custom-legend-color.is-알아요{
  fill: #00d455 !important;
}
.c3-arc.c3-arc-몰라요,
.custom-legend-color.is-몰라요{
  fill: #5599ff !important;
}
.c3-arc.c3-arc-bad,
.custom-legend-color.is-bad{
  fill: #ff2a2a !important;
}
</style>
<!-- 차트관련 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.2.1/css/bulma.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.17/d3.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js" ></script>

<!-- 소켓 관련  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://172.168.0.106:10001/socket.io/socket.io.js"></script>
 
<div id="basicModal" class="idontknowModal">
 <div class="idontknowModal-content">
   <span class="idontknowCloseBtn">&times;</span>
    <p>
       <input id="studentId" type="hidden" value="${sessionScope.user.id}">
<%--     <c:choose> --%>
<%--         <c:when test="${sessionScope.user.id eq 'adtest'}"> --%>
           	관리자 화면입니다.<br>
			<div id="idDiv">학생인원:
			<ul >
				<li id="totalperson"></li>
				<li id="knowpersone"></li>
				<li id="dontpersone"></li>
			</ul>
		    		  몰라요 결과::<ul id="whoResultD" style="border: 1px solid pink; "></ul><br>
		    		  알아요 결과::<ul id="whoResultK" style="border: 1px solid navy; "></ul><br>
		    <button id="pieResult">결과보기</button> 
			</div>
<%--         </c:when> --%>
<%--         <c:when test="${sessionScope.user.id ne 'adtest' && sessionScope.user.id eq sessionScope.user.id }"> --%>
          	사용자 개인 화면 입니다
          	<div id="personalstudentAlert" style="border: 1px solid yellow; "></div>
          	<div id="statusBox"> 
          		<input type="radio" name="status" value="몰라요" /> 
			          	  <span class="up">몰라요</span>&nbsp;&nbsp; 
			          	  <input type="radio" name="status" value="알아요" /> 
			          	  <span class="up">알아요</span>
			          	  <button onclick="statusSubmit();">전송</button>
          	</div>
          	      	        	
<%--          </c:when> --%>
<%--          <c:otherwise> --%>
<!--           	여기 오는 경우는 뭐지....      	 -->
<%--          </c:otherwise> --%>
<%--     </c:choose> --%>

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
var knowpersone = 0;
var dontpersone =0;
let socket;
// 연결 요청 : 서버 접속하기
socket = io.connect("http://172.168.0.106:10001");
//로그인=================
	$("#modalBtn").click(function () {
            socket.emit("login", $("#studentId").val());
	});


	//입장한 사람 인원 업데이트
    socket.on("welcom", function (data) {
    	totalpwesone = data;
 		 $('#totalperson').html(data);
	});	
    //선생님 들어오시면 아이들에게 알람
    socket.on("teacher", function (data) {
  		 $('#personalstudentAlert').html(data);
		 $("#statusBox").html(`   <input type="radio" name="status" value="몰라요" /> 
					          	  <span class="up">몰라요</span>&nbsp;&nbsp; 
					          	  <input type="radio" name="status" value="알아요" /> 
					          	  <span class="up">알아요</span>
					          	  <button onclick="statusSubmit();">전송</button>  `);
	});
//로그아웃================
	$(".idontknowCloseBtn").click(function () {
		    socket.emit("logOut", $("#studentId").val());
	});
	
    //선생님이 나가시면 알람+학생화면 초기화
    socket.on("teacherOut", function (data) {
  		 $('#studentAlert').html(data.msg);
     	 $('#totalperson').html(data.total)
    	 $('#knowpersone').html(data.personK);
    	 $('#dontpersone').html(data.personD);
    	 totalpwesone = 0;
    	 knowpersone = 0;
    	 dontpersone = 0;

	});
            
//상태값 노드로 전송================     
function statusSubmit() {
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
   		$("#statusBox").html(`전송완료<br><button onclick="rechoice();">다시선택</button>`);
    }else{
   		alert("상태값을 선택해주세요");
   	}
}

//다시선택누르면
function rechoice() {
	
	//학생이 값을 변경하기 전 리스트에서 없애준다
	socket.emit("rechoice", $("#studentId").val());	
	 $("#statusBox").html(`<input type="radio" name="status" value="몰라요" /> 
			          	  <span class="up">몰라요</span>&nbsp;&nbsp; 
			          	  <input type="radio" name="status" value="알아요" /> 
			          	  <span class="up">알아요</span>
			          	  <button onclick="statusSubmit();">전송</button>`
	);
	//알아요 몰라요 배열 리셋
	 if($("#idDiv").text().includes(rmid)==true){
        $("#D"+rmid).remove();
        $("#K"+rmid).remove();
	 }
	 

}


//몰라요==================
        //선생님이 아이들 몰라요 보는거 
        socket.on("dont", function (data) {
        	$("#whoResultD").append('<li id="D'+data+'">'+data+'</li>');
        });
       //차트에 몰라요 수 변동
        socket.on("dknum", function (data) {
          	knowpersone = data.kcnt;
        	dontpersone = data.dcnt;
        	chartFn();
        });
        //비활성화시 학생들이 보는 알람
        socket.on("dontf", function (data) {
        	$("#personalstudentAlert").html(data);
        });        
//알아요==================
        //선생님이 아이들 알아요 보는거 
        socket.on("know", function (data) {
        	console.log("알아요 값 왔어");
        	$("#whoResultK").append('<li id="K'+data+'">'+data+'</li>');
        });
        //차트에 알아요 수 변동
        socket.on("knum", function (data) {
        	knowpersone = data.kcnt;
        	dontpersone = data.dcnt;
        	chartFn();
        	
        });
      	//비활성화시 학생들이 보는 알람
        socket.on("knowf", function (data) {
        	$("#personalstudentAlert").html(data);
        });
      	
      	
      	
      	
//=================================================================차트관련 스트립트	

function chartFn() {
var know = Math.floor(knowpersone*100/totalpwesone);
var dont = Math.floor( dontpersone*100/totalpwesone);
	
var data = [
		  ['알아요', know],
		  ['몰라요',dont]
		];

var chart = c3.generate({
    bindto: '#piechart',
    data: {
        columns: data,
        type: 'pie'
    },
    legend: {
        show: false
    },
    tooltip: {
      position: function (data, width, height, element) {
        return {top: 0, right: 0}
      }
    },
    onrendered: function(){
      var self = this;
      
      d3Pie = d3.select('.c3-chart-arcs');
      pieSize = d3Pie.node().getBBox();
      pieTransform = d3.transform(d3Pie.attr("transform")); // credit : http://stackoverflow.com/questions/20340263/d3-retrieve-and-add-to-current-selections-attribute-value

      // MODIFY PIE POSITION
      var posX = 0+pieSize.width/1.5;
      var posY = pieTransform.translate[1];
      d3Pie.attr('transform', 'translate('+posX+','+posY+')')
    }
});

// ADD CUSTOM LEGEND
var d3legend = d3.select('.c3-chart').append('g')
  .attr('transform', 'translate('+(pieSize.width + pieSize.width/3)+',100)')
  .attr('class', 'custom-legend')
  .selectAll('g')
  .data(data)
  .enter()
  .append('g')
  .attr('transform', function(d, i){
    return 'translate(0, '+i*60+')';
  })
  .attr('data-id', function (d) { 
    return d[0]; 
  })
  .on('mouseover', function (id) {
    chart.focus(id);
  })
  .on('mouseout', function (id) {
    chart.revert();
  })

var legendRect = d3legend.append('rect')
  .attr('class', function(d, i){
    return 'custom-legend-color is-'+d[0];
  })
  .attr('width', 40)
  .attr('height', 40)
  .attr('rx', 4)
  .attr('ry', 4)
  .style('fill', function(d, i){
    return chart.color(d[0])
  });

var legendValue = d3legend.append('text')
  .attr('class', 'custom-legend-value')
  .attr('x', 50)
  .text(function(d, i){
    return (d[1]/100)*100 + '%';
  });

var legendTitle = d3legend.append('text')
  .attr('class', 'custom-legend-title')
  .attr('x', 50)
  .attr('y', 30)
  .attr('font-size', '15px')
  .text(function(d, i){
    return d[0];
  }); 

}
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