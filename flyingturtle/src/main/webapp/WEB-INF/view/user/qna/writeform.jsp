<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="<c:url value="/resources/user/js/jquery-3.3.1.js"/>" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/user/css/qna/write.css"/>">
</head>
<body>
<form method="post" id="write" name="write" action="write.do" enctype="multipart/form-data" >
    <div id="qGride">
        <div id="qColor">문의</div>
        <input type="hidden" name="type" value="'문의'" />
        
        <div><input id="aTitle" name="title" type="text" placeholder="제목을 입력해주세요" ></div>
        <div class="writerName">자기이름</div>
        <div class="qOne"><textarea name="content" id="qTextarea"></textarea></div>
        <div id="file1">· 파일:</div>
        <div class="filebox">
        	<div class="filebox bs3-primary preview-image">
                      <input type="file" id="attach" name="attach" multiple="multiple" class="upload-hidden"> 
                </div>
        </div>
        <div id="imgPreView"><div id="imgtarget"></div></div>
    </div>
<div id="bottomBtn"><button class="qnaBtn2">등록</button><a href="<c:url value="/user/qna/list.do"/>" class="qnaBtn2">취소</a></div>
</form>

 
          <!-- include -->
   <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
   <script type="text/javascript">   
   /*파일업로드*/
   $(document).ready(function(){
   var fileTarget = $('.filebox .upload-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            // 파일명 추출
            var filename = $(this)[0].files[0].name;
        } 

        else {
            // Old IE 파일명 추출
            var filename = $(this).val().split('/').pop().split('\\').pop();
        };

        $(this).siblings('.upload-name').val(filename);
    });

    //preview image 
    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function(){
        var parent = $(this).parent();
        parent.children('.upload-display').remove();

        if(window.FileReader){
            //image 파일만
            if (!$(this)[0].files[0].type.match(/image\//)) return;
            
            var reader = new FileReader();
            reader.onload = function(e){
                var src = e.target.result;
                $("#imgtarget").prepend('<div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div>');
            }
            reader.readAsDataURL($(this)[0].files[0]);
        }

        else {
            $(this)[0].select();
            $(this)[0].blur();
            var imgSrc = document.selection.createRange().text;
            $("#imgtarget").text('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

            var img = $(this).siblings('.upload-display').find('img');
            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
        }
    });
});
          </script>
</body>
</html>