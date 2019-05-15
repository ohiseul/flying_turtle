<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <div id="header"> </div>
  <div id="body">
      <div class="item">
        <div id="subTitle">공지사항</div>
      </div>
      <div class="item2">
        <table>
          <tr>
            <th id="no">${detail.boardNo}</th>
            <th class="title"colspan="10">${detail.title}</th>
          </tr>
          <tr>
            <th style="text-align: center">조회</th>
            <td id="cnt">${detail.viewCnt}</td>
            <th colspan="6">작성자</th>
            <td id="writer">${detail.name}</td>
            <th style="width:8%">작성일</th>
            <td id="regDate"><fmt:formatDate value="${detail.regDate}" pattern="yyyy.MM.dd "/></td>
          </tr>
          <tr>
            <th><div style="text-align: center;">파일첨부</div></th>
            <td colspan="9">
              <div class="file"><a class="download" href=""><span>파일사진 </span><span>파일1.hwp</span></a></div>
              <div class="file"><a class="download" href=""><span>파일사진 </span><span>파일2.hwp</span></a></div>
              <div class="file"><a class="download" href=""><span>파일사진 </span><span>파일2.xlsx</span></a></div>
            </td>
            <td>              
              <div><button class="preview">바로보기</button></div>
              <div><button class="preview">바로보기</button></div>
              <div><button class="preview">바로보기</button></div>
            </td>
          </tr>
        </table>
      </div>
        <div class="content">${detail.content}</div>
        
          <div class="list">    
          <button class="button" id="button3"><span class="button__inner"><a href="<c:url value="/user/notice/list.do"/>">목록</a></span></button> 
        </div>
      <br>
      <table>
        <tr>
          <th id="next">다음글</th>
          <td colspan="10" class="post"><a href="#">다음글로 갑시다!!</a></td>
        </tr>
        <tr>
          <th id="prev">이전글</th>
          <td colspan="10" class="post"><a href="#">이전글로 갑시다!!</a></td>
        </tr>
      </table>
  <div id="footer"></div>
  </div>
  <script src="<c:url value="/resources/user/js/notice/detail.js"/>"></script>