<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/qna/list.css">');
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/page.css">');
	$("#searchType").hide();
</script>

<div class="search-wrapper">
	<div id="searchDiv">
		<form class="search" action="list.do">
			<span></span> <input type="hidden" id="searchType" name="searchType"
				value="title" /> <input id="search" type="text" name="keyword"
				placeholder="검색어를 입력하세요." autocomplete="off" required="required" />
			<button id="searchButton">&#128270;</button>
		</form>
		<div id="listCnt">전체 게시물 ${page.count}개</div>

	</div>
</div>


<div class="listTable-wrapper">
	<table id="qnaTable" class="listTable">
		<tr>
			<th id="no"><div class="sideline">번호</div></th>
			<th id="status"><div class="sideline">답변여부</div></th>
			<th id="title"><div class="sideline">제목</div></th>
			<th id="writer"><div class="sideline">작성자</div></th>
			<th id="viewCnt"><div class="sideline">조회수</div></th>
			<th id="regDate"><div class="sideline">작성일</div></th>
		</tr>
		<c:forEach var="lists" items="${list}">
			<tr>
				<td>${lists.qnaNo}</td>
				<td>
					<div id="qnaStatus">${lists.codeName}</div>
				</td>
				<td><a
					href="<c:url value="/user/qna/detail.do?index=1&qnaNo=${lists.qnaNo}&fileGroupNo=${lists.fileGroupNo}"/>">
						${lists.title}</a></td>
				<td>${lists.id}</td>
				<td>${lists.viewCnt}</td>
				<td><fmt:formatDate value="${lists.regDate}"
						pattern="yyyy.MM.dd" /></td>
			</tr>
		</c:forEach>
	</table>
</div>
<div>
	<div style="text-align: right; margin: 10px 50px">
		<button class="submitBtn"
			onClick="location.href='<c:url value="/user/qna/writeform.do"/>'">
			등록</button>
	</div>
	<div class="page">
		<c:if test="${page.count != 0}">
			<jsp:include page="/WEB-INF/view/include/page.jsp">
				<jsp:param name="page" value="/flyingturtle/user/qna/list.do" />
			</jsp:include>
		</c:if>
	</div>
</div>

<script src="<c:url value="/resources/user/js/qna/list.js"/>"></script>