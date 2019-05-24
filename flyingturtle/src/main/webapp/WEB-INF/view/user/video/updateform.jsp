<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="<c:url value="/resources/user/js/video/write.js"/>"></script>
<script  src="<c:url value="/resources/user/js/jquery-3.3.1.js"/>" ></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
 <script type="text/javascript" src="<c:url value="/resources/user/js/video/bundle.js"/>"></script>

					                
 <div class="box">
 
	<div class="buttonList1">
		<ul class="buttonList">
			<li>
				<img id="addButton" src="<c:url value="/resources/images/add.png"/>" />
         	</li>
         	<li>
         	<c:forEach var="sbj" items="${sbjList}">
				<div class='sideMenu'>
					<input style="width: 60px; display: inline-block;" type='text' name ='menu' class='menuInput' value="${sbj.subjectName}" data-sbjno="${sbj.subjectNo}" />
					<div style="width: 60px; display: inline-block;float: right;border-color: aqua;z-index: 1000;"><a style="color:#fff;z-index: 1001;" href="<c:url value="/user/video/list.do?subjectNo=${sbj.subjectNo}"/>">go</a></div>
				</div>
			</c:forEach>
			</li>
       	</ul>
       	</div>
       	
       	                
		<div class="wrapper">
		       <div class="componentWrapp">
		         <div id="videoForm">
	                 <input name="title" id="title" placeholder="제목을 입력하세요">
	                 <hr>
	                 <input name="content" id="content" placeholder="내용을 입력하세요">
                 </div>
                <div class="videoWrapp">
                <i class="fas fa-redo" id="resetbtn" onclick="reset();"></i>
				<div id="editorjs"></div>
                </div>
		       </div>
		</div>
		<div class="btn-area">
            <button id="save">저장</button>
        </div>

		

 </div>

 