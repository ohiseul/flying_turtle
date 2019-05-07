<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/notice/list.css"/>">
<script src="../../resources/js/jquery-3.3.1.js"></script>
</head>
<body>
 <div id="header">
<jsp:include page="../../view/tilesView/header.jsp" />
  </div>
 <div id="body">
      <div class="item">
          <div id="subTitle">공지사항</div>
          <div>
            <form class="search"><span></span>
              <input type="search" name="q" placeholder="What are you looking for ?" autocomplete="off" required="required"/>
              <button type="submit">&#128270;</button>
            </form>
            <div id="listCnt">전체 게시물 0개</div>
          
          </div> 
      </div>
       
      <div class="item2">
        <table id="list">
          <tr>
            <th id="no">번호</th>
            <th id="title">제목</th>
            <th id="writer">작성자</th>
            <th id="regDate">작성일</th>
            <th id="cnt">조회수</th>
            <th id="file">첨부파일</th>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
          <tr>
            <td>1</td>
            <td>중요함!!</td>
            <td>매니저</td>
            <td>2019.05.02</td>
            <td>30</td>
            <td>파일사진</td>
          </tr>
      </table>
      <div class="list">    
          <button class="button"><span class="button__inner">등록</span></button> 
      </div>
       
      </div>

  </div>
  <script src="../../resources/js/notice/list(notice).js"></script> 
</body>
</html>