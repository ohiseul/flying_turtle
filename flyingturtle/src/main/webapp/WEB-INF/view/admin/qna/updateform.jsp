<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form method="post" id="write" name="write" action="update.do" enctype="multipart/form-data" >
    <div id="qGride">
        <div id="qColor">문의</div>
        <input type="hidden" name="type" value="'문의'" />
        
        <div><input id="aTitle" name="title" type="text" value="${update.title}"></div>
        <div class="writerName">${update.memberNo}</div>
        <div class="qOne"><textarea name="content" id="qTextarea">${update.content}</textarea></div>
        <div id="file1">· 파일:</div>
        <div class="filebox">
        	<div class="filebox bs3-primary preview-image">
                      <input type="file" id="attach" name="attach" class="upload-hidden"> 
                </div>
        </div>
        <div id="imgPreView"><div id="imgtarget"></div></div>
    </div>
<div id="bottomBtn"><button class="qnaBtn2">등록</button><a href="<c:url value="/admin/qna/list.do"/>" class="qnaBtn2">취소</a></div>
</form>
 	<script src="<c:url value="/resources/admin/js/qna/updateform.js"/>"></script>