<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script> 
<script>
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/qna/detail.css">');
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
	<tr id="tTitle" >
		<td id="qtitle">[${detail.type}] ${detail.title}</td>
		<td id="dateLine" ><div class="writerName"><fmt:formatDate value="${detail.regDate}" pattern="yyyy.MM.dd" /></div></td>
	</tr>
	<tr class="writeAndFile">
    			<td id="qwriter"><div id="writer">작성자</div> ${detail.id} </td>
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
		<td colspan="4" id="fnBtn" >
			<span style="float: left;line-height: 50px;">댓글 <span id="cCnt"></span> 개&nbsp;&nbsp;&nbsp;
			<a id="qcomOpen"  onclick="comOpen('app1','qcomOpen');">댓글 펼치기</a> </span>
			<a class="ft-Btn2"  onclick="deleteComparison(${detail.qnaNo});">삭제</a>
			<a class="ft-Btn2" onclick="updateComparison(${detail.qnaNo});">수정</a>
		</td>
	</tr>
	<tr>
		<td colspan="4">
			<div class="qOne" id="app1" style="display: none;">

				<div class="commentbody">
							<table class="commentTable">
								<tr style="border-bottom: 1px dashed lightgray; height: 100px;">
									<td style="height: 150px;">
										<form id="commentForm" name="commentForm" method="post">
											<input type="hidden" id="qnaNo" name="qnaNo" value="${detail.qnaNo}" /> 
											<input type="hidden" id="type" name="type" value="${detail.type}" /> 
											<input type="hidden" id="memberno" name="memberNo" value="${sessionScope.user.memberNo}" />
													<textarea id="commtextarea" name="comContent" placeholder="댓글을 입력하세요"></textarea>
										</form>
										<div id="commentinputbutton">
											<button id="comminsert" onclick="fn_comment();">등록</button>
										</div>
									</td>
								</tr>
							</table>
							<div class="container">
								<div id="commentList"></div>
							</div>
				</div>
				</div>
		</td>
	</tr>
</table>

<div style="margin: 0 auto;text-align: center; margin: 30px 0; ">
	<a class="ft-Btn" href="<c:url value="/user/qna/list.do"/>">목록으로</a>
</div>
<!-- 중간 추가 버튼================================================================================================================================= -->
<div id="bottomBtn" style="border-top: 3px dotted navy; padding-top: 20px;">
	<span>답변 ${aswNo} 개</span>
	<button id="insertAsw" onclick="plusA();">답변하기</button>
</div>

<!--답변존재시 반복문 ================================================================================================================================= -->
<c:forEach var="lista" items="${listAsws}">
	<input type="hidden" id="writerInfo${lista.aswNo}" value="${lista.memberNo}">
	<div id="basicAswTable${lista.aswNo}" style="width:1000px; border: 1px solid gray; margin: 10px auto;">
		<table class="basicAswTable">
			<tr style="text-align: left;">
				<td  style="width: 13%;"><div style="padding:10px 0 ; margin:0 auto; width: 80px; height: 80px;"><img style="border-radius: 80%;width: 80px; height: 80px;" src='<c:url value="/resources/images/adminMainRogo.png"/>'></div></td>
				<td >
					<div style="display: inline-block;width:20%;" >${lista.id}님의 답변 </div>   
					<div style="text-align:center; width:45%; display: inline-block;">${lista.title}</div></td>
			</tr>
			<tr>
				<td colspan="3" style="border-top: 1px solid lightgray;" >
				<div style="border-bottom: 1px solid lightgray; margin-top:20px;  min-height: 200px;">${lista.content}</div>
				</td>
			</tr>
			<tr>
				<td colspan="3" >
					<a class="ft-Btn2" onclick="deleteComparisonAsw(${lista.aswNo});">삭제</a> 
					<a class="ft-Btn2"onclick="updateComparisonAsw(${lista.aswNo});">수정</a>
				</td>
			</tr>
		</table>
	</div>
</c:forEach>

<div id="aBox"></div>


<script src="<c:url value="/resources/user/js/qna/detail.js"/>"></script>