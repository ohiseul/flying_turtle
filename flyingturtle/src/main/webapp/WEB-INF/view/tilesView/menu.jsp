<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="logo"><img src="<c:url value="/resources/images/logo.png"/>"></div>

<input type="checkbox" id="menu-toggle"/>
<label id="trigger" for="menu-toggle"></label>
<label id="burger" for="menu-toggle"></label>
  <div id="menu">
	<ul id="menuBox">
	    <li><a class="menubar" href="<c:url value="/login/logout.do"/>">로그아웃</a></li>
	    <li><a class="menubar" href="<c:url value="/notice/list.do"/>">공지사항</a></li>
	    <li><a class="menubar" href="#">마이페이지</a></li>
	    <li><a class="menubar" href="<c:url value="/todo/list.do"/>">todoList</a></li>
	</ul>
</div>