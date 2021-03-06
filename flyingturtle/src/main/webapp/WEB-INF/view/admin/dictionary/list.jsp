<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
  
<div id="top_header"></div>

	<div class="item">
		<div id="subTitle"><span>용어사전</span></div>
	    <div id="searchDiv"></div>
	</div>
	
	<div class="box">
		<div class="buttonList1">
         <ul class="buttonList">
           <li>
             <img class="addButton" id="addButton"src="<c:url value="/resources/images/add.png"/>" />
             <img class="Button" id="minusButton" src="<c:url value="/resources/images/minus.png"/>" />
          </li>
           
          </ul> 
	      	<div class="buttonList1 content">
	        	<main>
		          	<div id='dic-title'><span >소과목 타이틀</span></div>
		          	<div id="editorjs"></div>
		          	<div class="btn-area">
		            	<button id="save-btn">저장</button>
		          	</div>
	        	</main>
	      	</div>
	    </div>
	
	<div id="position1">
		<a href ="#header"><i class="fas fa-chevron-circle-up"></i></a><!-- 누르면 top으로 돌아가게 -->
	</div>
	<div id="position2">
		<a href ="#footer"><i class="fas fa-chevron-circle-down"></i></a><!--누르면 맨아래로 돌아가게  -->
	</div>
	    
</div>
<div id="footer"></div>


<!-- EditorJS -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/link@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/raw@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/image@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/table@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/warning@latest"></script>
<script type="text/javascript" src="<c:url value="/resources/admin/js/dictionary/list.js"/>"></script>