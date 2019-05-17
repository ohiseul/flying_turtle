<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<div id="header"></div>
      <div class="item">
          <div id="subTitle">동영상강의</div>
          <div id="searchDiv">
            <form class="search" action="list.do"><span></span>
          	  <select id="searchType" name="searchType">
          		<option value="title">제목</option>
          		<option value="name">작성자</option>
        	  </select>
              <input id="search" type="text" name="keyword" placeholder="검색어를 입력하세요." autocomplete="off" required="required"/>
              <button id="searchButton">&#128270;</button>
            </form>
      	 </div>
 	  </div>
 	 <div >
 	 
 	 </div>
 	<script src="<c:url value="/resources/user/js/dictionary/list.js"/>"></script>