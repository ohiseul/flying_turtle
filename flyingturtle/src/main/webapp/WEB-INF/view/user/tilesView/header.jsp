<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>flyingturtle</title>

<link rel="shortcut icon" href="<c:url value="/favicon.ico"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/common/css/menu.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/common/css/waitMe.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/common/css/style.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/user/css/page.css"/>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script>
let linkCss;
if (location.pathname.indexOf("video/list.do") != -1) {	
	linkCss = '<link rel="stylesheet" type="text/css" href="<c:url value="/resources/user/css/video/list.css"/>">'+
			  '<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/subject.css">';
	document.querySelector("head").innerHTML += linkCss;
}	
else if (location.pathname.indexOf("video/detail.do") != -1) {	
	linkCss = '<link rel="stylesheet" type="text/css" href="<c:url value="/resources/user/css/video/detail.css"/>">'+
	 '<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/subject.css">';
	document.querySelector("head").innerHTML += linkCss;
} 
else if (location.pathname.indexOf("video/write.do") != -1) {	
	linkCss = '<link rel="stylesheet" type="text/css" href="<c:url value="/resources/user/css/video/write.css"/>">';
	document.querySelector("head").innerHTML += linkCss;
} 
else if (location.pathname.indexOf("todo/list.do") != -1) {	
	linkCss = '<link rel="stylesheet" type="text/css"  href="/flyingturtle/resources/user/css/todo/todo.css">' +
			  '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">' +
			  '<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">';
	document.querySelector("head").innerHTML += linkCss;
} 
else if (location.pathname.indexOf("mypage/my-main.do") != -1) {	
	linkCss = '<link rel="stylesheet" type="text/css"  href="/flyingturtle/resources/user/css/mypage/my-main.css">'+
	'<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/login/patternLock.css"/>'+
	'<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/mypage/list.css"/>';
	document.querySelector("head").innerHTML += linkCss;
} 
else if (location.pathname.indexOf("employment/list.do") != -1) {	
	linkCss = '<link rel="stylesheet" type="text/css"  href="/flyingturtle/resources/user/css/employment/list.css">'
	document.querySelector("head").innerHTML += linkCss;
} 
else if (location.pathname.indexOf("canvas/list.do") != -1) {	
	linkCss = '<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/canvas/list.css">'
	document.querySelector("head").innerHTML += linkCss;
} 
</script>

<script src="<c:url value="/resources/common/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/common/js/waitMe.js"/>"></script>
<script src="<c:url value="/resources/common/js/notify.js"/>"></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2"></script>