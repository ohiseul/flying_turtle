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
        *{
            margin: 0 auto;
            padding: 0;
        }
    #qnaTable{
        margin-top: 30px;
        border-top: 2px solid royalblue; 
        border-bottom: 2px solid grey;
        border-collapse: collapse;
        width: 1100px;
        height: 600px;
        text-align: center;
    }
    #qnaTable tr{
        border-bottom: 1px solid gainsboro;
    }
    .qnapage{
        padding: 20px;
        margin: 0 auto;
        text-align: center;
    }
    .ayet{
        border-radius: 80px;
        background-color: rgb(5, 100, 225);
        width: 70px;
        height: 28px;
        line-height: 27px;
        color: white;
    }
    .adone{
        border-radius: 80px;
        background-color:gold;
        width: 70px;
        height: 28px;
        line-height: 27px;
        color: white;
    }
    tr:not(:first-child):hover {
        background-color: aliceblue;
    }
    th > div{
        width: 100%;
        height: 25px;

    }
    th > .sideline{
        border-right: 1px solid gray;
    }
#qaNo,#qaStatus,#qaWriter,#qaView{
    width:8%;
}
#qaTitle{
    width: 56%;
}
#qaReg{
    width: 10%;
}
.search {
    position: relative;
    left:350px;
    top:0px;
    width: 450px;
    height: 70px;
  }
  /* 검색버튼 동그라미 */
  .search span {
    display: block;
    position: absolute;
    /* 검색버튼 위치 */
    left: 90%;
    top: 50%;
    height: 35px;
    width: 35px;
    border: 4px solid #2196F3;
    border-radius: 100%;
    cursor: pointer;
    -webkit-transform: translate(-50%, -50%) rotate(-36deg);
            transform: translate(-50%, -50%) rotate(-36deg);
    transition: height 0.25s 0.25s ease, border-radius 0.25s 0.25s ease, -webkit-transform 0.25s 0.75s ease;
    transition: transform 0.25s 0.75s ease, height 0.25s 0.25s ease, border-radius 0.25s 0.25s ease;
    transition: transform 0.25s 0.75s ease, height 0.25s 0.25s ease, border-radius 0.25s 0.25s ease, -webkit-transform 0.25s 0.75s ease;
  }
  /* 검색버튼 막대기 */
  .search span:after {
    content: "";
    position: inherit;
    top: 28px;
    left: 16px;
    height: 20px;
    width: 6px;
    background: #2196F3;
    transition: all 0.25s 0.5s ease;
  }
  /* 돋보기모양 */
  .search button {
    position: absolute;
    left: calc(100% - 70px - (4px * 2));
    top: 8px;
    height: calc(100% - (4px * 4));
    width: 40px;
    background: none;
    border: 0;
    border-radius: 70px;
    font-size: 22px;
    /* color: rgb(1, 1, 2); */
    outline: none;
    transition: all 0.25s ease;
    visibility: hidden;
    opacity: 0;
  }
  .search input {
    width: 80%;
    height: 100%;
    padding: 15px 78px 15px 15px;
    background: none;
    border: 0;
    font-size: 15px;
    font-family: "Open Sans", sans-serif;
    color: #2196F3;
    outline: none;
    transition: all 0.25s ease;
    visibility: hidden;
    opacity: 0;
  }
  
  .search.active span {
    height: 400px;
    width:40px;
    border-radius: 50px;
    cursor: initial;
    /* 검색창 위치? */
    -webkit-transform: translate(-500%, -50%) rotate(-90deg);
            transform: translate(-500%, -50%) rotate(-90deg);
    transition: height 0.25s 0.5s ease, border-radius 0.25s 0.5s ease, -webkit-transform 0.25s ease;
    transition: transform 0.25s ease, height 0.25s 0.5s ease, border-radius 0.25s 0.5s ease;
    /* transition: transform 0.25s ease, height 0.25s 0.5s ease, border-radius 0.25s 0.5s ease, -webkit-transform 0.25s ease; */
  }
  .search.active span:after {
    height: 0;
    transition-delay: 0.25s;
  }
  /* 돋보기 위치 옮기기 */
  .search.active button {
    position: absolute;
    left: calc(100% - 100px - (4px * 2));
    visibility: visible;
    opacity: 1;
    transition-delay: 0.75s;
  }
  .search.active input {
    position: relative;
    /* input창 위치 옮기기 */
    left:50px;
    visibility: visible;
    opacity: 1;
    transition-delay: 0.75s;
  }
  /* 목록버튼 */
