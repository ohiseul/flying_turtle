<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	$("head").append(
		`<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/memo/memo.css">`
	);
	
</script>

<div class="memo-wrapper">

	<div class="subject-wrap scroll">
		<div class="subject-list">
			<c:choose>
				<c:when test="${empty sbjList}">
					<div>아직 생성한 과목이 없네요</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="sbj" items="${sbjList}">
						<input type="radio" name="subject" value="${sbj.sbjNo}"
							id="sub${sbj.sbjNo}" />
						<label for="sub${sbj.sbjNo}" class="subject">${sbj.subjectName}</label>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<!-- 메뉴 선택 :: .nonSave / .save -->
	<div class="choiceMenu">
		<div class="nonSave checked-menu">
			<input type="hidden" name="nonSave" id="nonSave" value="N">
			임시메모
		</div>
		<div class="save">
			<input type="hidden" name="save" id="save" value="Y">
			저장메모
		</div>
		<div class="memoBtns">
			<button class="submitBtn">추가</button>
			<button class="submitBtn">저장</button>
		</div>
	</div>
	
	<div id="stickyContainer">
		<div class="page-wrap" id="memoContainer" ></div>
	</div>
	
</div>


<script src="<c:url value="/resources/user/js/memo/memo.js"/>"></script>