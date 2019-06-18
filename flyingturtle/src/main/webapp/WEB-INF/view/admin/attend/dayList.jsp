<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/attend/dayList.css">');
</script>

<h2>출결관리</h2>
	<div class="adAssRegist">
		<div class="search-wrapper">
			<div id="searchDiv">
				<form class="search form">
					<span></span> 
					
					<input type="hidden" id="searchType" name="searchType" value="name" />
					
					<input id="search" type="text" name="keyword"
						placeholder="검색어를 입력하세요." autocomplete="off" required="required" />
					<button id="searchButton">&#128270;</button>
				</form>
				 <input id="date" type="date" name="date">
			</div>
		</div>
		<div class="button">
            <button id="monthBtn">월</button><button id="dayBtn">일</button>
        </div>
        <div class="tableDiv">
      	
	        <table class="table">
	            <tr>
	                <th>전체</th>
	                <th>출석</th>
	                <th>지각</th>
	                <th>조퇴</th>
	                <th>결석</th>
	            </tr>
	            <tr>
	                <td id="all">${AllCount}명</td>
	                <td id="checkIn">${count.checkInCount}명</td>
	                <td id="late">${count.lateCount}명</td>
	                <td id="early">${count.earlyCount}명</td>
	                <td id="absent">${count.absentCount}명</td>
	            </tr>
	        </table>
	        <table class="table-board board-style1">
		        <colgroup>
				    <col style="width:5%" />
				    <col style="width:5%" />
				    <col style="width:15%" />
				    <col style="width:10%" />
				    <col style="width:10%" />
				    <col style="width:10%" />
				    <col style="width:10%" />
				    <col style="width:25%" />
				 </colgroup>
		            <tr>
		                <th><input type="checkbox" id="check"></th>
		                <th>번호</th>
		                <th>학생명</th>
		                <th>입실시간</th>
		                <th>퇴실시간</th>
		                <th>출결상태</th>
		                <th>관리</th>
		                <th>특이사항</th>
		            </tr>
	            <c:forEach items="${List}" var="attend">
		            <tr id="row">  
		                <td ><input type="checkbox" name="memberNo" value="${attend.memberNo}"></td>
		                <td >${attend.attendNo}</td>
		                <td>${attend.name}</td>
		                <td><fmt:formatDate value="${attend.checkIn}" pattern="HH:mm"/></td>
		                <td><fmt:formatDate value="${attend.checkOut}" pattern="HH:mm"/></td>
		                <td id="codeName">${attend.codeName}</td>
		                <td>
		                    <select class="state" name="codeNo">
		                        <option>변경</option>
		                        <option value="20">출석</option>
		                        <option value="21">지각</option>
		                        <option value="22">조퇴</option>
		                        <option value="23">결석</option>
		                    </select>
		                </td>
		                <td><input class="memo" name="memo" type="text" placeholder="상태변경 이유를 적어주세요" value="${attend.specialNote}"></td>
		            	</tr>
	            	</c:forEach>
	            	<c:if test="${empty List}">
			        	<tr><td colspan="8">데이터가 존재하지 않습니다.</td></tr>
			        </c:if>
	       		</table><br>
	      	</div>
	    
        <div class="save"><button class="saveBtn" id="saveBtn">저장</button></div>
<!-- chart가 생성될 공간 -->
        <div id="chart_div"></div>    
	</div>

	<script>
		let dataArr = [];
		<c:forEach var="item" items="${chart}">
			dataArr.push(['${item.attendRegDate}',${item.memberCount}]);
		</c:forEach>
	</script>
<!-- 날짜 현재시간으로 설정해주기 -->
	<script>document.getElementById('date').value=new Date().toISOString().substring(0,10);</script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 	<script src="<c:url value="/resources/admin/js/attend/dayList.js"/>"></script>