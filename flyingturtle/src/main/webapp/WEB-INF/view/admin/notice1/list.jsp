<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/admin/css/notice/list.css"/>">
</head>
<body>
 <div id="body">
 	  <div id="header"></div>
      <div class="item">
          <div id="subTitle">공지사항</div>
          <div>
         <form class="search" action="list.do"><span></span>
          	  <select id="searchType" name="searchType">
          		<option value="title">제목</option>
          		<option value="name">작성자</option>
        	  </select>
              <input id="search" type="text" name="keyword" placeholder="검색어를 입력하세요." autocomplete="off" required="required"/>
              <button id="searchButton">&#128270;</button>
            </form>
            <div id="listCnt">전체 게시물 ${page.count}개</div>
          </div> 
      </div>
       
      <div class="item2">
        <table id="list">
          <tr>
            <th id="no">번호</th>
            <th id="title">제목</th>
            <th id="name">작성자</th>
            <th id="regDate">작성일</th>
            <th id="cnt">조회수</th>
            <th id="file">첨부파일</th>
          </tr>
          <c:forEach var="list" items="${lists}">
          <tr>
            <td>${list.boardNo}</td>
            <td><a href="<c:url value="/admin/notice/detail.do?no=${list.boardNo}"/>">${list.title}</a></td>
        	<td>${list.name}</td>
            <td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
            <td>${list.viewCnt}</td>
            <td>파일첨부</td>
          </tr>
          </c:forEach>
      </table>
       <!-- 페이징 -->
		<div class="page">
            <c:if test="${pages.count != 0}">
			<jsp:include page="/WEB-INF/view/include/page.jsp">
				<jsp:param name="page" value="/flyingturtle/admin/notice/list.do" />
			</jsp:include>
			</c:if>
        </div> 
      <div class="list">    
          <button class="button"><span class="button__inner"><a href="<c:url value="/admin/notice/writeform.do"/>">등록</a></span></button> 
      </div>
       
      </div>

  </div>
    <script src="<c:url value="/resources/common/js/jquery-3.3.1.js"/>"></script>
 	<script src="<c:url value="/resources/admin/js/notice/list.js"/>"></script>
</body>
</html>