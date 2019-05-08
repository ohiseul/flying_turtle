<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/notice/list.css"/>">


</head>
<body>
 <div id="body">
      <div class="item">
          <div id="subTitle">공지사항</div>
          <div>
            <form class="search"><span></span>
              <input type="search" name="q" placeholder="What are you looking for ?" autocomplete="off" required="required"/>
              <button type="submit">&#128270;</button>
            </form>
            <div id="listCnt">전체 게시물 0개</div>
          
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
            <td><a href="<c:url value="/notice/detail.do?no=${list.boardNo}"/>"/>${list.title}</td>
        	<td>${list.name}</td>
            <td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
            <td>${list.viewCnt}</td>
            <td>파일첨부</td>
          </tr>
          </c:forEach>
      </table>
      <div class="list">    
          <button class="button"><span class="button__inner"><a href="<c:url value="/notice/writeform.do"/>">등록</a></span></button> 
      </div>
       
      </div>

  </div>
 	<script src="<c:url value="/resources/js/notice/list.js"/>"></script>
</body>
</html>