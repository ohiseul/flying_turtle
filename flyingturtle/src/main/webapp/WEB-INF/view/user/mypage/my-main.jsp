<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 사이드 메뉴 바 =================================================================== -->
<div class="body-wrapper">
    <!-- 사이드 메뉴 -->
    <div class="sideMenuList">
        <ul>
            <li class="sideMenu">
               	MYPAGE
            </li>
            <li class="sideMenu">
               	게시글
            </li>
            <li class="sideMenu">
               	댓글 
            </li>
            <li class="sideMenu">
               	??
            </li>
        </ul>
    </div>
    <!-- 내용 -->
    <div class="content">
		<div class="profile">
			<div class="profile-img">
				<img src="<c:url value="/resources/images/overview-img.jpg"/>"	/>
			</div>
			<div class="profile-info">
				<div class="name">구본현</div>
			</div>	
		</div>
    
    </div>
</div>


<script src="<c:url value="/resources/user/js/mypage/my-main.js" />"></script>
