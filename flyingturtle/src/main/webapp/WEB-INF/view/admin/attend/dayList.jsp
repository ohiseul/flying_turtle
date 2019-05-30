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
          <input id="date" type="date" >
        </div> 
    </div>
    <div class="item2">
        <div class="button">
                <button id="monthBtn">월</button><button id="dayBtn">일</button>
        </div>
        <table class="table">
            <tr>
                <th>전체</th>
                <th>출석</th>
                <th>지각</th>
                <th>조퇴</th>
                <th>결석</th>
            </tr>
            <tr>
                <td>0명</td>
                <td>0명</td>
                <td>0명</td>
                <td>0명</td>
                <td>0명</td>
            </tr>
        </table>
        <table class="content_table">
            <tr>
                <th style="width:50px;"><input type="checkbox"></th>
                <th style="width:60px;">번호</th>
                <th>학생명</th>
                <th>입실시간</th>
                <th>퇴실시간</th>
                <th>출결상태</th>
                <th>관리</th>
                <th>특이사항</th>
            </tr>
            <c:forEach items="${List}" var="attend">
            <tr>  
                <td style="width:50px;"><input type="checkbox"  ></td>
                <td style="width:60px;">${attend.attendNo}</td>
                <td>${attend.name}</td>
                <td>${attend.checkIn}</td>
                <td>${attend.checkOut}</td>
                <td>${attend.codeName}</td>
                <td>
                    <select id="state">
                        <option >변경</option>
                        <option value="20">출석</option>
                        <option value="21">지각</option>
                        <option value="22">조퇴</option>
                        <option value="23">결석</option>
                    </select>
                </td>
                <td><input id="memo" type="text" placeholder="상태변경 이유를 적어주세요" value="${attend.specialNote}"></td>
            </tr>
            </c:forEach>
        </table><br>
        <div>
            <strong>*선택된 회원을 
                <select id="state">
                    <option >변경</option>
                    <option value="20">출석</option>
                    <option value="21">지각</option>
                    <option value="22">조퇴</option>
                    <option value="23">결석</option>
                </select>
            처리합니다.
            </strong>
        </div>
        <div class="save"><button id="saveBtn">저장</button></div>
<!-- chart가 생성될 공간 -->
        <div id="chart_div"></div>    
    </div>
</div>
<!-- 날짜 현재시간으로 설정해주기 -->
	<script>document.getElementById('date').value=new Date().toISOString().substring(0,10);</script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 	<script src="<c:url value="/resources/admin/js/attend/dayList.js"/>"></script>