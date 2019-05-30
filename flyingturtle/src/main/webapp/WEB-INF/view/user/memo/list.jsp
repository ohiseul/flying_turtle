<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<div id="stickyContainer">
		<div class="colorDiv">
			<input type="color" name="color" id="color" value="#ffff9d" />
		</div>	
		<button onclick="createSticky();">메모 추가</button>
	</div>    
	

<script src="<c:url value="/resources/user/js/memo/memo.js"/>"></script>