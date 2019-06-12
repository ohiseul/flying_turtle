<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div id="basicModal" class="modal">
 <div class="modal-content">
   <span class="closeBtn">&times;</span>
    <p>
       <input id="studentId" type="hidden" value="${sessionScope.user.id}">
    <c:choose>
        <c:when test="${sessionScope.user.id eq 'adtest'}">
           	관리자 화면입니다.<br>
			입장한 사람들 :<div id="idDiv">
						<ul id="totalperson"><li>총인원:<ul id="idList"></ul></li></ul>
		    		  </div>
		    		  <div id="who"></div>
		    <button id="pieResult">결과보기</button> 
        </c:when>
        <c:otherwise>
          	사용자 화면 입니다
        	<button id="dont" value="1">몰라요</button>
        	<button id="know" value="2">알아요</button>        	        	
         </c:otherwise>
    </c:choose>

        <div id="app" class="container" style="display: none;">
                <div id="piechart">
                </div>
        </div>
   
    </p>
   </div>
</div>
<script>
//============================================================================모달관련 스트립트 
//Get Elements & Store In Vars
var modal = document.getElementById("basicModal");
var modalBtn = document.getElementById("modalBtn");
var closeBtn = document.getElementsByClassName("closeBtn")[0];

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
var closeBtn = document.getElementsByClassName("closeBtn")[0];

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

//=============================================================================node 관련  스트립트
		// 배열로 사용자 관리    
        let socket;
            // 연결 요청 : 서버 접속하기
            socket = io.connect("http://localhost:10001");

//로그인=================
            socket.emit("login", $("#studentId").val());
			//받아서 처리
            socket.on("login", function (id) {
            	// 접속로그를 비우고 다시 채움

            	$('#idList').empty();

            	for(var i=0; i<id.length; i++){
               		 $('#idList').append('<li>' +id[i].loginId+'</li>');
           		 }
            });
//로그아웃================
            socket.emit("login", $("#studentId").val());
			//받아서 처리
            socket.on("login", function (id) {
            	// 접속로그를 비우고 다시 채움

            	$('#idList').empty();

            	for(var i=0; i<id.length; i++){
               		 $('#idList').append('<li>' +id[i].loginId+'</li>');
           		 }
            });
//몰라요==================
        $("#dont").click(function () {
            // 서버로 데이터 전송
            socket.emit(
                "dont", 
                {
                    recvId: "adtest",
                    sendId:$("#studentId").val(),
                    sendMsg: $("#dont").val()
                }
            );
            
        });
        socket.on("dont", function (data) {
        	$("#who").append("\n몰라요에서 아이디 붙임:"+data);
        });        
//알아요==================
        $("#know").click(function () {
            // 서버로 데이터 전송
            socket.emit(
                "know", 
                {
                    recvId: "adtest",
                    sendId:$("#studentId").val(),
                    sendMsg: $("#know").val()
                }
            );
        });
        socket.on("know", function (data) {
        	$("#who").append("\n알아요에서 아이디 붙임:"+data);
        });

//====================================================================차트 관련 스트립트
//선생님이 결과보기 누르면 차트 나옴
    $("#pieResult").click(function () {
		$("#app").toggle('display');
	});
    
    
        var totalpwesone= 19;
        var knowpersone= 10;
        var dontpersone= 9;

        var data = [
  ['good', knowpersone*100/totalpwesone],
  ['neutral', dontpersone*100/totalpwesone]
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
      console.log(self)
      
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
        
        
</script>