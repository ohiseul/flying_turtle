<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/main/main.css"/>');
</script>
<div class="wrapper">
	<div class="attendList">
		<div class="attend list">출석</div>
		<c:forEach var="attend" items="${attendList}">
	
			<div class="attend content"><span id="name">${attend.name}</span>님이 
			<fmt:formatDate value="${attend.checkIn}" pattern="hh:mm"/>
			에 출석했습니다.</div>
		</c:forEach>
	</div>
	<div class="attendChart">
		<div id="bar_chart_div"></div>
	</div>
</div>
 <script>
  	let dataArr = [];
  	<c:forEach var="item" items="${chart}">
  		dataArr.push(['${item.name}', ${item.checkInCount}, ${item.absentCount}, ${item.lateCount}, ${item.earlyCount}, '']);
  	</c:forEach>
  </script>
<script src="<c:url value="/resources/admin/js/main/main.js"/>"></script>