.button {
  font-size: 5vw;
  border: none;
  background-color: #ebebf0;
  -webkit-tap-highlight-color: rgba(255, 255, 255, 0);
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  position: relative;
  /* 버튼 위치 옮기기 */
  left:1100px;
  top:20px;
  z-index: 1;
  padding: 0;
}
 @media (min-width: 14px) {
  .button {
    font-size: 15px;
  } 
 } 
.button:before {
  content: "";
  position: absolute;
  z-index: -1;
  width: 10px;
  right: 0;
  top: 0;
  bottom: 0;
  background-color: rgba(152, 152, 155, 0.2);
  transition: -webkit-transform 0.6s cubic-bezier(0, 0.9, 0.13, 0.9);
  transition: transform 0.4s cubic-bezier(0, 0.9, 0.13, 0.9);
  transition: transform 0.6s cubic-bezier(0, 0.9, 0.13, 0.9), -webkit-transform 0.6s cubic-bezier(0, 0.9, 0.13, 0.9);
  -webkit-transform: translate3D(0, 0, 0);
          transform: translate3D(0, 0, 0);
}
.button:after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
  height: 100%;
  background-color: #ebebf0;
  z-index: -1;
}
.button:hover:before, .button:focus:before {
  -webkit-transform: translate3D(4px, 0, 0);
          transform: translate3D(4px, 0, 0);
}
.button:active:before {
  -webkit-transform: translate3D(0, 0, 0);
          transform: translate3D(0, 0, 0);
}
.button:focus, .button:active {
  outline: none;
}
.button .button__inner {
  line-height: 5px;
  text-transform: uppercase;
  letter-spacing: 0.15em;
  color: #333;
  padding: 1em 1.5em;
  background-color: #95cdfc;
  display: block;
  width: 100%;
  height: 10px;
  transition: -webkit-transform 0.6s cubic-bezier(0, 0.9, 0.13, 0.9);
  transition: transform 0.6s cubic-bezier(0, 0.9, 0.13, 0.9);
  transition: transform 0.6s cubic-bezier(0, 0.9, 0.13, 0.9), -webkit-transform 0.6s cubic-bezier(0, 0.9, 0.13, 0.9);
  position: relative;
}
.button:hover .button__inner, .button:focus .button__inner {
  -webkit-transform: translate3D(0, -5px, 0);
          transform: translate3D(0, -5px, 0);
  background-color: #a9ceec;
}
.button:active .button__inner {
  -webkit-transform: translate3D(0, 0, 0);
          transform: translate3D(0, 0, 0);
}
    </style>
</head>
<body>
   <div class="item">
        <div id="subTitle">묻고답하기</div>
        <div>
          <form class="search"><span></span>
            <input type="search" name="q" placeholder="What are you looking for ?" autocomplete="off" required="required"/>
            <button type="submit">&#128270;</button>
          </form>
          <div id="listCnt">전체 게시물 0개</div>
        
        </div> 
    </div>
    <table id="qnaTable">
        <tr>
            <th><div class="sideline">글번호</div></th>
            <th><div class="sideline">분류</div></th>
            <th><div class="sideline">제목</div></th>
            <th><div class="sideline">작성자</div></th>
            <th><div class="sideline">조회수</div></th>
            <th><div>작성일</div></th>
        </tr>
         <c:forEach var="lists" items="${list}">
        <tr href="#글번호">
                <td id="qaNo">${lists.qnaNo}</td>
                <td id="qaStatus"><div class="ayet">미답변</div></td>
                <td id="qaTitle"><a href="<c:url value="/qna/detail.do?qnaNo=${lists.qnaNo}"/>"/>${lists.title}</td>
                <td id="qaWriter">${lists.memberNo}</td>
                <td id="qaView">${lists.viewCnt}</td>
                <td id="qaReg"><fmt:formatDate value="${lists.regDate}" pattern="yyyy.MM.dd"/></td>
            </tr>
        </c:forEach>
    </table>
    <div class="qnapage">[이전][1][2][3][4][5][6][7][8][9][10][다음]</div>
    
        <button class="button"><span class="button__inner"><a href="<c:url value="/qna/writeform.do"/>">등록</a></span></button>
 	
 	<script src="<c:url value="/resources/js/notice/list(notice).js"/>"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
</body>
</html>