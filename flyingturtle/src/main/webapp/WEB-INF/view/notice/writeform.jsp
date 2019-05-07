<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/notice/writeform.css"/>">
<link rel="stylesheet" type="text/html" href="<c:url value="/tilesView/header.html" />">
</head>
<body>

       <div id="header">
       </div>
  <div id="body">
      <div class="item">
      </div>
      <div class="item2">
        <table>
          <tr>
            <th>제목</th> 
            <td colspan="3"><input id="title" type="text" placeholder="제목을 입력하세요."/></td>
        </tr>
        <tr>
          <th>파일첨부</th>
          <td colspan="2"><span id="contentimg"></span></td>
          <td > 
              <div class="filebox">  
                  <label for="ex_file">파일 선택</label>
                  <input type="file" id="ex_file">
              </div>
          </td>
      </tr>
        </table>
      </div>
      <div class="contentWrite">
        <textarea rows="30" cols="4" placeholder="  내용을 입력하세요."></textarea>
    </div>
        
        <div class="list">    
          <button class="button" id="button1"><span class="button__inner">목록</span></button> 
          <button class="button" id="button2"><span class="button__inner">등록</span></button> 
        </div>
      </div>
     
  <div id="footer"></div>
     
</body>
</html>