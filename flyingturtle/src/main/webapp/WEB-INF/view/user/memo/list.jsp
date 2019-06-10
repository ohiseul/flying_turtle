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
		<div class="subject-list">
			<div class="subject">과목 1</div>
			<div class="subject">과목 2</div>
			<div class="subject">과목 3</div>
			<div class="subject">과목 3</div>
			<div class="subject">과목 3</div>
			<div class="subject">과목 3</div>
			<div class="subject">과목 3</div>
			<div class="subject">과목 3</div>
		</div>
		<div class="subject-save">
			<button class="submitBtn">저장</button>
		</div>
	</div>


	<div id="stickyContainer">
	
		<div class="stickyNote">
			<div class="stickyBar">
				<span class="memobar editMemo">수정</span>
				<span class="memobar delMemo">삭제</span>
			</div>
			<div class="stickyEdit" contenteditable="false"></div>
		</div>
		
	</div>
</div>






<!-- 
	저장된 메모

<div id="stickyContainer">
	<div class="colorDiv">
		<input type="color" name="color" id="color" value="#ffff9d" />
	</div>
	<button onclick="createSticky();">메모 추가</button>
</div> 

-->
<script src="<c:url value="/resources/user/js/memo/memo.js"/>"></script>