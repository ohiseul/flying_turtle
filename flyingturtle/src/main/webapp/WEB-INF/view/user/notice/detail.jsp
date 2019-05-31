<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


	<div class="item">
		<div id="subTitle">공지사항</div>
	</div>
    <div class="item2">
    	<table>
    		<tr>
    			<th id="no">${detail.boardNo}</th>
    			<th class="title"colspan="10">${detail.title}</th>
   			</tr>
          	<tr>
            	<th style="text-align: center">조회</th>
	            <td id="cnt">${detail.viewCnt}</td>
	            <th colspan="6">작성자</th>
	            <td id="writer">${detail.name}</td>
	            <th style="width:8%">작성일</th>
	            <td id="regDate"><fmt:formatDate value="${detail.regDate}" pattern="yyyy.MM.dd "/></td>
           	</tr>
	        <tr>
            	<th><div style="text-align: center;">파일첨부</div></th>
            	<td colspan="9">
            <c:forEach var="f" items="${file}"> 
	              <a class="download" href="<c:url value='/user/notice/downFile.do?fileGroupNo=${detail.fileGroupNo}&fileNo=${f.fileNo}'/>">${f.oriName}</a>
        	</c:forEach> 
	            </td>
	            <td>              
	              <div><button class="preview">바로보기</button></div>
	            </td>
            </tr>
       	</table>
   	</div>
   	
   	<div class="content">${detail.content}</div>
   	
   	<div class="list">
   		<a id="button3" href="<c:url value="/user/notice/list.do"/>"><img id="listImg"src="/flyingturtle/resources/images/list.png">목록</a> 
    </div>
        
	<br>
	<table>
		<tr>
			<th id="next">다음글</th>
	    	<td colspan="10" class="post"><a href="#">다음글로 갑시다!!</a></td>
	  	</tr>
	  	<tr>
	    	<th id="prev">이전글</th>
	    	<td colspan="10" class="post"><a href="#">이전글로 갑시다!!</a></td>
	  	</tr>
	</table>
	


<script src="<c:url value="/resources/user/js/notice/detail.js"/>"></script>