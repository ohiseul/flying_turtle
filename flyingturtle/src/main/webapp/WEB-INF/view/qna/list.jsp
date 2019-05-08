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
    </style>
</head>
<body>
        <div id="header">
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

    <div id="footer"></div>

    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
</body>
</html>