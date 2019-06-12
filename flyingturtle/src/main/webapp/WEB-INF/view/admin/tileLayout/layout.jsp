<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
      <tiles:insertAttribute name="adm_meta"/>
</head>

<body  class="page-main btn-page">
	<div class="wrap">
		<div class="wrap-inner">
			<tiles:insertAttribute name="adm_side_menu"/>	<!-- 사이드헤더 -->
			
			<div class="container">
				<div class="container-inner" id="body">
					<div class="content">
					<tiles:insertAttribute name="adm_menu"/>	<!-- 헤더 -->
					</div>
					<div class="content-area">
					<section class="test-class common">
					<tiles:insertAttribute name="adm_tiles_content"/>
					<tiles:insertAttribute name="adm_tiles_idontknow_content"/>
					</section>
					</div>
				</div>
				<div id="footer">
					<tiles:insertAttribute name="adm_footer"/>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

