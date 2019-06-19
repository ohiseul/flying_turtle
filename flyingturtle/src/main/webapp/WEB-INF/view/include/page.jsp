<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<c:if test="${page.prev eq true}">
		<div class="prev">
			<a href ="${param.page}?pageNo=${page.beginPage -1}&searchType=${param.searchType}&keyword=${param.keyword}">이전</a>
		</div>
	</c:if>
	<c:forEach var="i" begin="${page.beginPage}" end="${page.endPage}">
		<div <c:if test="${i == page.pageNo}"> class="active" </c:if> >
			<a href="${param.page}?pageNo=${i}&searchType=${param.searchType}&keyword=${param.keyword}">${i}</a>
		</div>
	</c:forEach>
	<c:if test="${page.next eq true}">
		<div class="next">
			<a href="${param.page}?pageNo=${page.endPage+1}&searchType=${param.searchType}&keyword=${param.keyword}">다음</a>
		</div>
	</c:if>