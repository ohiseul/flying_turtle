<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="logo"><a href="<c:url value="/user/main/main.do"/>"><img src="<c:url value="/resources/user/images/logo.png"/>"></a></div>

<input type="checkbox" id="menu-toggle"/>
<label id="trigger" for="menu-toggle"></label>
<label id="burger" for="menu-toggle"></label>
  <div id="menu">
	<ul id="menuBox">
	<c:choose>
		<c:when test="${empty sessionScope.user}">
		    <li><a class="menubar" href="<c:url value="/user/login/loginform.do"/>">로그인</a></li>
	    </c:when>
	    <c:otherwise>
		    <li><a class="menubar" href="<c:url value="/user/login/logout.do"/>">로그아웃</a></li>
	    </c:otherwise>
	</c:choose>
	    <li><a class="menubar" href="<c:url value="/user/notice/list.do"/>">공지사항</a></li>
	    <li><a class="menubar" href="<c:url value="/user/dictionary/list.do"/>">사전</a></li>
	    <li><a class="menubar" href="#">마이페이지</a></li>
	    <li><a class="menubar" href="<c:url value="/user/todo/list.do"/>">todoList</a></li>
	    <li><a class="menubar" href="<c:url value="/NodeJS/view/dictionary/list.html"/>">용어사전</a></li>
	</ul>
</div>