<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script> 
<script>
window.onload = function() {
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/qna/write.css">');
};
</script>

<form method="post" id="write" name="write" action="write.do" enctype="multipart/form-data">
	<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo}">
	<input type="hidden" name="type" value="문의" />
	
	<table id="qnaTable" style="width: 1100px; height: 600px;">
		<colgroup>
			<col style="width:20%">
			<col style="width:80%">
		</colgroup>
		<tr style="height: 100px;">
			<th>제목</th>
			<td><input id="qnaTitle" name="title" type="text" placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<div class="contentWrite">
        		<textarea class="ckeditor" name="content" id="qnaContent" placeholder=" 내용을 입력하세요."></textarea>
	    	</div>
			</td>
		</tr>
		<tr style="height: 50px;">
			<th>파일</th>
			<td>
				<div class="filebox">
					<div class="filebox bs3-primary preview-image">
						<input type="file" id="attach" name="attach" class="upload-hidden">
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th>미리보기</th>
			<td>
				<div id="imgPreView">
					<div id="imgtarget"></div>
				</div>		
			</td>
		</tr>
	</table>
	
	<div id="bottomBtn">
		<button class="submitBtn">등록</button>
		<a class="delBtn" onClick="cancel();">취소</a>
	</div>
</form>	

<script src="<c:url value="/resources/user/js/qna/writeform.js"/>"></script>