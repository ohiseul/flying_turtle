<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

$(document).ready(function () {
	lock = new PatternLock('#patternContainer');
	$("#confirm").click(function () {
		var patVal = lock.getPattern()
		alert(patVal);
	});
	$("#reset").click(function () {
		lock.reset();
	});
	$("#lock").click(function () {
		lock.disable();
	});
	$("#unlock").click(function () {
		lock.enable();
	});
	
	$('#patternContainer').mouseup(function () {
		var patVal = lock.getPattern()
		// alert(patVal);
	});
});
</script>


	<!-- <input type="text" id="id" placeholder="아이디" /> -->
	<div id="patternContainer"></div>
	<div class="simple-log-btn">
		<input type="button" id="confirm" value="로그인" />
		<input type="button" id="reset" value="초기화" />
	</div>
	<!-- <input type="button" id="lock" value="패턴잠금" /> -->
	<!-- <input type="button" id="unlock" value="패턴해제" /> -->
	<br />
	
	
	
<script>
window.onload = function() {
	  $('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/login/patternLock.css"/>');
	  
};
</script>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value="/resources/user/js/login/patternLock.js"/>"></script>
<script src="<c:url value="/resources/user/js/login/patternLock.min.js"/>"></script>