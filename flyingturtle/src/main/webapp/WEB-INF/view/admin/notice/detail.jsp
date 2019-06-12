<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/notice/detail.css">');
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
	   	<a href="<c:url value="/admin/notice/list.do"/>">목록</a>
	   	<a href="<c:url value='/admin/notice/updateform.do?boardNo=${detail.boardNo}'/>">수정</a>
	   	<a href="<c:url value='/admin/notice/delete.do?boardNo=${detail.boardNo}'/>">삭제</a>
	    </div>
	        
		<br>
		<table id="nextTable">
			<tr >
				<th class="nextTableMiddle" id="next">다음글</th>
		    	<td class="nextTableMiddle" colspan="10" class="post"><a href="#">다음글로 갑시다!!</a></td>
		  	</tr>
		  	<tr >
		    	<th id="prev">이전글</th>
		    	<td colspan="10" class="post"><a href="#">이전글로 갑시다!!</a></td>
		  	</tr>
		</table>
</div>


