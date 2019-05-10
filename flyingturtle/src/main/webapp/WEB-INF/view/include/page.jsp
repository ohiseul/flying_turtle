<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<c:if test="${prev eq true}">
		<a href ="${param.page}?pageNo=${pageResult.beginPage -1}">이전</a>
	</c:if>
	<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
		<a href="${param.page}?pageNo=${i}">${i}</a>
	</c:forEach>
	<c:if test="${next eq true}">
		<a href="${param.page}?pageNo=${pageResult.endPage+1}">다음</a>
	</c:if>
</div>
