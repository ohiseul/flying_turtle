<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/notice/writeform.css"/>">
    <script src="//cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script>
</head>
<body>
  <div id="header"></div>
  <div id="body">
     <form action="<c:url value="/admin/notice/write.do"/>" method="post">
      	<div class="item">
     	 	<div id="subTitle">공지사항</div>
      	</div>
      	<div class="item2">
	        <table id="writeform">
	          <tr>
	            <th>제목</th> 
	            <td colspan="3"><input id="title1" name="title" type="text" placeholder="제목을 입력하세요."/></td>
	       	  </tr>
		      <tr>
		        <th>파일첨부</th>
		        <td colspan="2"><span id="contentimg"></span></td>
		        <td> 
              	<div class="filebox">  
                  <label for="ex_file">파일 선택</label>
                  <input type="file" id="ex_file">
              	</div>
          		</td>
      		  </tr>
            </table>
        </div>
        <div class="contentWrite">
        	<textarea name="content" id="editor" rows="2000" cols="4" placeholder="  내용을 입력하세요."></textarea>
    	</div>
        
        <div class="list">    
          <button class="button" id="button1"><span class="button__inner"><a href="<c:url value="/admin/notice/list.do"/>">목록</a></span></button> 
          <button class="button" id="button2"><span class="button__inner">등록</span></button> 
        </div>
      </form>
    </div>
     
  <div id="footer"></div>
  <script>
    CKEDITOR.replace( 'editor' );
    window.onload=function(){
    	 CKEDITOR.replace( 'editor',{width:'100%',height:'1000px'} );
    }
    </script>
</body>

</html>