<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="item">
	<div id="subTitle">
		<h1>묻고답하기</h1>
	</div>
</div>
<table id="detailTable">
    <tr >
        <td style="height: 100px; width: 15%; background-color: #003876;"><div style="color:white;">문의</div></td>
        <td style="height: 100px;width: 70%">${detail.title}</td>
        <td style="height: 100px; width: 15%"><div class="writerName">${detail.id}</div></td>
    </tr>
    <tr>
        <td colspan="4" style="height: 300px;">${detail.content}</td>
    </tr>
    <tr>
        <c:forEach var="files" items="${file}">
        <td colspan="4" >· 파일:<a href="<c:url value="/user/qna/downFile.do?fileGroupNo=${detail.fileGroupNo}&fileNo=${files.fileNo}"/>">${files.oriName}</a>(${files.size} kb)</td>
        </c:forEach>
    </tr>
    <tr>
    	<td colspan="4">
            <a  id="qcomOpen" onclick="comOpen('app1','qcomOpen');">댓글 펼치기</a>
    		<a class="ft-Btn2" style="float: right;" href="<c:url value="/user/qna/delete.do?qnaNo=${detail.qnaNo}"/>" >삭제</a>
    		<a class="ft-Btn2" style="float: right;" href="<c:url value="/user/qna/updateform.do?qnaNo=${detail.qnaNo}"/>" >수정</a>
         </td>
    </tr>
    <tr>
    	<td colspan="4">
            <div class="qOne" id="app1"  style="display:none;">

                    <div id="wapper" >
                                <form id="commentForm" name="commentForm" method="post">
                                <input type="hidden" id="qnaNo" name="qnaNo" value="${detail.qnaNo}" />        
                                <input type="hidden" id="type" name="type" value="${detail.type}" />        
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
                                                        <div id="commentinputbutton" style="width: 40px;">
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
        	</div>
		<td>
    </tr>
</table>

<div id="bottomBtn">
<button class="ft-Btn" style="position: relative; left: 530px;" onclick="plusA();">답변등록</button>
</div>
	
	
	
<c:if test="${listAsws != null}">
    <c:forEach var="lista" items="${listAsws}">
<table id = "basicAswTable">
        <tr>
            <td style="height: 100px; width: 15%; background-color:gray;"><div style="color:white;">답변</div></td>
            <td style="height: 100px;width: 70%">${lista.title}</td>
            <td style="height: 100px; width: 15%"><div>${lista.id}</div></td>
        </tr>
        <tr>
            <td colspan="4" style="height: 300px;">${lista.content}</td>
        </tr>
        <tr>
        <td colspan="4">
                <a class="comOpen" id="acomOpen`+${lista.aswNo}+`" onclick="comOpen('app2`+${lista.aswNo}+`','acomOpen`+${lista.aswNo}+`');">댓글 펼치기</a>
                <a class="ft-Btn2" style="float: right;">삭제</a>
                <a class="ft-Btn2" style="float: right;">수정</a>
        </td>
        </tr>
        <tr>
        <td colspan="4">
                <div class="qOne" class="app2" id="app2`+i+`" style="display:none;">
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
                                                        <textarea  id="commtextareaA" name="content" placeholder="댓글을 입력하세요"></textarea>
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
    	</td>
        </tr>
    </table>	
</c:forEach>
</c:if>

	
	
<div id="aBox" style="margin-bottom: 50px;"></div>

<div style="float: right;">
<a class="ft-Btn" href="<c:url value="/user/qna/list.do"/>">목록으로</a>
</div>

 <script>
 window.onload = function() {
		$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/qna/detail.css">');
	};


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
	    function plusA(){
	    	$("#aBox").append(`
	    			<form id="aswForm`+i+`" name="aswForm`+i+`" method="post">
	    			<table id = "basicAswTable">
	    	        <tr>
	    	            <td style="height: 100px; width: 15%; background-color:gray;"><div style="color:white;">답변</div></td>
	    	            <td style="height: 100px;width: 70%"><input style="height: 100px;width:100%;" type="text" placeholder="제목을 입력해주세요" ></td>
	    	            <td style="height: 100px; width: 15%"><div>${sessionScope.user.id}</div></td>
	    	        </tr>
	    	        <tr>
	    	            <td colspan="4" style="height: 300px;"><textarea style="height: 100%;width:100%;resize:none;" ></textarea></td>
	    	        </tr>
	    	        <tr>
	    	            <td colspan="4" style="height: 50px;"><a class="ft-Btn2" style="float: right;">등록</a><a class="ft-Btn2" style="float: right;">취소</a></td>
	    	        </tr>
	    	       
	    	    </table>	
    		</form>`);

		     i++		
	}
	 
	/*댓글 등록하기(Ajax)*/
	     
	    function fn_comment(){
	        
	        $.ajax({
	            type:'POST',
	            url : "<c:url value='commentwrite.do'/>",
	            data:$("#commentForm").serialize(),
	            success : function(commentLista){
	                 getCommentList();
	                    $("textarea[name='content']").val("");
	           
	            }
	            
	        });
	    }
	     
	     
	     /*댓글 삭제*/
	    function commentdelete(num){
	        $.ajax({
	            type:'POST',
	            url : "<c:url value='commentdelete.do'/>",
	            data:"comNo="+num,
	            success : function(){
	            	alert("sdfasd");
	            			$("#"+num).remove();
	            }
	        });
	    } 
	     /*댓글 수정폼*/
	    function commentupdateform(comNo){
	    	alert("수정옴");
		    $.ajax({
		        type:'GET',
		        url : "<c:url value='commentupdateform.do'/>",
		        data:"comNo="+comNo,
		        dataType : "json",
		        success : function(data){
		        	alert("수정 다녀옴"+data.content);
		        	$("#"+comNo).html(`<div style="height: 300px;"><textarea id="text`+comNo+`" style="resize:none;width: 899px;height: 100px;"></textarea><a onclick="commentupdate(`+comNo+`);">등록</a></div>`);
		        	$("#text"+comNo).val(data.content);
		        }
		        
		    });
	    } 
	     
	     
	    function commentupdate(comNo){
	    	alert("수정 할거시다"+comNo);
	    	var data = $("#text"+comNo).val();
		    $.ajax({
		        type:'GET',
		        url : "<c:url value='commentupdate.do'/>",
		        data:{"content":data,"comNo":comNo},
		        success : function(){
		        	console.log("완벽수정 다녀옴");
		        	 getCommentList();
		        	
		        }
		        
		    });
	    } 

	    /**
	     * 초기 페이지 로딩시 댓글 불러오기
	     */
	    $(function(){
	        
	        getCommentList();
	        
	    });
	     
	    /**
	     * 댓글 불러오기(Ajax)
	     */
	     function getCommentList(){
	    	    
	    	    $.ajax({
	    	        type:'GET',
	    	        url : "<c:url value='commentlist.do'/>",
	    	        dataType : "json",
	    	        data:$("#commentForm").serialize(),
	    	        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	    	        success : function(commentLista){
	    	            
	    	            var html = "";
	    	            var cCnt = commentLista.length;
	    	            
	    	            if(commentLista.length > 0){
	    	                
	    	                for(i=0; i<commentLista.length; i++){
	    	                	console.log(commentLista[i].comNo);
	html += `<div id="`+commentLista[i].comNo+`"><div><table>`+commentLista[i].memberNo+` `+commentLista[i].content+`<a onclick="commentdelete('`+commentLista[i].comNo+`');">삭제</a><a onclick="commentupdateform('`+commentLista[i].comNo+`');">수정</a></table></div></div>`;
	    	                }
	    	                
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