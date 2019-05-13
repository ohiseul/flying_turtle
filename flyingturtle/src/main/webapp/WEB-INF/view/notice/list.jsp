<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <div id="body">
 	  <div id="header"></div>
      <div class="item">
          <div id="subTitle">공지사항</div>
          <div>
            <form class="search" action="<c:url value="/notice/list.do"/>"><span></span>
              <input id="search" type="text" name="keyword" placeholder="What are you looking for ?" autocomplete="off" required="required"/>
              <button id="searchButton" type="submit">&#128270;</button>
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
            <td><a href="<c:url value="/notice/detail.do?no=${list.boardNo}"/>">${list.title}</a></td>
        	<td>${list.name}</td>
            <td><fmt:formatDate value="${list.regDate}" pattern="yyyy.MM.dd"/></td>
            <td>${list.viewCnt}</td>
            <td>파일첨부</td>
          </tr>
          </c:forEach>
      </table>
       <!-- 페이징 -->
		<div class="page">
            <c:if test="${page.count != 0}">
			<jsp:include page="/WEB-INF/view/include/page.jsp">
				<jsp:param name="page" value="/flyingturtle/notice/list.do" />
			</jsp:include>
			</c:if>
        </div> 
      <div class="list">    
          <button class="button"><span class="button__inner"><a href="<c:url value="/notice/writeform.do"/>">등록</a></span></button> 
      </div>
       
      </div>

  </div>
 	<script src="<c:url value="/resources/js/notice/list.js"/>"></script>

</body>
</html>