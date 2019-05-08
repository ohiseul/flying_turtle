<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
    <style>
  /*=====qna 파트==================================================*/

    #qGride{
      border: 1px solid gainsboro;
      border-top: 3px solid #666666; 
      margin: 0 auto;
      width: 900px;
      display: grid;
      grid-template-columns: 100px 650px 150px;
      grid-template-rows: 100px 400px 40px 30px auto;
      margin-top: 20px; margin-bottom: 20px;
      text-align: center;
    }
    #qGride span{
      float: right;
    }
    .aGride{
      border: 1px solid gainsboro;
      border-top: 3px solid #666666; 
      margin: 0 auto;
      width: 900px;
      display: grid;
      grid-template-columns: 100px 650px 150px;
      grid-template-rows:100px 300px 30px auto;
      text-align: center;
      margin-top: 20px; margin-bottom: 20px;
    }
    #qGride div,.aGride div{
      width: 100%;
    }
    .qOne{
      grid-column: 1 / 4;
      border-bottom: 1px solid gainsboro;
    }
    #file1{
      grid-column: 1 / 2;
    }
    #file2{
      grid-column: 2 / 4;
    }
    #file1,#file2{
      border-top: 1px dashed #d0d0d0;
      border-bottom: 1px solid #d0d0d0;
      line-height: 40px;
    }
    #qColor{
      background-color: rgb(5, 100, 225);
      color: white;
    }
    .aColor{
    width:100%;
      background-color:rgb(238, 214, 76);
      color: white;
    }
    .qnaBtn{
      border-style: none;
      background-color: #fff;
      border: 1px solid gainsboro;
      position: relative;
      left: 600px;
      height: 40px;
    }
    .qnaBtn2{
      border-style: none;
      background-color: #fff;
      border: 1px solid gainsboro;
      position: relative;
      width: 42px;
      left: 920px;
      height: 40px;
      margin-left: 5px;
    }
    .writerName{
      background-color: #d0d0d0;
    }
    #qGride div:nth-child(-n+3),.aGride div:nth-child(-n+3){
      line-height: 100px;
      border-bottom: 1px solid gainsboro;

    }
   /*=====댓글파트==================================================*/
   #app1{
     display: none;

   }
   .comments {
     max-width: 900px;
     margin: 20px auto;
   }
    .comments a, a:hover {
      transition: .25s color linear;
    }

    article time, article:hover time {
      transition: .25s opacity linear;
    }
      .comments article {
      position: relative;
      border-bottom: solid 1px rgba(178, 179, 153, 0.125);
      margin: 5px auto;
    }
    .comments article:last-child {
      border: none;
    }
    .comments article:hover time {
      opacity: 1;
    }
    .comments article p{
        margin-top: 10px;
      }
    .comments article h4 {
      display: inline-block;
      font-weight: 400;
    }
    .comments article h4 a{
      color: #404040;
      text-transform: lowercase;
      text-decoration: none;
    }
    .comments article h4 a:hover{
      color: #BFBFA8;
    }
    .comments article time{
      color: #545454;
      margin-left: 1rem;
      text-transform: uppercase;
      font-size: .75rem;
      opacity: 0;
      font-weight: 300;
    }
.comments article .active{
      opacity: 1;
    }

    @media (max-width: 650px) {
      .comments{
        width: 100%;
        padding: 0 1rem;
      }
      .comments article{
        width: 90%;
      }
      .comments article h4{
        display: inline-block;
      }
      .comments article h4 time{
        display: block;
        margin-left: 0 !important;
        opacity: .5 !important;
      }
    }
    .comments textarea{
      resize: none;
      width: 885px;
      height: 70px;
      margin-left: 6px;
      border: 1px solid gainsboro;
    }
    .comBtn,.comBtn2{
      border-style: none;
      background-color: #fff;
      border: 1px solid gainsboro;
      position: relative;
      left: 860px;
    }
    .comBtn2{
      left: 825px;
      margin-right: 10px;
    }
    #qGride .qOne .comments article, .aGride .qOne .comments article{
     text-align: left;
    }
    .aTextarea{
      resize: none;
      width: 899px;
      height: 100%;
    }
    .aTitle{
      width: 100%;
      height: 100%;
      background-color:  #F4F5F7;
      border: none;
    }
    .aWriter{
      width: 147px;
      height: 100%;
      background-color: #d0d0d0;
      border: none;
    }
    .acomOpen{
      float: right;
    }
    #bottomBtn{
      margin: 50px 0;
    }
    /*=======================================================*/
  </style>
</head>
<body>

    <div id="qGride">
        <div id="qColor">문의</div><div>${detail.title}</div><div class="writerName">${detail.memberNo}</div>
        <div class="qOne">${detail.content}</div>
        <div id="file1">· 파일:</div><div id="file2">첨부파일명</div>
        <div class="qOne"><span  id="qcomOpen" onclick="comOpen('app1','qcomOpen');">댓글 펼치기</span></div>
        <div class="qOne" id="app1">
          <section class="comments">
            <article>
              <p> <textarea></textarea> <button class="comBtn" onclick="addComment();">등록</button></p>
            </article>
            <article>
                <h4><a href="#">박지수</a></h4>
                <time>2 weeks ago</time>
                <p>잘몰랐던건데 감사합니다</p>
                  <button class="comBtn2">수정</button><button class="comBtn2">삭제</button>  
            </article>
            <article>
              <h4><a href="#">최주희</a></h4>
              <time>2 weeks ago</time>
              <p>4번쨰 줄에서 오류나는데 무슨 문제일까요?</p>
                <button class="comBtn2">수정</button><button class="comBtn2">삭제</button>  
            </article>
          </section>


        </div>
    </div>
    <button class="qnaBtn" onclick="plusA();">답변등록</button>
	<div id="aBox"></div>

<div id="bottomBtn"><button class="qnaBtn">목록으로</button> <button class="qnaBtn2" >수정</button><button class="qnaBtn2">삭제</button></div>

 
          <!-- include -->
       <script  src="<c:url value="/resources/js/jquery-3.3.1.js"/>" ></script>
   <script type="text/javascript">   
 
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
    	alert("뭔데ㅠㅠ");
$("#aBox").append(`<div class="aGride"><div class="aColor">답변</div><div><input class="aTitle" type="text" placeholder="제목을 입력해주세요" ></div><div class="writerName"><input class="aWriter" type="text" placeholder="작성자를 입력해주세요"></div>
<div class="qOne"><textarea class="aTextarea"></textarea></div>
<div class="qOne"><span class="acomOpen" id="acomOpen`+i+`" onclick="comOpen('app2`+i+`','acomOpen`+i+`');">댓글 펼치기</span></div>
<div class="qOne" class="app2" id="app2`+i+`" style="display:none;">
<section class="comments"><article><p><textarea></textarea> <button class="comBtn" onclick="addComment();">등록</button></p></article></section></div></div>`).trigger("create");

     i++
    }
</script>
</body>
</html>