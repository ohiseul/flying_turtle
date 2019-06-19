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
	<tr id="dttb">
		<td style="height: 100px; width: 15%; background-color: #003876;"><div
				style="color: white;">문의</div></td>
		<td style="height: 100px; width: 70%">${detail.title}</td>
		<td style="height: 100px; width: 15%"><div class="writerName">${detail.id}</div></td>
	</tr>
	<tr id="dttb">
		<td colspan="4" style="height: 300px;">${detail.content}</td>
	</tr>
	<tr id="dttb">
		<c:forEach var="files" items="${file}">
			<td colspan="4">· 파일:<a
				href="<c:url value="/user/qna/downFile.do?fileGroupNo=${detail.fileGroupNo}&fileNo=${files.fileNo}"/>">
					${files.oriName}</a>(${files.size} kb)
			</td>
		</c:forEach>
	</tr>
	<tr>
		<td colspan="4" style="background: darkblue; color:white;" ><a id="qcomOpen" style="color:white; margin-left:80px;"
			onclick="comOpen('app1','qcomOpen');">댓글 펼치기</a> <a class="ft-Btn2"
			style="float: right; color:white; " onclick="deleteComparison(${detail.qnaNo});">삭제</a>
			<a class="ft-Btn2" style="float: right; color:white;"
			onclick="updateComparison(${detail.qnaNo});">수정</a></td>
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
				<td colspan="4"><a class="ft-Btn2" style="float: right;"
					onclick="deleteComparisonAsw(${lista.aswNo});">삭제</a> <a
					class="ft-Btn2" style="float: right;"
					onclick="updateComparisonAsw(${lista.aswNo});">수정</a></td>
			</tr>
		</table>
	</div>
</c:forEach>



<div id="aBox" style="margin-bottom: 50px;"></div>

<div style="float: right;">
	<a class="ft-Btn-List" href="<c:url value="/user/qna/list.do"/>">목록으로</a>
</div>

<script>
/*문의 본인확인===============================================*/ 
 function updateComparison(qnano){
	 var no = $("#sessionNo").val();
	 var owner = $("#memNo").val();
	 if(no == owner){
		 window.location.href="/flyingturtle/user/qna/updateform.do?qnaNo="+qnano;
	 }else{
		 alert("자신의 글이 아닙니다");
	 }
 }
 function deleteComparison(qnano){
	 var no = $("#sessionNo").val();
	 var owner = $("#memNo").val();
	 if(no == owner){
		 window.location.href="/flyingturtle/user/qna/delete.do?qnaNo="+qnano+"&memberNo="+owner;
	 }else{
		 alert("자신의 글이 아닙니다");
	 }
 }
/*답변 본인확인===============================================*/ 
 function updateComparisonAsw(aswNo){
	 var no = $("#sessionNo").val();
	 var owner = $("#writerInfo").val();
	 if(no == owner){
		 /*답글 수정폼*/
		  $.ajax({
		      type:'POST',
		      url : "<c:url value='aswdetail.do'/>",
		      data:{"aswNo":aswNo},
		      success : function(data){
				$("#basicAswTable"+data.aswNo).html(
					`<form  name="aswUpdateForm" method="post" action="<c:url value='/user/qna/aswupdate.do'/>">
					   <input type="hidden" name="aswNo" value="`+data.aswNo+`">
					   <table  class="basicAswTable" >
	        			<tr>
	            			<td style="height: 100px; width: 15%; background-color:gray;"><div style="color:white;">답변</div></td>
	            			<td style="height: 100px;width: 70%"><input style="height: 100px;width:100%;" name="title" type="text" placeholder="`+data.title+`" ></td>
	            			<td style="height: 100px; width: 15%"><div>${sessionScope.user.id}</div></td>
	        			</tr>
	        			<tr>
	            			<td colspan="4" style="height: 300px;"><textarea name="content" style="height: 100%;width:1000px;resize:none;" >`+data.content+`</textarea></td>
	        			</tr>
	       				<tr>
	            			<td colspan="4" style="height: 50px;">
	            			<button class="ft-Btn2" style="float: right;" >등록</button><a class="ft-Btn2" style="float: right;" href="/flyingturtle/user/qna/detail.do?qnaNo=`+data.qnaNo+`">취소</a>
	            			</td>
	        			</tr>
	    			   </table>	
	    			 </form>`);
		      }
		      
		  });

	 }else{
		 alert("자신의 글이 아닙니다");
	 }
 }
 function deleteComparisonAsw(aswNo){
	 var no = $("#sessionNo").val();
	 var owner = $("#writerInfo").val();
	 var info =  $("#qnaNoInfo").val();
	 if(no == owner){
		 $.ajax({
		      type:'POST',
		      url : "<c:url value='aswdelete.do'/>",
		     data:{"aswNo":aswNo,"qnaNo":info}
		  }).done(
		   window.location.href="/flyingturtle/user/qna/detail.do?qnaNo="+info
		  );

	 }else{
		 alert("자신의 글이 아닙니다");
	 }
 }
