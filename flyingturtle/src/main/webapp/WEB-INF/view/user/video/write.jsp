<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="<c:url value="/resources/user/js/video/write.js"/>"></script>
<script  src="<c:url value="/resources/user/js/jquery-3.3.1.js"/>" ></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>


<div id="top_header"></div>


					                
 <div class="box">
                <div class="buttonList">
                              <button>JAVA</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                              <button>SPRING</button>
                         </div>
                         
		<div class="wrapper">
		       <div class="componentWrapp">
		         <div id="videoForm">
	                 <input name="title" id="title" placeholder="제목을 입력하세요">
	                 <input name="content" id="content" placeholder="내용을 입력하세요">
                 </div>
                <div class="videoWrapp">
					<div id="editorjs"></div>
					<a id="resetbtn" onclick="reset();">다시첨부</a>
                </div>
		       </div>
		</div>
		
		<div class="btn-area">
            <button id="save">저장</button>
        </div>

 </div>

 <script>
const editor = new EditorJS({
    holderId: 'editorjs',
    autofocus: true,
    tools: { 
        embed: {
            class: Embed, 
            inlineToolbar: false,
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
	            inlineToolbar: false,
	            config: {
	                services: {
	                    youtube: true,
	                }    
	            }
	        }
	    }
	});
	
}

let saveBtn = document.querySelector("#save");
saveBtn.addEventListener("click", function () {
    console.dir(editor)
    editor.save().then((outputData) => {
        console.log("Article data : ", outputData);
        console.log(JSON.stringify(outputData));
        $.ajax({
	       	 type:'POST',
	         url: "/flyingturtle/user/video/videowrite.do",
	       	 data: {"title":$("#title").val(),"content":$("#content").val(),"videoAddr":JSON.stringify(outputData)},
	       	 dataType : "json",
	      	 contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	      
	    });
        
    }
).catch((error) => {
        console.log("Saving failed : ", error);
    });
});
  
 </script>