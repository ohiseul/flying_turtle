<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <div id="qGride">
        <div id="qColor">문의</div><div>${detail.title}</div><div class="writerName">${detail.memberNo}</div>
        <div class="qOne">${detail.content}</div>
       
         <c:forEach var="files" items="${file}">
        <div id="file1">· 파일:</div><div id="file2"><a href="<c:url value="/user/qna/downFile.do?fileGroupNo=${detail.fileGroupNo}&fileNo=${files.fileNo}"/>">${files.oriName}</a>(${files.size} kb)</div>
        </c:forEach>

        <div class="qOne"><span  id="qcomOpen" onclick="comOpen('app1','qcomOpen');">댓글 펼치기</span></div>
        <div class="qOne" id="app1">

			<div id="wapper" >
					    <form id="commentForm" name="commentForm" method="post">
					    <input type="hidden" id="qnaNo" name="qnaNo" value="${detail.qnaNo}" />        
					    <br><br>
					        <div>
					            <div>
					                <span><strong>Comments</strong></span> <span id="cCnt"></span>
					            </div>
					            <div>
					                <table class="table">                    
					                    <tr>
					                        <td>
					                            <textarea style="width: 900px; height: 50px;" id="commtextarea" name="content" placeholder="댓글을 입력하세요"></textarea>
					                            <br>
					                            <div id="commentinputbutton">
					                                <a href='#' onClick="fn_comment();" id="comminsert">등록</a>
					                            </div>
					                        </td>
					                    </tr>
					                </table>
					            </div>
					        </div>
					    </form>


					<div class="container">
					    <div id="commentList">
						</div>
					</div>
	
		</div>
</div></div>

<button onclick="plusA();">답변등록</button>
	
	
	
	<c:if test="${listAsws != null}">
    		<c:forEach var="lista" items="${listAsws}">
	    		<div class="aGride">
					<div class="aColor">답변</div>
					<div class="aTitle">${lista.title}</div>
					<div class="writerName">${lista.memberNo}</div>
					<div class="qOne aTextarea">${lista.content}</div>
					<div class="qOne"><span class="comOpen" id="acomOpen`+${lista.aswNo}+`" onclick="comOpen('app2`+${lista.aswNo}+`','acomOpen`+${lista.aswNo}+`');">댓글 펼치기</span></div>
					<div class="qOne" class="app2" id="app2`+i+`" style="display:none;"></div>
							<div id="wapperA" >
								    <form id="commentFormA" name="commentForm" method="post">
								    <input type="hidden" id="aswNo" name="aswNo" value="${lista.aswNo}" />        
								    <br><br>
								        <div>
								            <div>
								                <span><strong>Comments</strong></span> <span id="cCnt"></span>
								            </div>
								            <div>
								                <table class="table">                    
								                    <tr>
								                        <td>
								                            <textarea style="width: 900px; height: 50px;" id="commtextareaA" name="content" placeholder="댓글을 입력하세요"></textarea>
								                            <br>
								                            <div id="commentinputbuttonA">
								                                <a href='#' onClick="fn_comment();" id="comminsertA">등록</a>
								                            </div>
								                        </td>
								                    </tr>
								                </table>
								            </div>
								        </div>
								    </form>
			
								<form>
									<div class="container">
									    <div id="commentListA">
										</div>
									</div>
								</form>
							</div>
				</div>
    		</c:forEach>
	</c:if>

	
	
<div id="aBox"></div>

<div id="bottomBtn"><a class="qnaBtn" href="<c:url value="/user/qna/list.do"/>">목록으로</a> <a class="qnaBtn2" href="<c:url value="/user/qna/updateform.do?qnaNo=${detail.qnaNo}"/>" >수정</a><a class="qnaBtn2" href="<c:url value="/user/qna/delete.do?qnaNo=${detail.qnaNo}"/>" >삭제</a></div>

 
       <script  src="<c:url value="/resources/user/js/jquery-3.3.1.js"/>" ></script>
       <script src="<c:url value="/resources/user/js/qna/detail.js"/>"></script>