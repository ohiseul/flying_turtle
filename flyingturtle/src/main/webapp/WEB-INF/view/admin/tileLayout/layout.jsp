<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
      <tiles:insertAttribute name="adm_meta"/>
</head>
<body>
	<div id="top_header">
		<tiles:insertAttribute name="adm_menu"/>
	</div>
   	
    <div id="body">
        <tiles:insertAttribute name="adm_tiles_content"/>
    </div>
    
    <div id="footer">
    	<tiles:insertAttribute name="adm_footer"/>
   	</div>
</body>
</html>