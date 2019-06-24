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
  
  <div style="display: inline-block;">
  	<a href="<c:url value="/admin/main/main.do"/>"><img id="adminsr" style="width: 200px;height: 69px; " src='<c:url value="/resources/images/adminMainRogo.png"/>'></a>
  </div>
   <div class="top-message">
              <button type="button" class="btn-message">
                <img src="/flyingturtle/resources/admin/image/message.png" alt="" />
                <span class="count">0</span>
              </button>
              </div>
	<nav style="float: right; background-color: white; display: inline-block;">
			<button id="modalBtn" class="knowBtn">몰라요</button>
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