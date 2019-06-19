<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
window.onload = function() {
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/qna/detail.css">');
};
</script>

<!-- 지금 접속한 회원번호  -->
<input type="hidden" id="sessionNo"
	value="${sessionScope.user.memberNo}">
<!-- 해당 글번호 -->
<input type="hidden" id="qnaNoInfo" value="${detail.qnaNo}">
<!-- 글작성자 번호 -->
<input type="hidden" id="memNo" name="memberNo"
	value="${detail.memberNo}" />

<div class="item">
	<div id="subTitle">
		<h1>묻고답하기</h1>
	</div>
</div>

<!--문의글 ================================================================================================================================== -->
<table id="detailTable">
	<tr class="tTitle" >
		<td>[${detail.type}] ${detail.title}</td>
		<td><div class="writerName"><fmt:formatDate value="${detail.regDate}" pattern="yyyy.MM.dd" /></div></td>
	</tr>
	<tr class="writeAndFile">
    			<td><div id="writer">작성자</div>name</td>
    			<td class="tFile">첨부파일:
			    <c:forEach var="files" items="${file}">
					<a href="<c:url value="/user/qna/downFile.do?fileGroupNo=${detail.fileGroupNo}&fileNo=${files.fileNo}"/>">${files.oriName}</a>
				</c:forEach>
    			</td>
   	</tr>
	<tr id="dttb">
		<td colspan="4" style="height: 300px;">${detail.content}</td>
	</tr>

	<tr>
		<td colspan="4" style="background: darkblue; color:white;" >
			<a id="qcomOpen" style="color:white; margin-left:80px;" onclick="comOpen('app1','qcomOpen');">댓글 펼치기</a> 
			<a class="ft-Btn2" style="float: right; color:white; " onclick="deleteComparison(${detail.qnaNo});">삭제</a>
			<a class="ft-Btn2" style="float: right; color:white;" onclick="updateComparison(${detail.qnaNo});">수정</a>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<div class="qOne" id="app1" style="display: none;">

				<div class="commentbody">
					<form id="commentForm" name="commentForm" method="post">
						<input type="hidden" id="qnaNo" name="qnaNo" value="${detail.qnaNo}" /> 
						<input type="hidden" id="type" name="type" value="${detail.type}" /> 
						<input type="hidden" id="memberno" name="memberNo" value="${sessionScope.user.memberNo}" />
						<div class="cntDiv">
							<span><strong>Comments</strong></span> <span id="cCnt"></span>
						</div>

						<table class="commentTable">
							<tr style="border-bottom: 1px dashed lightgray; height: 100px;">
								<td style="height: 150px;"><textarea id="commtextarea"
										name="comContent" placeholder="댓글을 입력하세요"></textarea>
									<div id="commentinputbutton">
										<button id="comminsert" onclick="fn_comment();">등록</button>
									</div></td>
							</tr>
						</table>
					</form>
					<div class="container">
						<div id="commentList"></div>
					</div>

				</div>
			</div>
		</td>
	</tr>
</table>
<!-- 중간 추가 버튼================================================================================================================================= -->

<div id="bottomBtn">
	<button class="ft-Btn" style="position: relative; left: 530px;"
		onclick="plusA();">답변등록</button>
</div>


<!--답변존재시 반복문 ================================================================================================================================= -->
<c:forEach var="lista" items="${listAsws}">
	<input type="hidden" id="writerInfo" value="${lista.memberNo}">
	<div id="basicAswTable${lista.aswNo}">
		<table class="basicAswTable">
			<tr>
				<td style="height: 100px; width: 15%; background-color: gray;"><div
						style="color: white;">답변</div></td>
				<td style="height: 100px; width: 70%">${lista.title}</td>
				<td style="height: 100px; width: 15%"><div>${lista.id}</div></td>
			</tr>
			<tr>
				<td colspan="4" style="height: 300px;">${lista.content}</td>
			</tr>
			<tr>
				<td colspan="4"><a class="ft-Btn2" style="float: right;"onclick="deleteComparisonAsw(${lista.aswNo});">삭제</a> 
				<a class="ft-Btn2" style="float: right;" onclick="updateComparisonAsw(${lista.aswNo});">수정</a></td>
			</tr>
		</table>
	</div>
</c:forEach>

<div id="aBox"></div>

<div style="float: right;">
	<a class="ft-Btn-List" href="<c:url value="/user/qna/list.do"/>">목록으로</a>
</div>

<script src="<c:url value="/resources/user/js/qna/detail.js"/>"></script>