<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>flyingturtle_admin</title>

<link rel="shortcut icon" href="<c:url value="/favicon.ico"/>">

<link rel="stylesheet" type="text/css" href="<c:url value="/resources/admin/css/reset.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/admin/css/style.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/admin/css/common.css"/>">
<script>
let linkCss;
if (location.pathname.indexOf("canvas/list.do") != -1) {	
	linkCss = '<link rel="stylesheet" type="text/css" href="<c:url value="/resources/admin/css/canvas/list.css"/>">';
	document.querySelector("head").innerHTML += linkCss;
}	
</script>
<!-- 기존 JS -->
<script src="<c:url value="/resources/common/js/jquery-3.3.1.js"/>"></script>
<script src="<c:url value="/resources/common/js/waitMe.js"/>"></script>
<script src="//cdn.ckeditor.com/4.11.4/standard/ckeditor.js"></script> 

<!-- 관리자 메뉴 관련 JS -->
<script src="<c:url value="/resources/admin/js/main/admin/assignment/assignment.js"/>"></script>
<script src="<c:url value="/resources/admin/js/main/admin/common.js"/>"></script>
<script src="<c:url value="/resources/admin/js/main/jquery.leanModal.min.js"/>"></script>
<script src="<c:url value="/resources/admin/js/main/jquery-1.11.3.js"/>"></script>
<script src="<c:url value="/resources/admin/js/main/jquery-ui.js"/>"></script>
