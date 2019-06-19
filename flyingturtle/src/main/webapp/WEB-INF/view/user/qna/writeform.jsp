<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
window.onload = function() {
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/qna/write.css">');
};

</script>
<form method="post" id="write" name="write" action="write.do"
	enctype="multipart/form-data">
	<input type="hidden" name="memberNo"
		value="${sessionScope.user.memberNo}">
	<div id="qGride">
		<div id="qColor">문의</div>
		<input type="hidden" name="type" value="문의" />
		<div>
			<input id="aTitle" name="title" type="text" placeholder="제목을 입력해주세요">
		</div>
		<div class="writerName">${sessionScope.user.name}</div>

		<div class="qOne">
			<textarea name="content" id="qTextarea"></textarea>
		</div>
		<div id="file1">· 파일:</div>
		<div class="filebox">
			<div class="filebox bs3-primary preview-image">
				<input type="file" id="attach" name="attach" class="upload-hidden">
			</div>
		</div>

		<div id="imgPreView">
			<div id="imgtarget"></div>
		</div>
	</div>

	<div id="bottomBtn">
		<button class="submitBtn">등록</button>
		<a class="delBtn" onClick="cancel();">취소</a>
	</div>

</form>
<script src="<c:url value="/resources/user/js/qna/writeform.js"/>"></script>