/*=======댓글창 열고 닫기====================================================*/
function comOpen(result,id){
 $("#"+result).toggle("display");
 if( $("#"+id).text() == '댓글 펼치기' ) {
   $("#"+id).text('댓글 접기');
 }
 else {
   $("#"+id).text('댓글 펼치기');
 }
}
/*================답변 추가================================*/
var i = 0;
var no = $("#sessionNo").val();
var qNo  = $("#qnaNoInfo").val();
function plusA(){
	$("#aBox").append(`<form id="aswForm`+i+`" name="aswForm`+i+`" method="post" action="<c:url value='/user/qna/aswwrite.do'/>">
					   <input type="hidden" name="memberNo" id="aswplusno1">
					   <input type="hidden" name="qnaNo" id="aswplusno2">
					   <input type="hidden" name="type" value="답변">
					   <table class = "basicAswTable">
	        			<tr>
	            			<td style="height: 100px; width: 15%; background-color:gray;"><div style="color:white;">답변</div></td>
	            			<td style="height: 100px;width: 70%"><input style="height: 100px;width:100%;" name="title" type="text" placeholder="제목을 입력해주세요" ></td>
	            			<td style="height: 100px; width: 15%"><div>${sessionScope.user.id}</div></td>
	        			</tr>
	        			<tr>
	            			<td colspan="4" style="height: 300px;"><textarea name="content" style="height: 100%;width:100%;resize:none;" ></textarea></td>
	        			</tr>
	       				<tr>
	            			<td colspan="4" style="height: 50px;">
	            			<button class="ft-Btn2" style="float: right;" >등록</button><a class="ft-Btn2" style="float: right;" href="/flyingturtle/user/qna/detail.do?qnaNo=`+qNo+`">취소</a>
	            			</td>
	        			</tr>
	    			   </table>	
	    			   </form>`);

	     i++		

	     $("#aswplusno1").val(no);
	     $("#aswplusno2").val(qNo);
};
	 
/*댓글 등록하기(Ajax)*/
function fn_comment(){
    $.ajax({
        type:'POST',
        url : "<c:url value='commentwrite.do'/>",
        data:$("#commentForm").serialize(),
        success : function(commentLista){
             getCommentList();
                $("textarea[name='comContent']").val("");
        }
    });
}   



 /*댓글 삭제*/
function commentdelete(memno,num){
	 alert("삭제왔내");
	if($("#sessionNo").val() == memno){
    $.ajax({
        type:'POST',
        url : "<c:url value='commentdelete.do'/>",
        data:"comNo="+num,
        success : function(){
        	 getCommentList();
        }
    });
	} else {
		swal("작성자만 삭제할 수 있습니다.");
	}
} 
 /*댓글 수정폼*/
function commentupdateform(memno,comno){
	 alert("수정폼 왔네");
	if($("#sessionNo").val() == memno){
		 $.ajax({
		     type:'GET',
		     url : "<c:url value='commentupdateform.do'/>",
		     data:{"comNo":comno},
		     success : function(data){
		    	 alert("컨트롤럴"+data.comNo);
		     	$("#"+data.comNo).html(
		     			`<div style="height: 300px;"><textarea id="text`+data.comNo+`" style="resize:none;width: 500px;height: 100px;">`+data.comContent+`</textarea><a onclick="commentupdate(`+data.comNo+`);">등록</a></div>`
		     	);
		     }
		     
		 });
	}  else {
		swal("작성자만 삭제할 수 있습니다.");
	}
} 
	     
 /*댓글수정*/
function commentupdate(comNo){
	var data = $("#text"+comNo).val();
 $.ajax({
     type:'GET',
     url : "<c:url value='commentupdate.do'/>",
     data:{"comContent":data,"comNo":comNo},
     success : function(){
     	 getCommentList();
     	
     }
     
 });
} 

/* 초기 페이지 로딩시 댓글 불러오기*/
$(function(){
    getCommentList();
});
/*댓글 불러오기(Ajax)*/
function getCommentList(){    
	
$.ajax({
    type:'GET',
    url : "<c:url value='commentlist.do'/>",
    dataType : "json",
    data:$("#commentForm").serialize(),
    contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
  	success : function(comlist){
		var html = "";
		var cCnt = comlist.length;
		if(comlist.length > 0){
			html=`<table class="commentTable">
				<colgroup>
			    <col style="width:15%">
			    <col style="width:50%">
			    <col style="width:10%">
			    <col style="width:3%">
      			<col style="width:3%">
			 </colgroup><tbody>`;
			for(i=0; i<comlist.length; i++){
				let date = new Date(comlist[i].regDate).toLocaleDateString();
				html += `<tr style="padding-left:15px; border-bottom: 1px dashed lightgray; height: 100px;"><td><div class="commentTitle" id="`+comlist[i].comNo+`">`+comlist[i].id+`</td><td style="text-align:left;">`+comlist[i].comContent
					 +`</td><td>`+date+`</td><td><a class="comupdt" onclick="commentdelete('`+comlist[i].memberNo+`','`+comlist[i].comNo+`')">삭제</a></td><td><a class="comdel" onclick="commentupdateform('`+comlist[i].memberNo+`','`+comlist[i].comNo+`')">수정</a></div></td></tr>`;
		    }
		    	html+=`</tbody></table>`;
			} else {
			    html += "<div>";
			    html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
			    html += "</table></div>";
			    html += "</div>";
		}
  	            $("#cCnt").html(cCnt);
  	            $("#commentList").html(html);
  	        }
 	    });
}  
 </script>
<%--        <script src="<c:url value="/resources/user/js/qna/detail.js"/>"></script> --%>