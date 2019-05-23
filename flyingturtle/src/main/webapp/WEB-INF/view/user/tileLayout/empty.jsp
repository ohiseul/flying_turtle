<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
     <tiles:insertAttribute name="tiles_header"/>
</head>
<body>
	<tiles:insertAttribute name="tiles_content"/>
	<div id="footer">
		<tiles:insertAttribute name="tiles_footer"/>
	</div>
</body>
</html>