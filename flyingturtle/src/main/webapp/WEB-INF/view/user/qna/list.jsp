<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="body">
      <div class="item">
          <div id="subTitle">묻고답하기</div>
          <div>
            <form class="search" action="list.do"><span></span>
          	  <select id="searchType" name="searchType" style="position: relative;left: -180px;top: 20px;">
          		<option value="title">제목</option>
          		<option value="name">작성자</option>
        	  </select>
              <input style="position: relative;top: -35px;left: -40px;" id="search" type="text" name="keyword" placeholder="검색어를 입력하세요." autocomplete="off" required="required"/>
              <button id="searchButton">&#128270;</button>
            </form>
            <div id="listCnt">전체 게시물 ${page.count}개</div>
          
          </div> 
      </div>
      
    <table id="qnaTable">
        <tr>
            <th><div class="sideline">글번호</div></th>
            <th><div class="sideline">분류</div></th>
            <th><div class="sideline">제목</div></th>
            <th><div class="sideline">작성자</div></th>
            <th><div class="sideline">조회수</div></th>
            <th><div>작성일</div></th>
        </tr>
         <c:forEach var="lists" items="${list}">
        <tr href="#글번호" style="height: 36px;">
                <td id="qaNo">${lists.qnaNo}</td>
                <td id="qaStatus">
                <div class="adone">답변완료</div>
                </td>
                <td id="qaTitle"><a href="<c:url value="/user/qna/detail.do?qnaNo=${lists.qnaNo}&fileGroupNo=${lists.fileGroupNo}"/>"/>${lists.title}</td>
                <td id="qaWriter">${lists.memberNo}</td>
                <td id="qaView">${lists.viewCnt}</td>
                <td id="qaReg"><fmt:formatDate value="${lists.regDate}" pattern="yyyy.MM.dd"/></td>
            </tr>
        </c:forEach>
    </table>
    <div class="page">
            <c:if test="${page.count != 0}">
			<jsp:include page="/WEB-INF/view/include/page.jsp">
				<jsp:param name="page" value="/flyingturtle/user/qna/list.do" />
			</jsp:include>
			</c:if>
   	</div>
    
        <button class="button"><span class="button__inner"><a href="<c:url value="/user/qna/writeform.do"/>">등록</a></span></button>
</div>
 	<script src="<c:url value="/resources/user/js/qna/list.js"/>"></script>