<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<script type="text/javascript">
$(function () {
	alert("일단실행");
	$.ajax({
		url:"/flyingturtle/admin/canvas/canvasView.do",
		data: {path:"node_sub/js_ssub"},
		dataType:"json",
		success : function(result){
         	console.log(result);
			html="";
			for(var i=0; i<result.length;i++){
				console.log(result[i]);
			html+=`<img class="thumbnail" src="${pageContext.request.contextPath}/resources/images/canvas/node_sub/js_ssub/`+result[i]+`">`;
			}
			$("#thumbBox").html(html);
        }
     });
     
		
});
</script>

<div class="box">
                <div class="buttonList1">
                 <ul class="buttonList">
                   <li>
                     <img class="addButton" id="addButton"src="<c:url value="/resources/images/add.png"/>" />
                     <img class="Button" id="minusButton" src="<c:url value="/resources/images/minus.png"/>" />
                  </li>
                   
                  </ul>
                </div>
                  <input id="goCanvas" type="button" value="그림판이동" onclick="canvasmove();"> 
               <div id="title">
				<div id="thumbBox">
				 
				</div>
				<div id="container">
				  <img id="mainImage" src="https://www.dropbox.com/s/iflhdhnwjsla6sc/01_bambies.jpg?raw=1" alt='current image'>
				</div>
				</div>
               
</div>
<script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/list.js"/>"></script>

