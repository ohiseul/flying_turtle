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
          <select id="month">
              <option value="1">1월</option>
              <option value="1">2월</option>
              <option value="1">3월</option>
              <option value="1">4월</option>
              <option value="1">5월</option>
              <option value="1">6월</option>
              <option value="1">7월</option>
          </select>
        </div> 
    </div>
    <div class="item2">
        <div id="listCnt"></div>
        <div class="button">
          <button id="monthBtn">월</button><button id="dayBtn">일</button>
        </div>
        <table class="table">
            <tr>
              <th style="width:50px;"><input type="checkbox"></th>
              <th style="width:80px;">번호</th>
              <th>학생명</th>
              <th>전체</th>
              <th>출석</th>
              <th>지각</th>
              <th>조퇴</th>
              <th>결석</th>
            </tr>
            <%-- <c:forEach items="${list}" var="l"> --%>
            <tr>
              <td style="width:50px;"><input type="checkbox"></td>
              <td style="width:80px;">1</td>
              <td>구본현</td>
              <td>28</td>
              <td>27</td>
              <td>2</td>
              <td>0</td>
              <td>1</td>
            </tr>
            <%-- </c:forEach> --%>
           
        </table>
<!-- chart가 생성될 공간 -->
        <div id="bar_chart_div"></div>
    </div>
  </div>
<!-- 날짜 현재시간으로 설정해주기 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 	<script src="<c:url value="/resources/admin/js/attend/monthList.js"/>"></script>