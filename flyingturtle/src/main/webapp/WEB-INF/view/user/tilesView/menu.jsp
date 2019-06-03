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
			<button id="idontknowBtn">몰라요</button>
		</form>
		<form id="attendance">
			<input type="hidden" name="memberNo"
				value="${sessionScope.user.memberNo}" />
			<button id="attendBtn">출석</button>
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
			<!-- <div><i class="fas fa-bullhorn fa-3x"></i></div> --> 
			<div>공지사항</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/qna/list.do"/>"> 
				<!-- <div><i class="fas fa-question fa-3x"></i></div>-->
				<div>묻고답하기</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/video/list.do"/>"> 
				<!-- <div><i class="fab fa-youtube fa-3x"></i></div> -->
				<div>동영상</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/todo/list.do"/>"> 
				<!-- <div><i class="far fa-check-circle fa-3x"></i></div> -->
				<div>todo</div>
			</a>
		</div>
		<div class="menu">
			<a href="<c:url value="/user/dictionary/list.do"/>"> 
				<!-- <div><i class="fas fa-pencil-alt fa-3x"></i></div> -->
				<div>용어사전</div>
			</a>
		</div>
		<div class="menu">
			<a href="#">
				<!-- <div><i class="far fa-calendar fa-3x"></i></div> -->
				<div>강의일정</div>
			</a>
		</div>
		
		<div class="menu">
			<a href="<c:url value="/admin/attend/dayList.do"/>">
				 <!-- <div><i class="far fa-calendar fa-3x"></i></div> -->
				 <div>출석</div>
			</a>
		</div>

	</div>
</nav>
<script src="<c:url value="/resources/user/js/main2/menu.js"/>"></script>