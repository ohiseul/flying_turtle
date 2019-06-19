<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/notice/list.css">');
</script>

<div class="search-wrapper">
	<div id="searchDiv">
		<form class="search" action="list.do">
			<span></span> 
			<input type="hidden" id="searchType" name="searchType" value="title" />
			<input id="search" type="text" name="keyword" placeholder="검색어를 입력하세요." autocomplete="off" required="required" />
			<button id="searchButton">&#128270;</button>
		</form>
		<div id="listCnt">전체 게시물 ${page.count}개</div>
	</div>
</div>

<div class="listTable-wrapper">
	<table id="list" class="listTable">
		<tr>
			<th id="no">번호</th>
			<th id="file">첨부파일</th>
			<th id="title">제목</th>
			<th id="writer">작성자</th>
			<th id="cnt">조회수</th>
			<th id="regDate">작성일</th>
		</tr>
		<c:forEach var="list" items="${lists}">
			<tr>
				<td>${list.boardNo}</td>
				<td>
					<c:if test="${list.fileGroupNo != 0}"><i class="far fa-file-alt"></i></c:if>
				</td>
				<td>
					<a href="<c:url value="/user/notice/detail.do?index=0&boardNo=${list.boardNo}&fileGroupNo=${list.fileGroupNo}"/>">${list.title}</a></td>
				<td>${list.name}</td>
				<td>${list.viewCnt}</td>
				<td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<div class="page">
		<c:if test="${page.count != 0}">
			<jsp:include page="/WEB-INF/view/include/page.jsp">
				<jsp:param name="page" value="/flyingturtle/user/notice/list.do" />
			</jsp:include>
		</c:if>
	</div>
</div>

<script src="<c:url value="/resources/user/js/notice/list.js"/>"></script>