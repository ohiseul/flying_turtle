<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/attend/monthList.css">',
'<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">');
</script>

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
        </div> 
    </div>
    <div class="item2">
         <div class="box">
			  <select id="year">
			    <option selected>2018</option>
			    <option <c:if test="${not empty param.month and param.month.startsWith('2019')}">selected</c:if>>2019</option>
			  </select>
		</div>
		 <div class="box second">
			  <select id="months" name="months">
			  <c:forEach var="i" begin="1" end="12">
			  	<option value="<c:if test="${i<10}">0</c:if>${i}"
			  		<c:if test="${not empty param.month and param.month.endsWith(i)}">selected</c:if>
			  	>${i}</option>
			  </c:forEach>
			  </select>
		</div>
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
           <c:if test="${empty list}">
           		<tr><td colspan="6">데이터가 존재하지 않습니다.</td></tr>
           </c:if>
        </table>
<!-- chart가 생성될 공간 -->
        <div id="bar_chart_div"></div>
    </div>
  </div>
  
  
  <script>
  	let dataArr = [];
  	<c:forEach var="item" items="${chart}">
  		dataArr.push(['${item.name}', ${item.checkInCount}, ${item.absentCount}, ${item.lateCount}, ${item.earlyCount}, '']);
  	</c:forEach>
  </script>
  
<!-- 날짜 현재시간으로 설정해주기 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 	<script src="<c:url value="/resources/admin/js/attend/monthList.js"/>"></script>