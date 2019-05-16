<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="header"> </div>
  <div class="todobody">
  	<div class="todotodo">
    	<div class="container animated fadeIn">
    	
			            <div class="jumbotron jumbotron-fluid">
			                    <div class="container">
			                            <p class="lead">프로젝트 To Do를 작성하세요!</p>
			                            <h3 class="display-4"> 
			                            	<div class="trtitle">
			      								<input type="text" class="inputtitle" placeholder="프로젝트 제목을 입력하세요!" />
			                            	</div>
			                            </h3>
			                    </div>
			            </div>
			            
			            
			           <form name="TodoInsertForm">
				           <div class="input-group mb-3">
					            <input type="text" class="form-control" name="content" placeholder="나의 오늘 계획은?">
					          	<input type="text" name="endDay" id="toDate">
					            <div class="input-group-append">
					           	 	<button class="btn btn-outline-secondary" type="button" id="button-addon2" name="todosubmit">등록</button>
					          	</div>
				           </div>
			            </form>
                        
                        <ul class="list-group">
<!-- 	                        	<li id="todolist" class="list-group-item d-flex justify-content-between align-items-center"> -->
<!-- 		                            <span class="inputtodo">등록 구현 완료</span> -->
<!-- 		                            <span class="dead-line">D-14</span>     -->
<!-- 		                            <span class="checktodo">  -->
<!-- 		                                <input type="checkbox" id="check1" name="check" />  -->
<!-- 		                               		 Check  <label for="check1"></label> -->
<!-- 		                            </span> -->
<!-- 		                            <span class="badge badge-primary badge-pill">삭제</span> -->
<!-- 	                          	</li> -->
                      	</ul>
 	 	</div>
 	 <!-- todo 닫기 -->
	</div>
        
					<!-- 프로젝트 영역 닫기 -->
					  <div class="todotodolist">
					     <table>
					        <tr class="yeoback2">        </tr>
					        <tr><th>MY PROJECT LIST</th> </tr>
					        <tr class="yeoback">  </tr>
					        <tr class="projectplus">  </tr>
					        <c:forEach var="list" items="${lists}">
					        	<tr class="${list.pjNo}"> <td class="td" id="${list.pjNo}"> ${list.title} </td> 
					        		  <td><button name="btn2" class="btn2" id="delete${list.pjNo}"><i class="fa fa-trash"></i></button></td>
					        	</tr>
					   		</c:forEach>
					    </table>
 					 </div>

<!-- 전체 body 닫기 -->
  </div> 
  
  
  	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
     <script src="<c:url value="/resources/user/js/todo/todo.js"/>"></script>
     <script src="//code.jquery.com/jquery-1.12.4.js"></script>
     <!-- 달력 -->
     <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
