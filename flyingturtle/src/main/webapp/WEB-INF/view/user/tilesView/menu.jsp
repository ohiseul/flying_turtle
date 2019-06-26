<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="top">
	<div class="top-logo">
		<a href="<c:url value="/user/main/main2.do"/>"> <img
			src='<c:url value="/resources/user/images/String_logo.png"/>'>
		</a>
	</div>
	<nav>
		<form id="idontknow">
			<input type="hidden" name="memberNo"
				value="${sessionScope.user.memberNo}" />
			<button id="modalBtn" class="btn1">몰라요</button>
		</form>
		<form id="attendance">
			<input type="hidden" name="memberNo" id="menu-memNo"
				value="${sessionScope.user.memberNo}" />
			<button type="button" id="attendBtn">출석</button>
		</form>
		<a href="<c:url value="/user/mypage/my-main.do"/>"> <i
			style="color: #003876" class="fas fa-user-alt"></i>
		</a>
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<a class="alt" href="<c:url value="/user/login/loginform.do"/>">LogIn</a>
			</c:when>
			<c:otherwise>
				<a class="alt" href="<c:url value="/user/login/logout.do"/>">LogOut</a>
			</c:otherwise>
		</c:choose>
	</nav>
</div>

<nav id="tour-nav">
	<div class="menu-wrapper">
	
		<div class="menu">
			<a href="<c:url value="/user/notice/list.do"/>"> 
			<div><i class="fas fa-bullhorn"></i> 공지사항</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/employment/list.do"/>">
				 <div><i class="far fa-newspaper"></i> 취업정보</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/qna/list.do"/>"> 
				<div><i class="fas fa-question"></i> 묻고답하기</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/todo/list.do"/>"> 
				<div><i class="far fa-check-circle"></i> todo</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/dictionary/list.do"/>"> 
				<div><i class="far fa-file-word"></i> 용어사전</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/video/list.do?subjectNo=1"/>"> 
				<div><i class="fab fa-youtube"></i> 동영상</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/memo/list.do"/>"> 
				<div><i class="fas fa-pencil-alt"></i> memo</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/canvas/list.do"/>"> 
				<div><i class="fas fa-paint-brush"></i> 그림판</div>
			</a>
		</div>

	</div>
</nav>
<script>
	// 선택한 메뉴 위치
	let menuIndex = '${param.index}';
</script>
<script src="<c:url value="/resources/common/js/menu.js"/>"></script>