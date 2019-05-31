<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

        <div class="box">
                <div class="buttonList1">
                 <ul class="buttonList">
                   <li>
                     <img class="addButton" id="addButton"src="<c:url value="/resources/images/add.png"/>" />
                     <img class="Button" id="minusButton" src="<c:url value="/resources/images/minus.png"/>" />
                  </li>
                   
                  </ul>
                </div>
                  <input id="goCanvas" type="button" value="그림판이동" onclick="canvasmove();"> 
               <div id="title">
				<div id="thumbBox">
				<c:forEach var="list" items="${lists}">
				<spring:url value = '/img/${list.oriName}'/> 
				  <img class="thumbnail" src="/${list.path}${list.oriName}">
				</c:forEach>
    <div class="page">
            <c:if test="${page.count != 0}">
			<jsp:include page="/WEB-INF/view/include/page.jsp">
				<jsp:param name="page" value="/flyingturtle/user/canvas/list.do" />
			</jsp:include>
			</c:if>
   	</div>				
				</div>
				<div id="container">
				  <img id="mainImage" src="https://www.dropbox.com/s/iflhdhnwjsla6sc/01_bambies.jpg?raw=1" alt='current image'>
				</div>
				</div>
</div>
<script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/list.js"/>"></script>
