<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
	var adminLogin = "";
</script>
<aside>
	<a href="<c:url value="/admin/main/main.do"/>"> <img style="width: 200px;height: 69px; " src='<c:url value="/resources/images/adminMainSidebar.png"/>'></a>
	<ul>
		<li><a href="<c:url value="/admin/attend/dayList.do"/>">출석관리</a></li>
		<li><a href="<c:url value="/admin/notice/list.do"/>">공지사항</a></li>
		<li><a href="<c:url value="/admin/qna/list.do"/>">묻고답하기</a></li>
		<li><a href="<c:url value="/admin/video/list.do"/>">동영상</a></li>
		<li><a href="<c:url value="/admin/dictionary/list.do"/>">용어사전</a></li>
		<li><a href="<c:url value="/admin/canvas/list.do"/>">그림판</a></li>
		<li><a href="<c:url value="/admin/todo/list.do"/>">To do</a></li>
		<li><a href="#">메모</a></li>
	</ul>
</aside>