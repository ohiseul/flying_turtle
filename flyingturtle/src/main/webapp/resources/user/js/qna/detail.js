/*문의 본인확인===============================================*/ 
 function updateComparison(qnano){
	 var no = $("#sessionNo").val();
	 var owner = $("#memNo").val();
	 if(no == owner){
			swal({
				title: "글을 수정할까요?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if (willDelete) {
						window.location.href="/flyingturtle/user/qna/updateform.do?qnaNo="+qnano;
				};
			});
	 }else{
		 alert("자신의 글이 아닙니다");
	 }
 }
 function deleteComparison(qnano){
	 var no = $("#sessionNo").val();
	 var owner = $("#memNo").val();
	 if(no == owner){
			swal({
				title: "글을 삭제할까요?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if (willDelete) {
					window.location.href="/flyingturtle/user/qna/delete.do?qnaNo="+qnano+"&memberNo="+owner;
				};
			});
	 }else{
		 alert("자신의 글이 아닙니다");
	 }
 }
/* 답변 본인확인=============================================== */ 
 function updateComparisonAsw(aswNo){
	 var no = $("#sessionNo").val();
	 var owner = $("#writerInfo").val();
	 if(no == owner){
			swal({
				title: "답글을 수정할까요?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if (willDelete) {
		 /* 답글 수정폼 */
		  $.ajax({
		      type:'POST',
		      url : "/flyingturtle/user/qna/aswdetail.do",
		      data:{"aswNo":aswNo},
		      success : function(data){
				$("#basicAswTable"+data.aswNo).html(`<form  name="aswUpdateForm`+data.aswNo+`" method="post" action="/flyingturtle/user/qna/aswupdate.do" onsubmit="return check()">
				   <input type="hidden" name="aswNo" value="`+data.aswNo+`">
				   <input type="hidden" name="memberNo" value="`+data.memberNo+`">
				<table class="basicAswTable">
				
				<tr style="text-align: left;">
					<td  style="width: 13%;"><div style="padding:10px 0 ; margin:0 auto; width: 80px; height: 80px;"><img style="border-radius: 80%;width: 80px; height: 80px;"></div></td>
					<td >
						제목:
						<div style="height: 100px; width: 95%;text-align: center; display: inline-block;">
						<input id="qnaTitle" name="title" value="`+data.title+`" style="width: 100%; height: 100%;"></div>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="border-top: 1px solid lightgray;" >
					<div style="border-bottom: 1px solid lightgray; margin:20px 0;  min-height: 200px;"><textarea class="ckeditor" name="content" id="updateckedit" >`+data.content+`</textarea></div>
					</td>
				</tr>
				<tr>
					<td colspan="3" >
					<input type="submit" class="ft-Btn2" id="aswForm`+data.aswNo+`" value="등록">
						<a class="ft-Btn2"  href="/flyingturtle/user/qna/detail.do?qnaNo=`+data.qnaNo+`">취소</a>
					</td>
				</tr>
				
			</table></form>
			
<script>

function check() {
var contents = CKEDITOR.instances.updateckedit.getData();
  if(aswUpdateForm`+data.aswNo+`.title.value == "") {
    alert("제목을 입력해 주세요.");
    aswUpdateForm`+data.aswNo+`.title.focus();
    return false;

  }
  else if(contents == "") {
    alert("내용을 입력해 주세요.");
    aswUpdateForm`+data.aswNo+`.content.focus();
    return false;
  }else{
    document.aswUpdateForm`+data.aswNo+`.submit();
 }
}
</script>`);
			// 에디터 붙이기
		      CKEDITOR.replace( 'updateckedit' );
		      window.onload=function(){
		      	 CKEDITOR.replace( 'updateckedit' );
		      }
		      }
		      
		  });
				};
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
			swal({
				title: "글을 삭제할까요?",
				icon: "warning",
				buttons: true,
				dangerMode: true,
			})
			.then((willDelete) => {
				if (willDelete) {
		 $.ajax({
		      type:'POST',
		      url : "/flyingturtle/user/qna/aswdelete.do",
		     data:{"aswNo":aswNo,"qnaNo":info}
		  }).done(
		   window.location.href="/flyingturtle/user/qna/detail.do?qnaNo="+info
		  );
				};
			});
	 }else{
		 alert("자신의 글이 아닙니다");
	 }
 }
/* =======댓글창 열고 닫기==================================================== */
function comOpen(result,id){
 $("#"+result).toggle("display");
 if( $("#"+id).text() == '댓글 펼치기' ) {
   $("#"+id).text('댓글 접기');
 }
 else {
   $("#"+id).text('댓글 펼치기');
 }
}
/* ================답변 추가================================ */
var no = $("#sessionNo").val();
var qNo  = $("#qnaNoInfo").val();
function plusA(e){
$("#aBox").append(`<form name="aswForm" method="post" action="/flyingturtle/user/qna/aswwrite.do" onsubmit="return check2();">
			   <input type="hidden" name="memberNo" id="aswplusno1">
			   <input type="hidden" name="qnaNo" id="aswplusno2">
			   <input type="hidden" name="type" value="답변">
			   <table class="basicAswTableP">
			<tr style="text-align: left;">
				<td >제목:
					<div style="height: 100px; width: 95%;text-align: center; display: inline-block;">
						<input name="title" placeholder="제목을 입력하세요" style="width: 100%; height: 100%; border: none;">
					</div>
				</td>
			</tr>
			<tr>
				<td style="border-top: 1px solid lightgray;" >
					<div style="border-bottom: 1px solid lightgray; margin:20px 0;  min-height: 200px;"><textarea  name="content" id="addckedit" ></textarea></div>
				</td>
			</tr>
			<tr>
				<td>
					<button class="ft-Btn2" >등록</button>
					<a class="ft-Btn2"  href="/flyingturtle/user/qna/detail.do?qnaNo=`+qNo+`">취소</a>
				</td>
			</tr>
		</table>
		</form>
<script>
function check2() {
var contents = CKEDITOR.instances.addckedit.getData();
  if(aswForm.title.value == "") {
    alert("제목을 입력해 주세요.");
    aswForm.title.focus();
    return false;
  }
  else if(contents == "") {
    alert("내용을 입력해 주세요.");
    aswForm.content.focus();
    return false;
  }else{
 document.aswForm.submit();
 }
}
</script>
`);
			
	     CKEDITOR.replace( 'addckedit' );
	     $("#aswplusno1").val(no);
	     $("#aswplusno2").val(qNo);
	     // 답변추가 비활성화
			var el = document.getElementById("ft-Btn");
			el.disabled = 'true';

};
	 
/* 댓글 등록하기(Ajax) */
function fn_comment(){
	
    $.ajax({
        type:'POST',
        url :  "/flyingturtle/user/qna/commentwrite.do",
        data:$("#commentForm").serialize(),
        success : function(commentLista){
             $("textarea[name='comContent']").val("");
             getCommentList();
                
        }
    });
    
}   



 /* 댓글 삭제 */
function commentdelete(memno,num){
	if($("#sessionNo").val() == memno){
		swal({
			title: "댓글을 삭제할까요?",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
			    $.ajax({
			        type:'POST',
			        url :  "/flyingturtle/user/qna/commentdelete.do",
			        data:"comNo="+num,
			        success : function(){
			        	 getCommentList();
			        }
			    });
			};
		});
	} else {
		swal("작성자만 삭제할 수 있습니다.");
	}
} 
 /* 댓글 수정폼 */
