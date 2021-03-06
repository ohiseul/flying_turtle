<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<div class="todo">
			  	<div class="todotodo">
			    	<div class="container animated fadeIn">
			            <div class="jumbotron jumbotron-fluid" style="border-radius: 15px;">
		                    <div class="container">
									<p class="lead"> 프로젝트를 선택 후 To Do를 작성하세요!</p>
		                            <h3 class="display-4"> 
		                            	<div class="trtitle">
											<p class="clickProject"></p>
		                            	</div>
		                            </h3>
		                    </div>
			            </div>
			           <form name="TodoInsertForm">
				           <div class="input-group mb-3">
					            <input type="text" class="form-control" name="content" placeholder="나의 오늘 계획은?">
					          	<input type="text" name="endDay" id="toDate">
					            <div class="input-group-append">
					           	 	<button class="btn btn-outline-secondary" type="button" 
					           	 	        id="button-addon2" name="todosubmit">  등록
					           	 	</button>
					          	</div>
				           </div>
			            </form>        
			            <ul class="list-group"></ul>
			 	 	</div> <!-- container 닫기 -->
				</div> <!-- todotodo 닫기 -->
			        
			  <div class="todotodolist">
			     <table>
			        <tr class="yeoback2"></tr>
			        <tr>
			        	<th class="thclass">
			        		<p>MY PROJECT LIST</p>
			        		<c:choose>
			                   <c:when test="${empty lists}"> 
		                            <p class="lead"> ${sessionScope.user.id}님 <br> 프로젝트명 입력 후 엔터!</p>
		                            <input type="text" class="inputtitle" placeholder="프로젝트명 입력 (Enter)"/>
			                   </c:when>
			                   <c:otherwise>
		                            <input type="text" class="inputtitle" placeholder="프로젝트명 입력 (Enter)"/>
			                   </c:otherwise>
		                    </c:choose>
			        	</th>
			        </tr>
			        <tr class="yeoback"></tr>
			        <tr class="projectplus"></tr>
			        <c:forEach var="list" items="${lists}">
			        	<tr class="pno${list.pjNo}"> 
			        		<td class="td" id="${list.pjNo}">${list.title}</td> 
			        		<td>
			        		    <button name="btn2" class="btn2" id="delete${list.pjNo}">
			        		      <i class="fa fa-trash"></i>
			        		    </button>
			        		</td>
			        	</tr>
			   		</c:forEach>
			    </table>
			  </div> <!-- todotodolist리스트 닫기 -->
	</div> <!-- todo(전체 body) 닫기 -->

<!-- todo js -->
<script src="<c:url value="/resources/user/js/todo/todo.js"/>"></script>
<!-- 달력 js -->
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	