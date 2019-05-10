<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/qna/list.css"/>">
</head>
<body>

   <div class="item">
        <div id="subTitle">묻고답하기</div>
        <div>
          <form class="search"><span></span>
            <input type="search" name="q" placeholder="What are you looking for ?" autocomplete="off" required="required"/>
            <button type="submit">&#128270;</button>
          </form>
          <div id="listCnt">전체 게시물 0개</div>
        
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
        <tr href="#글번호">
                <td id="qaNo">${lists.qnaNo}</td>
                <td id="qaStatus"><div class="ayet">미답변</div></td>
                <td id="qaTitle"><a href="<c:url value="/qna/detail.do?qnaNo=${lists.qnaNo}"/>"/>${lists.title}</td>
                <td id="qaWriter">${lists.memberNo}</td>
                <td id="qaView">${lists.viewCnt}</td>
                <td id="qaReg"><fmt:formatDate value="${lists.regDate}" pattern="yyyy.MM.dd"/></td>
            </tr>
        </c:forEach>
    </table>
    <div class="qnapage">
			<c:if test="${pageResult.count != 0}">
				<jsp:include  page="/include/pagetype1.jsp">
					<jsp:param name="link" value="/qna/list.do"/>
				</jsp:include>
			</c:if>
   	
   	</div>
    
        <button class="button"><span class="button__inner"><a href="<c:url value="/qna/writeform.do"/>">등록</a></span></button>
 	
 	<script src="<c:url value="/resources/js/notice/list(notice).js"/>"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
</body>
</html>