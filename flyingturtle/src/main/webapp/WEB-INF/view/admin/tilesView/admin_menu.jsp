<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<header class="header">
  <!-- 안에있는  span은 	버튼모양-->
  <button type="button" class="btn-menu">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
  </button>
  <div id="top">
	<nav style="float: right; background-color: white;">
		<form id="idontknow">
			<input type="hidden" name="memberNo"
				value="${sessionScope.user.memberNo}" />
			<button id="modalBtn" class="btn" >몰라요</button>
		</form>
		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<a class="alt admin" href="<c:url value="/user/login/loginform.do"/>">LogIn</a>
			</c:when>
			<c:otherwise>
				<a class="alt admin" href="<c:url value="/user/login/logout.do"/>">LogOut</a>
			</c:otherwise>
		</c:choose>
	</nav>
</div>
</header>