function commentupdateform(memno,comno){
	if($("#sessionNo").val() == memno){
		swal({
			title: "댓글을 수정할까요?",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
				 $.ajax({
				     type:'GET',
				     url :  "/flyingturtle/user/qna/commentupdateform.do",
				     data:{"comNo":comno},
				     success : function(data){
				     	$("#"+data.comNo).html(
				     			`<td colspan="6"><textarea id="text`+data.comNo+`" style="resize:none;width: 100%;height: 100px;">`
				     			+data.comContent+`</textarea><a style="float: right;" onclick="commentupdate(`+data.comNo+`);">등록</a></td>`
				     	);
				     }
				     
				 });
			};
		});
	}  else {
		swal("작성자만 삭제할 수 있습니다.");
	}
} 
	     
 /* 댓글수정 */
function commentupdate(comNo){
	var data = $("#text"+comNo).val();
 $.ajax({
     type:'GET',
     url : "/flyingturtle/user/qna/commentupdate.do",
     data:{"comContent":data,"comNo":comNo},
     success : function(){
     	 getCommentList();
     	
     }
     
 });
} 

/* 초기 페이지 로딩시 댓글 불러오기 */
$(function(){
    getCommentList();
});

/* 댓글 불러오기(Ajax) */
function getCommentList(){    
	
$.ajax({
    type:'GET',
    url : "/flyingturtle/user/qna/commentlist.do",
    data:$("#commentForm").serialize(),
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
				html += `<tr style="padding-left:15px; border-bottom: 1px dashed lightgray; height: 100px;" id="`+comlist[i].comNo+`" ><td><div class="commentTitle" >`+comlist[i].id+`</td><td style="text-align:left;">`+comlist[i].comContent
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
