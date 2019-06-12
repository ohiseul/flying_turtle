<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




    
 	
 	
 	
 	
 	
 	
	<h2>묻고답하기</h2>
	<!-- 작업시작부분 div안에 클래스명 넣어서 작업 해 주세요 나머지 url부분은 추후 취합할 예정이니 일단 MENU 부분의 링크태그에 값 넣어서 작업 해주시면 됩니다. 게시판 담당하시는 분들은 추후 공통 클래스 드릴테니 일단 테이블로 작업 부탁드립니다. -->
	
	
	<div class="adAssRegist">
		<div class="search-wrapper">
			<div id="searchDiv">
				<form class="search form" action="/flyingturtle/admin/notice/list.do">
					<span></span> 
					
					<!-- <select style="display:none !important;" id="searchType" name="searchType">
						<option value="title">제목</option>
						<option value="name">작성자</option>
					</select>  -->
					<input type="hidden" id="searchType" name="searchType" value="title" />
					
					<input id="search" type="text" name="keyword"
						placeholder="검색어를 입력하세요." autocomplete="off" required="required" />
					<button id="searchButton">&#128270;</button>
				</form>
				<div id="listCnt">전체 게시물 ${page.count}개</div>
			</div>
		</div>
	  <table class="table-board board-style1">
	    <colgroup>
	    <col style="width:10%" />
	    <col style="width:15%" />
	    <col style="width:45%" />
	    <col style="width:10%" />
	    <col style="width:10%" />
	    <col style="width:10%" />
	  </colgroup>
	  

	  
	  <tr >
			<th id="no">글번호</th>
			<th id="file">분류</th>
			<th id="title">제목</th>
			<th id="writer">작성자</th>
			<th id="cnt">조회수</th>
			<th id="regDate">작성일</th>	    
	  </tr>
	
	
	
		<c:forEach var="lists" items="${list}">
			<tr href="#글번호" height="30px;" style="text-align: center;">
				<td id="qaNo">${lists.qnaNo}</td>
                <td id="qaStatus"><div class="ayet">미답변</div></td>
                <td id="qaTitle"><a href="<c:url value="/admin/qna/detail.do?qnaNo=${lists.qnaNo}"/>"/>${lists.title}</td>
                <td id="qaWriter">${lists.memberNo}</td>
                <td id="qaView">${lists.viewCnt}</td>
                <td id="qaReg"><fmt:formatDate value="${lists.regDate}" pattern="yyyy.MM.dd"/></td>
			</tr>
		</c:forEach>
	  </table>
	</div>
	<div>
	  	<div style="text-align:right; margin:10px 0">
		  <input
		    style="width:70px; height:40px; display:inline-block;"
		    type="button"
		    onclick="location.href='<c:url value="/admin/qna/writeform.do"/>';"
		    value="등록"
		    class="saveBtn"
		  />
		</div>
		<!-- 페이징 부분 -->
		<div class="page">
			<c:if test="${page.count != 0}">
				<jsp:include page="/WEB-INF/view/include/adminPage.jsp">
					<jsp:param name="page" value="/flyingturtle/admin/qna/list.do" />
				</jsp:include>
			</c:if>
		</div>
	</div>

<script src="<c:url value="/resources/admin/js/qna/list.js"/>"></script> 	