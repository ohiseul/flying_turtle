<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/todo.css"/>">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  </head>
<body>
<div id="header"> </div>
  <div class="todobody">
  <div class="todotodo">
    <div class="container animated fadeIn">
  
            <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                            <p class="lead">프로젝트 To Do를 작성하세요!</p>
                            <h3 class="display-4"> <div class="trtitle"><input type="text" class="inputtitle" placeholder="프로젝트 제목을 입력하세요!" /></div></h3>
                          </div>
                        </div>
                        <div class="input-group mb-3">
                          <input type="text" class="form-control" placeholder="나의 오늘 계획은?">
                       <input type="text" name="toDate" id="toDate" value="">
                          <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="button" id="button-addon2">등록</button>
                          </div>
                        </div>
                        <ul class="list-group">
                        
                         <c:forEach var="list" items="${lists}">
                          <li id="todolist" class="list-group-item d-flex justify-content-between align-items-center">
                            <span class="inputtodo">${list.content}</span>
                            <span class="dead-line">${list.deadline}</span>    
                            <span class="checktodo"> 
                                <input type="checkbox" id="check1" name="check" /> 
                                Check  <label for="check1"></label>
                            </span>
                            <span class="badge badge-primary badge-pill">삭제</span>
                          </li>
                          </c:forEach>
                          
                        </ul> 
                      </div>
                     </div>
            


					  <div class="todotodolist">
					      <table>
					        <tr class="yeoback2"> </tr>
					        <tr>
					          <th>MY PROJECT LIST</th>
					        </tr>
					        <tr class="yeoback">  </tr>
					        
					          <c:forEach var="list" items="${lists}">
					          <tr> <td class="td"> ${list.title} </td> </tr>
					     	  </c:forEach>
					      </table>

  </div>

  </div>
  	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
     <!-- 달력 -->
     <script src="//code.jquery.com/jquery-1.12.4.js"></script>
     <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script src="<c:url value="/resources/js/todo.js"/>"> </script>
</body>
</html>