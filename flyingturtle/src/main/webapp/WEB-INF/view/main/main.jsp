<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">  

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300|Oswald" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-3.3.1.js"/>"></script>
    <script src="<c:url value="/resources/js/plugin/notify.js"/>"></script>
    
    <!-- <script src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
    <!-- <script src="https://use.fontawesome.com/478e097f2b.js"></script> -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->

    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <%-- <link rel="stylesheet" href="<c:url value="/resources/css/todo.css"/>"> --%>
</head>
<body>
  <div id="header"></div>
  
  <div id="body">
      <div class="item">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
      
      </div>
      <div class="item2">
        <div></div>
        <div id="todo">
            <h1>To-Do List</h1>
            <div class="container">
              <div class="row">
                <input type="text" class="col-xs-8 col-sm-9">
                <div id="button1" class="input-buttons col-xs-4 col-sm-3">
                  <a href="#" class="clear-text"><i class="fa fa-trash-o fa-2x"></i></a>
                  <a href="#" class="add-todo"><i class="fa fa-plus fa-2x"></i></a>
                </div> <!-- div.input-buttons-->
              </div> <!-- div.row -->
              <div class="todorow">
                <div class="error">
                  <a href="#"><i class="fa fa-times"></i></a>
                  <p>We both know you should be doing something right now. Please enter a task.</p>
                </div> <!-- div.error -->
                <!-- Start to-do list -->
                <ul class="todo-list col-xs-12">
                </ul>
              </div> <!-- div.row -->
            </div> <!-- div.container -->
        </div>
      </div>

  </div>
  <div id="footer"></div>
 
 
<script type="text/javascript">   
/* 
	<!-- include -->
	$("#header").load("header.html");  // 원하는 파일 경로를 삽입하면 된다 */

$(document).ready(function() {
	// 로그인 알림
	$.notify("${sessionScope.user.id}님 안녕하세요", "success");
}); 


</script>
    
</body>
</html>