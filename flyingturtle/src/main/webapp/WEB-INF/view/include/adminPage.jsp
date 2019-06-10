<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center" class="board-paging">
	<c:if test="${page.prev eq true}">
		<button type="button" class="btn-paging btn-paging-prev">
		<a href ="${param.page}?pageNo=${page.beginPage -1}&searchType=${param.searchType}&keyword=${param.keyword}">이전</a>
		</button>
    </c:if>
    <c:forEach var="i" begin="${page.beginPage}" end="${page.endPage}">
			<a href="${param.page}?pageNo=${i}&searchType=${param.searchType}&keyword=${param.keyword}" style="text-decoration: none;" 
				<c:if test="${page.pageNo == i}">class="on"</c:if>
			>${i}</a>
	</c:forEach>
    <c:if test="${page.next eq true}">
    	<button type="button" class="btn-paging btn-paging-next">
    		<a href="${param.page}?pageNo=${page.endPage+1}&searchType=${param.searchType}&keyword=${param.keyword}">다음</a>
    	</button>
    </c:if>	
</div>