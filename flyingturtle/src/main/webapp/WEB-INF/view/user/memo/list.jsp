<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	$("head").append(
		`<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/memo/memo.css">`
	);
</script>

<div class="memo-wrapper">
	<!-- ==================================================
		임시저장된 메모 
	=================================================== -->
	<div class="subject-wrap">
		<div class="subject-list scroll">
			<c:forEach var="sbj" items="${sbjList}">
				<input type="radio" name="subject" id="sub"+${sbj.sbjNo} />
				<label for="sub"+${sbj.sbjNo} class="subject">${sbj.subjectName}</label>
			</c:forEach>
		</div>
		
		<div class="subject-save">
			<button class="submitBtn">저장</button>
		</div>
	</div>
	
	<div id="stickyContainer"></div>


	<!-- 
	저장된 메모

<div id="stickyContainer">
	<div class="colorDiv">
		<input type="color" name="color" id="color" value="#ffff9d" />
	</div>
	<button onclick="createSticky();">메모 추가</button>
</div> 
-->
</div>


<script src="<c:url value="/resources/user/js/memo/memo.js"/>"></script>