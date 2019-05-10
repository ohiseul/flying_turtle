<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/notice/updateform.css"/>">
</head>
<body>

  <div id="body">
     <form action="<c:url value="/notice/update.do"/>" method="post">
     	<input type="hidden" name="boardNo" value="${update.boardNo}"/>
      	<div class="item">
     	 	<div id="subTitle">공지사항</div>
      	</div>
      	<div class="item2">
	        <table>
	          <tr>
	            <th>제목</th> 
	            <td colspan="3"><input id="title" name="title" value="${update.title}" type="text" placeholder="제목을 입력하세요."/></td>
	       	  </tr>
		      <tr>
		        <th>파일첨부</th>
		        <td colspan="2"><span id="contentimg"></span></td>
		        <td> 
              	<div class="filebox">  
                  <label for="ex_file">파일 선택</label>
                  <input type="file" id="ex_file" value="${update.fileGroupNo}">
              	</div>
          		</td>
      		  </tr>
            </table>
        </div>
        <div class="contentWrite">
        	<textarea name="content" rows="30" cols="4" placeholder="  내용을 입력하세요.">${update.content}</textarea>
    	</div>
        
        <div class="list">    
          <button class="button" id="button1"><span class="button__inner"><a href="<c:url value="/notice/list.do"/>">목록</a></span></button> 
          <button class="button" id="button2"><span class="button__inner">수정</span></button> 
        </div>
      </form>
    </div>
     
  <div id="footer"></div>
     
</body>

</html>