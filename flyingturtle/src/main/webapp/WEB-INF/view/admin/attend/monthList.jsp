<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="body">
    <div class="item">
        <div id="subTitle"><h1>출결관리</h1></div>
        <div class="sub">
          <form class="search" action="list.do"><span></span>
              <select id="searchType" name="searchType">
                <option value="title">이름</option>
            </select>
            <input id="search" type="text" name="keyword" placeholder="검색어를 입력하세요." autocomplete="off" required="required"/>
            <button id="searchButton">&#128270;</button>
          </form>
          <select id="month" name="month"></select>
        </div> 
    </div>
    <div class="item2">
        <div id="listCnt"></div>
        <div class="button">
          <button id="monthBtn">월</button><button id="dayBtn">일</button>
        </div>
        <table class="table">
            <tr>
              <th>학생명</th>
              <th>전체</th>
              <th>출석</th>
              <th>지각</th>
              <th>조퇴</th>
              <th>결석</th>
            </tr>
           <c:forEach items="${list}" var="month"> 
            <tr>
              <td>${month.name}</td>
              <td>${month.allCount}</td>
              <td>${month.checkInCount}</td>
              <td>${month.lateCount}</td>
              <td>${month.earlyCount}</td>
              <td>${month.absentCount}</td>
            </tr>
            </c:forEach>
           
        </table>
<!-- chart가 생성될 공간 -->
        <div id="bar_chart_div"></div>
    </div>
  </div>
<!-- 날짜 현재시간으로 설정해주기 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 	<script src="<c:url value="/resources/admin/js/attend/monthList.js"/>"></script>