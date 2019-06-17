<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="<c:url value="/resources/user/js/video/write.js"/>"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
 <script type="text/javascript" src="<c:url value="/resources/user/js/video/bundle.js"/>"></script>

 <div class="box">
      <div class="bar"></div>               
      <div class="wrapper">
             <div class="componentWrapp">
               <div id="videoForm" value="${update.videoNo}">
                    <input name="title" id="title" placeholder="제목을 입력하세요" value="${update.title}">
                    <hr>
                    <input name="content" id="content" placeholder="내용을 입력하세요" value="${update.content}">
                 </div>
                <div class="videoWrapp">
                <p class="reupload" value="${update.videoAddr}"> ☜ 재첨부</p><i class="fas fa-redo" id="resetbtn" onclick="reset();"></i> 
            <div id="editorjs" style="width: 700px; height: 580px; background-image:URL(/flyingturtle/resources/user/images/video.png); background-repeat:no-repeat;"></div>
                </div>
             </div>
      </div>
      <div class="btn-area">
           <a class="submitBtn" href="<c:url value="/user/video/list.do"/>">수정</a>
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

	let udtBtn = document.querySelector(".submitBtn");
	udtBtn.addEventListener("click", function () {
		alert("문제가 있었나요?");
	    editor.save().then((outputData) => {
	    	console.log(outputData.blocks[0].data.embed);
	        $.ajax({
	       	     type:'POST',
		         url: "/flyingturtle/user/video/update.do",
		       	 data: {"title":$("#title").val(),"content":$("#content").val(),"videoAddr":$(".reupload").val(),"videoNo":$("#videoForm").val()},
		       	 dataType : "json",
		      	 contentType: "application/x-www-form-urlencoded; charset=UTF-8"
		    });
	        
	    }
	).catch((error) => {
	        console.log("Saving failed : ", error);
	    });
	});


 </script>
 