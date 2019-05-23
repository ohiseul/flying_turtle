<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="<c:url value="/resources/user/js/video/write.js"/>"></script>
<script  src="<c:url value="/resources/user/js/jquery-3.3.1.js"/>" ></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
 <script type="text/javascript" src="<c:url value="/resources/user/js/video/bundle.js"/>"></script>

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
        <div>메뉴바</div>                 
		<div class="wrapper">
		       <div class="componentWrapp">
		         <div id="videoForm">
	                 <input name="title" id="title" placeholder="제목을 입력하세요">
	                 <hr>
	                 <input name="content" id="content" placeholder="내용을 입력하세요">
                 </div>
                <div class="videoWrapp">
                재첨부<i class="fas fa-redo" id="resetbtn" onclick="reset();"></i>
				<div id="editorjs"></div>
                </div>
		       </div>
		</div>
		<div class="btn-area">
           <button id="save"><a href="<c:url value="/user/video/list.do"/>">저장</a></button>
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

let saveBtn = document.querySelector("#save");
saveBtn.addEventListener("click", function () {
    editor.save().then((outputData) => {

    	console.log(outputData.blocks[0].data.embed);

        $.ajax({
	       	 type:'POST',
	         url: "/flyingturtle/user/video/videowrite.do",
	       	 data: {"title":$("#title").val(),"content":$("#content").val(),"videoAddr":outputData.blocks[0].data.embed},
	       	 dataType : "json",
	      	 contentType: "application/x-www-form-urlencoded; charset=UTF-8"
	      
	    });
        
    }
).catch((error) => {
        console.log("Saving failed : ", error);
    });
});


 </script>
 