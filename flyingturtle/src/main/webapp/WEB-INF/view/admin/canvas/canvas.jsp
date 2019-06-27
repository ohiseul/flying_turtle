<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
/*저장기능*/
function uploadFile(sub,ssub) {

		//저장될 이미지 미리보기   $("#cimg").attr("src",canvas.toDataURL('image/jpeg'));
		var sendUrl = '';
		var titleval = $("#saveTitle").val();
		console.log(titleval);
		$.ajax({
			url:"<c:url value='canvasSave.do'/>",
			data: {
				canvasInfo: canvas.toDataURL('image/jpeg'),
				sbjNo:sub,
				ssbjNo:ssub,
				title:titleval},
			type: "POST",
			success: function (data) {
				console.log(data);
				if (!playSave) {
					alert("그림이 저장되었습니다.");
				} 
			},
			error: function (e) {
				console.log("에러발생: "+e);
			}
		});

	} 
let playSave = null;
/*자동저징 기능 실행*/
function autoSaveBtn() {
	if($("#autoSave").val()==""){
		alert("시간을 선택해주세요")
	}else{
		
	  var time = $("#autoSave option:selected").val();
	  var sub=$("#subInfo").attr("sub");
	  var ssub=$("#subInfo").attr("ssub");
	  playSave = setInterval(function () {uploadFile(sub,ssub)}, time);
	  
	  $("#autosavestatus").text("자동저장중");
	}
 }
 /*자동저장 중지*/
function autoSaveStop(){
	 clearInterval(playSave);
	 playSave = null;
	 $("#autosavestatus").text("");
}
 /*목록으로*/
function golist(){
	window.location.href="/flyingturtle/admin/canvas/list.do";
}
</script>

<!--저장할 현재 과목정보===============================================================================================  -->
<div id="mainCanvas">
<div style="display: inline-block; width: 1000px;height: 44px;">
	<div id="subInfo" sub="${subNo}" ssub="${ssubNo}">
		대과목:
		<div class="sis">${sub}</div>
		소과목:
		<div class="sis">${ssub}</div>
	</div>
	<div id="saveInfo">
		<p style="text-align: left;" >※제목은 선택사항 입니다.</p>
		<input id="saveTitle" width="200px" style="margin-top: 7px;" placeholder="제목을 입력하세요">
		<input class="ft-Btn2" style="position: relative; top: -10px; margin-left: 10px;" type="button" onclick="golist();" value="목록으로" />
		<input class="ft-Btn2" style="position: relative; top: -10px;margin-left: 10px;" type="button" value="Save" onClick="uploadFile(${subNo},${ssubNo});" />
	</div>
	<div id="autosavestatus"></div>
</div>
	<!--캔버스========================================================================================================  -->

	<canvas id="canvas" width="1100px" height="650px"></canvas>
	<!--    저장할 그림 미리보기       <img id="cimg" src="" width="720px" height="720px"> -->

<!--그림판 기능=====================================================================================================  -->
<div class="cell" id="fnCanvas">
	<div class="jb_table">

		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/red.png"/>"
				onclick="selectColor('red')" /> <img
				src="<c:url value="/resources/images/canvas/img/orange.png"/>"
				onclick="selectColor('orange')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/yellow.png"/>"
				onclick="selectColor('yellow')" /> <img
				src="<c:url value="/resources/images/canvas/img/green.png"/>"
				onclick="selectColor('green')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/blue.png"/>"
				onclick="selectColor('blue')" /> <img
				src="<c:url value="/resources/images/canvas/img/lightblue.png"/>"
				onclick="selectColor('lightblue')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/lightgreen.png"/>"
				onclick="selectColor('lightgreen')" /> <img
				src="<c:url value="/resources/images/canvas/img/brown.png"/>"
				onclick="selectColor('brown')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/purple.png"/>"
				onclick="selectColor('purple')" /> <img
				src="<c:url value="/resources/images/canvas/img/pink.png"/>"
				onclick="selectColor('pink')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/gray.png"/>"
				onclick="selectColor('gray')" /> <img
				src="<c:url value="/resources/images/canvas/img/lightgray.png"/>"
				onclick="selectColor('lightgray')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/black.png"/>"
				onclick="selectColor('black')" /> <img
				src="<c:url value="/resources/images/canvas/img/white.png"/>"
				onclick="selectColor('white')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/pencil.png"/>"
				onclick="selectTool('pencil')" /> <img
				src="<c:url value="/resources/images/canvas/img/line.png"/>"
				onclick="selectTool('line')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/circle.png"/>"
				onclick="selectTool('circle')" /> <img
				src="<c:url value="/resources/images/canvas/img/filledcircle.png"/>"
				onclick="selectTool('filledcircle')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/square.png"/>"
				onclick="selectTool('square')" /> <img
				src="<c:url value="/resources/images/canvas/img/filledsquare.png"/>"
				onclick="selectTool('filledsquare')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/rect.png"/>"
				onclick="selectTool('rect')" /> <img
				src="<c:url value="/resources/images/canvas/img/filledrect.png"/>"
				onclick="selectTool('filledrect')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/triangle.png"/>"
				onclick="selectTool('tri')" /> <img
				src="<c:url value="/resources/images/canvas/img/filledtriangle.png"/>"
				onclick="selectTool('filledtri')" />
			</span>
		</div>
		<div class="row">
			<span class="cell"> <img
				src="<c:url value="/resources/images/canvas/img/undo.png"/>"
				onclick="undo()" /> <img
				src="<c:url value="/resources/images/canvas/img/redo.png"/>"
				onclick="redo()" />
			</span>
		</div>
		<div id="relevantSave" class="row" style="margin-top: 10px;">
			<div>
				<select id="autoSave">
					<option value="">단위</option>
					<option value="6000">10초</option>
					<option value="60000">1분</option>
					<option value="180000">3분</option>
					<option value="300000">5분</option>
					<option value="600000">10분</option>
				</select><br> 
				<input class="ft-Btn2" type="button" value="autoSave" onClick="autoSaveBtn();" /><br> 
				<input class="ft-Btn2" type="button" value="autoStop" onClick="autoSaveStop();" /><br>
			</div>
			<INPUT class="ft-Btn2" type="button" value="Clear" onClick="initPage();" />
		</div>
	</div>
</div>
</div>
<textarea id="history" cols="40" rows="37" style="display: none;"></textarea>


<script type="text/javascript"
	src="<c:url value="/resources/admin/js/canvas/painter.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/admin/js/canvas/drawengine.js"/>"></script>
