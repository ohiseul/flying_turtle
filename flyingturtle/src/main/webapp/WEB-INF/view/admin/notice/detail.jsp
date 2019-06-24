<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/notice/detail.css">');
</script>


<!--  test-class 부분을  s-aaa 형식의 이름으로 클래스 잡아주세요  common 클래스 이름은 지우지 마세요 -->
  	<!--  작업부분 제목 써주세요 -->
	<h2>공지사항</h2>
	<!-- 작업시작부분 div안에 클래스명 넣어서 작업 해 주세요 나머지 url부분은 추후 취합할 예정이니 일단 MENU 부분의 링크태그에 값 넣어서 작업 해주시면 됩니다. 게시판 담당하시는 분들은 추후 공통 클래스 드릴테니 일단 테이블로 작업 부탁드립니다. -->
	
	
	<div class="adAssRegist">

	  <table class="table-board board-style1">
	    <colgroup>
		    <col style="width:10%" />
		    <col style="width:15%" />
		    <col style="width:70%" />
		    <col style="width:20%" />
		    
	  	</colgroup>
		  <tr>
			<td  colspan="3" id="title">${detail.title}</td>
    		<td  class="tFile" id="dateLine"><fmt:formatDate value="${detail.regDate}" pattern="yyyy.MM.dd "/></td>
		  </tr>
		  <tr>
   			<td><div id="writer">작성자</div></td>
   			<td id="write">${detail.name}</td>
   			<td></td>
   			<td  class="tFile">첨부파일:
	            <c:forEach var="f" items="${file}"> 
		              <a class="download" href="<c:url value='/user/notice/downFile.do?fileGroupNo=${detail.fileGroupNo}&fileNo=${f.fileNo}'/>">${f.oriName}</a>
	        	</c:forEach>     			
   			</td>
	      </tr>
	      <tr>
   			<td colspan="4">
			   	<div class="content">${detail.content}</div>    			
   			</td>
    	  </tr>
	  </table>
	<div>
	  	<div style="text-align:right; margin:10px 0">
		  <input
		    style="width:70px; height:40px; display:inline-block; position: relative; left: 51px; bottom: 5px;"
		    type="button"
		    onclick="location.href='<c:url value="/admin/notice/updateform.do"/>';"
		    value="수정"
		    class="saveBtn"/>
			<a class="saveBtn" id="listMoveBtn" href="<c:url value="/admin/notice/list.do"/>">목록</a>
	   	<a class="saveBtn" id="delBtn" href="<c:url value='/admin/notice/delete.do?boardNo=${detail.boardNo}'/>">삭제</a>
		</div>
<%-- 		<a href="<c:url value="/admin/notice/list.do"/>">목록</a> --%>
<%-- 	   	<a href="<c:url value='/admin/notice/updateform.do?boardNo=${detail.boardNo}'/>">수정</a> --%>
		<div >
		</div>
	</div>
	<table class="table-board board-style1">
	  	<tr >
	    	<th >이전글</th>
	  		<c:choose>
	  			<c:when test="${empty detail.prevTitle}"><td colspan="10" class="post">이전글이 존재하지 않습니다.</td></c:when>
		    	<c:otherwise>
		    		<td colspan="7" class="post"><a href="<c:url value="/admin/notice/detail.do?boardNo=${detail.prevNo}"/>">${detail.prevTitle}</a></td>
		    	</c:otherwise>
	  		</c:choose>
	  	</tr>
		<tr >
			<th  id="next">다음글</th>
			<c:choose>
	  			<c:when test="${empty detail.nextTitle}"><td colspan="10" class="post">다음글이 존재하지 않습니다.</td></c:when>
		    	<c:otherwise>
		    		<td colspan="7" class="post"><a href="<c:url value="/admin/notice/detail.do?boardNo=${detail.nextNo}"/>">${detail.nextTitle}</a></td>
		    	</c:otherwise>
	  		</c:choose>
	  	</tr>
	</table>	
	</div>