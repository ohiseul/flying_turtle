<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script>
//js분리하면 저장되지 않아요
function uploadFile(sub,ssub) {
	   var con_test = confirm("저장하시겠습니까?");
	   if(con_test == true){
	   $("#cimg").attr("src",canvas.toDataURL('image/jpeg'));
		var sendUrl = '';
		var titleval = $("#title").val();
		console.log(titleval);
		$.ajax({
			url:"<c:url value='canvasSave.do'/>",
			data: {
				canvasInfo: canvas.toDataURL('image/jpeg'),
				sbjNo:sub,
				ssbjNo:ssub,
				title:titleval
			},
			type: "POST",
			success: function (data) {
				console.log(data);
			},
			error: function (e) {
				console.log("에러발생: "+e);
			}
		});
		 }
		 else if(con_test == false){
		   
		 }
	} 
	
function autoSaveBtn() {
	  var time = $("#autoSave option:selected").val();
	  
	  console.log("선택한 시간:"+time);
	  
	  var sub=$("#subInfo").attr("sub");
	  console.log("선택한 시간:"+sub);
	  var ssub=$("#subInfo").attr("ssub");
	  console.log("선택한 시간:"+ssub);
	  playSave = setInterval(function () {uploadFile(sub,ssub)}, time);
 }
function autoSaveStop(){
	 clearInterval(playSave);
}
</script>
   
    
  <div class="jb_table">
    <div class="row">
      <span class="cell" width="82px">
        <div>
          <div class="jb_table">
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/red.png"/>" onclick="selectColor('red')" />
                <img src="<c:url value="/resources/images/canvas/img/orange.png"/>" onclick="selectColor('orange')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/yellow.png"/>" onclick="selectColor('yellow')" />
                <img src="<c:url value="/resources/images/canvas/img/green.png"/>" onclick="selectColor('green')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/blue.png"/>" onclick="selectColor('blue')" />
                <img src="<c:url value="/resources/images/canvas/img/lightblue.png"/>" onclick="selectColor('lightblue')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/lightgreen.png"/>" onclick="selectColor('lightgreen')"/>
                <img src="<c:url value="/resources/images/canvas/img/brown.png"/>" onclick="selectColor('brown')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/purple.png"/>" onclick="selectColor('purple')" />
                <img src="<c:url value="/resources/images/canvas/img/pink.png"/>" onclick="selectColor('pink')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/gray.png"/>" onclick="selectColor('gray')" />
                <img src="<c:url value="/resources/images/canvas/img/lightgray.png"/>" onclick="selectColor('lightgray')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/black.png"/>" onclick="selectColor('black')"/>
                <img src="<c:url value="/resources/images/canvas/img/white.png"/>" onclick="selectColor('white')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/pencil.png"/>"  onclick="selectTool('pencil')" />
                <img src="<c:url value="/resources/images/canvas/img/line.png"/>"  onclick="selectTool('line')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/circle.png"/>" onclick="selectTool('circle')"/>
                <img src="<c:url value="/resources/images/canvas/img/filledcircle.png"/>" onclick="selectTool('filledcircle')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/square.png"/>" onclick="selectTool('square')"/>
                <img src="<c:url value="/resources/images/canvas/img/filledsquare.png"/>" onclick="selectTool('filledsquare')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/rect.png"/>" onclick="selectTool('rect')" />
                <img src="<c:url value="/resources/images/canvas/img/filledrect.png"/>" onclick="selectTool('filledrect')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/triangle.png"/>" onclick="selectTool('tri')" />
                <img src="<c:url value="/resources/images/canvas/img/filledtriangle.png"/>" onclick="selectTool('filledtri')" />
              </span>
            </div>
            <div class="row">
                <span class="cell">
                  <img src="<c:url value="/resources/images/canvas/img/undo.png"/>" onclick="undo()"/>
                  <img src="<c:url value="/resources/images/canvas/img/redo.png"/>" onclick="redo()"/>
                </span>
              </div>
          </div>
        </div>
      </span>
      
      
      <span class="cell">
      <div id ="subInfo" style="width: 300px; height: 40px; background-color: pink;" sub="${subNo}" ssub="${ssubNo}">대과목:${sub} 소과목:${ssub}</div>
        <div>
          <canvas id="canvas" width="1100px" height="700px"></canvas>
          <img id="cimg" src="" width="720px" height="720px">
          <input >
          <INPUT type="button" value="Save 이미지 파일로 다운로드" onClick="uploadFile(${subNo},${ssubNo});" />
        </div>
      </span>
      <span class="cell">
      
      
	      <select id="autoSave">      
	      	<option>시간을 선택하세요</option>	      	
	      	<option value="6000">10초</option>
	      	<option value="60000">1분</option>
	      	<option value="180000">3분</option>
	      	<option value="300000">5분</option>
	      	<option value="600000">10분</option>
	      </select>
          <INPUT type="button" value="자동저장" onClick="autoSaveBtn()" />
          <INPUT type="button" value="자동저장stop" onClick="autoSaveStop()" />
        
          <div>Title <input id="title" size="15px" /></div>
          <div>
          	<a id="saveImage" download="image.png"></a>
          	<INPUT type="button" value="Clear" onClick="initPage()" />
          </div>
          <div>
          	<textarea id="history" cols="40" rows="37" style="display: none;"></textarea>
          </div>
      </span>
    </div>
  </div>
 
  <script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/canvas.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/painter.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/drawengine.js"/>"></script>    
