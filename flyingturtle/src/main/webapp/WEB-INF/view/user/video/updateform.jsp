<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
<script type="text/javascript" src="<c:url value="/resources/user/js/video/bundle.js"/>"></script>
<script>
$(document).ready(function() {
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/write.css">');

});
</script>
                               
 <div class="box">
 <input type="hidden" id ="subjectNo" value="${param.videoNo}"/>
      <div class="bar" style="z-index: 10;"></div>               
      <div class="wrapper">
             <div class="componentWrapp">
               <div id="videoForm">
                    <input name="title" id="title" placeholder="제목을 입력하세요" value="${update.title}">
                    <hr>
                    <input name="content" id="content" placeholder="내용을 입력하세요" value="${update.content}">
                 </div>
                <div class="videoWrapp">
                <p class="resetbtn" class="reupload"><i class="fas fa-redo"  onclick="reset();"></i> ☜ 재첨부</p>
            	<div id="editorjs" style="width: 700px; height: 580px; background-image:url(/flyingturtle/resources/user/images/video.png); background-repeat:no-repeat;"></div>
                </div>
             </div>
      </div>
      <div class="btn-area">
           <a class="submitBtn" id="save">저장</a>
        </div>


 </div>

<script>


const editor = new EditorJS({
    holderId: 'editorjs',
    autofocus: true,
    tools: { 
        embed: {
            class: Embed, 
            inlineToolbar: true,
            config: {
                services: {
                    youtube: true,
                }    
            }
        }
    }
});

let saveBtn = document.querySelector("#save");
saveBtn.addEventListener("click", function () {
		var no = $("#subjectNo").val(); //videoNo
		console.log("번호" + no);
    editor.save().then((outputData)=>{
		console.log(no);
        $.ajax({
	         url: "/flyingturtle/user/video/update.do",
	       	 data: {
	       		 	"videoNo":no,
	       		 	"title":$("#title").val(),
	       		    "content":$("#content").val(),
	       		    "videoAddr":outputData.blocks[0].data.embed
	                },
	      	 success:function (){
	    		location.href = "/flyingturtle/user/video/list.do?subjectNo=${param.subjectNo}";
	      	 }
	     });     
    }
).catch((error)=>{
        console.log("Saving failed : ", error);
    });
});


function reset() {
	$("#editorjs").empty();
	const editor = new EditorJS({
	    holderId: 'editorjs',
	    autofocus: true,
	    tools: { 
	        embed: {
	            class: Embed, 
	            inlineToolbar: true,
	            config: {
	                services: {
	                    youtube: true,
	                }    
	            }
	        }
	    }
	})
}
</script>