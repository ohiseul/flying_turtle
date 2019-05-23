<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
      <tiles:insertAttribute name="tiles_header"/>
</head>
<body>
    <div id="wrap">
        <div id="top_header">
            <tiles:insertAttribute name="tiles_menu"/>
        </div>
        <div id="body-content">
	        <tiles:insertAttribute name="tiles_content"/>
        </div>
    </div>
</body>
</html>