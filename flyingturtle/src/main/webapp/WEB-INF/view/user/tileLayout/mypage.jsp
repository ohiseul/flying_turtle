<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
  <!------ Include the above in your HEAD tag ---------->
<head>

  <tiles:insertAttribute name="header"/>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/user/css/mypage/my-main.css"/>">
 <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>   -->   
</head>

<body class="body">
    <div id="wrap">
        <div id="top_header">
            <tiles:insertAttribute name="menu"/>
        </div>
        <div id="body-content">
	        <tiles:insertAttribute name="tiles_content"/>
	        <tiles:insertAttribute name="adm_tiles_idontknow_content"/>
        </div>
        <div id="footer">
	        <tiles:insertAttribute name="footer"/>
        </div>
    </div>
</body>
</html>