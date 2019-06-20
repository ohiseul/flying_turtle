<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script> 
<script>
	$(document).ready(function(){
		 CKEDITOR.replace( 'content' );
	});
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/qna/update.css">');
</script>

<form method="post" name="upQna" action="/flyingturtle/user/qna/update.do" onsubmit="return check()" enctype="multipart/form-data">
	<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo}">
	<input type="hidden" name="type" value="문의" />
	<input type="hidden" name="qnaNo" value="${update.qnaNo}" />
	<input type="hidden" name="fileGroupNo" value="${update.fileGroupNo}" />
	
	<table id="qnaTable" style="width: 1100px; height: 600px;">
		<colgroup>
			<col style="width:20%">
			<col style="width:80%">
		</colgroup>
		<tr style="height: 100px;">
			<th>제목</th>
			<td><input id="qnaTitle" name="title" type="text" value="${update.title}"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			<div class="contentWrite">
        		<textarea name="content" id="content" >${update.content}</textarea>
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
	<input type="submit" class="submitBtn" value="등록" >
		<a class="delBtn" onClick="cancel();">취소</a>
	</div>
</form>	

<script>


//널값 체크
function check() {
	var contents = CKEDITOR.instances.content.getData();
	  if(upQna.title.value == "") {
	    alert("제목을 입력해 주세요.");
	    upQna.title.focus();
	    return false;
	  }
	  else if(contents == "") {
	    alert("내용을 입력해 주세요.");
	    upQna.content.focus();
	    return false;
	  }else{
	    document.upQna.submit();
	 }
}
</script>
<script src="<c:url value="/resources/user/js/qna/updateform.js"/>"></script>