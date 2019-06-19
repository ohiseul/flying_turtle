<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
	<script>
	    $('head').append('<link rel="stylesheet" href="<c:url value="/resources/admin/css/notice/writeform.css"/>">');
	</script>

	<h2>공지사항</h2>
	<div class="adAssRegist">
		<div class="item2">
			<form action="<c:url value="/admin/notice/write.do"/>" method="post">
				<table class="table-board board-style1">
				  <colgroup>
				    <col style="width:20%" />
				    <col style="width:65%" />
				 </colgroup>
		          <tr>
		            <th>제목</th> 
		            <td><input id="title1" name="title" type="text" placeholder="제목을 입력하세요."/></td>
		       	  </tr>
			      <tr>
			        <th>파일첨부</th>
			        <td> 
	              	<div class="filebox">  
	                  <input type="file" id="ex_file">
	              	</div>
	          		</td>
	      		  </tr>
	            </table>
	    	
	    	<div class="contentWrite">
        	<textarea name="content" id="editor" rows="2000" cols="4" placeholder="  내용을 입력하세요."></textarea>
	    	</div>
	        
	 
	        <div style="text-align:right; margin:10px 0">
			  <input
			    style="width:70px; height:40px; display:inline-block;"
			    type="button"
			    onclick="location.href='<c:url value="/admin/notice/list.do"/>';"
			    value="목록"
			    class="saveBtn"
			  />
	          <button class="saveBtn secondBtn">등록</button> 
			</div>	    
	      	</form>
    	</div>
	</div>				

 <script>
    CKEDITOR.replace( 'editor' );
    window.onload=function(){
    	 CKEDITOR.replace( 'editor',{width:'100%',height:'1000px'} );
    }
 </script>
    
<script src="<c:url value="/resources/admin/js/notice/writeform.js"/>"></script>