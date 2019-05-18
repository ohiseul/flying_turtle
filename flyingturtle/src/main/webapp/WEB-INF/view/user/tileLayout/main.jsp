<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
     <tiles:insertAttribute name="main_header"/>
</head>
<body>
	<div id="top_header">
		<tiles:insertAttribute name="tiles_menu"/>
	</div>
	<div>
		<tiles:insertAttribute name="tiles_content"/>	
	</div>
	<div>
		<tiles:insertAttribute name="main_script"/>	
	</div>
</body>
</html>