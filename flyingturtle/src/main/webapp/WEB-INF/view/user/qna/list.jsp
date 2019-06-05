<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="item">
	<div id="subTitle">
		<h1>묻고답하기</h1>
	</div>
	<div id="searchDiv">
		<form class="search" action="list.do">
			<span></span> <select id="searchType" name="searchType">
				<option value="title">제목</option>
				<option value="name">작성자</option>
			</select> <input id="search" type="text" name="keyword"
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
			<th id="status"><div class="sideline">분류</div></th>
			<th id="title"><div class="sideline">제목</div></th>
			<th id="writer"><div class="sideline">작성자</div></th>
			<th id="viewCnt"><div class="sideline">조회수</div></th>
			<th id="regDate"><div class="sideline">작성일</div></th>
		</tr>
		<c:forEach var="lists" items="${list}">
			<tr>
				<td>${lists.qnaNo}</td>
				<td>
					<div class="adone">답변완료</div>
				</td>
				<td>
					<a href="<c:url value="/user/qna/detail.do?qnaNo=${lists.qnaNo}&fileGroupNo=${lists.fileGroupNo}"/>">
					${lists.title}</a>
				</td>
				<td>${lists.memberNo}</td>
				<td>${lists.viewCnt}</td>
				<td><fmt:formatDate value="${lists.regDate}"
						pattern="yyyy.MM.dd" /></td>
			</tr>
		</c:forEach>
	</table>
</div>

<div class="page">
	<c:if test="${page.count != 0}">
		<jsp:include page="/WEB-INF/view/include/page.jsp">
			<jsp:param name="page" value="/flyingturtle/user/qna/list.do" />
		</jsp:include>
	</c:if>
</div>

<button class="ft-Btn" style="float: right;" 
      onClick="location.href='<c:url value="/user/qna/writeform.do"/>'">
	등록
</button>

<script src="<c:url value="/resources/user/js/qna/list.js"/>"></script>