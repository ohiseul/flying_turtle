<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/notice/detail.css">');
</script>

<div class="item2" >
	
    	<table id="detailTable">
    		<tr class="tTitle">
    			<td id="title">${detail.title}</td>
	    		<td class="tFile" id="dateLine"><fmt:formatDate value="${detail.regDate}" pattern="yyyy.MM.dd "/></td>
    		</tr>
    		<tr class="writeAndFile">
    			<td><div id="writer">작성자</div>${detail.name}</td>
    			<td class="tFile">첨부파일:
		            <c:forEach var="f" items="${file}"> 
			              <a class="download" href="<c:url value='/user/notice/downFile.do?fileGroupNo=${detail.fileGroupNo}&fileNo=${f.fileNo}'/>">${f.oriName}</a>
		        	</c:forEach>     			
    			</td>
    		</tr>
    		<tr>
    			<td id="tContent" colspan="3">
				   	<div class="content">${detail.content}</div>    			
    			</td>
    		</tr>
       	</table>
   
   	
	   	<div class="list">
	   	<a class="submitBtn" id="listMoveBtn" href="<c:url value="/user/notice/list.do"/>">목록</a>
	    </div>
	        
		<br>
		<table id="nextTable">
		  	<tr >
		    	<th id="prev">이전글</th>
		  		<c:choose>
		  			<c:when test="${empty detail.prevTitle}"><td colspan="10" class="post">이전글이 존재하지 않습니다.</td></c:when>
			    	<c:otherwise>
			    		<td colspan="10" class="post"><a href="<c:url value="/user/notice/detail.do?boardNo=${detail.prevNo}"/>">${detail.prevTitle}</a></td>
			    	</c:otherwise>
		  		</c:choose>
		  	</tr>
			<tr >
				<th class="nextTableMiddle" id="next">다음글</th>
				<c:choose>
		  			<c:when test="${empty detail.nextTitle}"><td colspan="10" class="post">다음글이 존재하지 않습니다.</td></c:when>
			    	<c:otherwise>
			    		<td colspan="10" class="post"><a href="<c:url value="/user/notice/detail.do?boardNo=${detail.nextNo}"/>">${detail.nextTitle}</a></td>
			    	</c:otherwise>
		  		</c:choose>
		  	</tr>
		</table>
</div>


<script src="<c:url value="/resources/user/js/notice/detail.js"/>"></script>