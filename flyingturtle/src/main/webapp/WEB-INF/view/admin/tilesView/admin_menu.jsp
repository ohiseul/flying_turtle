<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="top" style="background-color: #003876; height: 60px; width: 100%; color: #fff;">
	<div style="display: inline-block;">
		<img  style="margin: 0 30px; height: 50px; display: inline-block;" src='<c:url value="/resources/images/main3logo.png"/>'>
	</div>
	<nav style="height: 60px; display: inline-block;">
		<a href="#">출석</a>
		<a href="#"><i style="color: #fff" class="far fa-envelope"></i></a>
		<a href="<c:url value="/user/mypage/mypage.do"/>"><i style="color: #fff"  class="fas fa-user-alt"></i></a>
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
	<div class="in cf">
		<a href="<c:url value="/user/notice/list.do"/>" data-icon="task" data-item="tasks">
			<i style="color: #fff" class="fas fa-bullhorn"></i>
			공지사항
		</a>
		<a href="<c:url value="/user/dictionary/list.do"/>" data-icon="task" data-item="tasks">
			<i style="color: #fff" class="fas fa-book"></i>
			용어사전
		</a>
		<a href="<c:url value="/user/qna/list.do"/>" data-icon="notification" data-item="reminders-sync-more">
			<i style="color: #fff" class="fas fa-question"></i>
			묻고답하기
		</a>
		<a href="<c:url value="/user/video/list.do"/>" data-icon="notification" data-item="reminders-sync-more">
			<i style="color: #fff" class="fab fa-youtube"></i>
			 동영상
		</a>
		<a href="<c:url value="/user/todo/list.do"/>" data-icon="notification" data-item="reminders-sync-more">
			<i style="color: #fff" class="far fa-check-circle"></i>
			todo
		</a>
		<a href="#" data-icon="notification" data-item="reminders-sync-more">
			<i style="color: #fff" class="fas fa-pencil-alt"></i>
			과제
		</a>
		<a href="#" data-icon="notification" data-item="reminders-sync-more">
			<i style="color: #fff" class="far fa-calendar"></i>
			강의일정
		</a>
	</div>
</nav>