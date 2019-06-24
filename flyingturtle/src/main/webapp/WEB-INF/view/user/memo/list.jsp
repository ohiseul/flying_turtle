<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$("head").append(
		`<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/memo/memo-test.css">`
	);
</script>

<div class="memo-wrapper">
	
	<div class="topBtn-wrap">
		<div class="plusminus">
			<span id="addButton"><i class="fas fa-plus-circle fa-2x"></i></span>
			<span id="minusButton"><i class="fas fa-minus-circle fa-2x"></i></span>
<!-- 			<span id="editButton"><i class="fas fa-edit fa-2x"></i></span> -->
			<span id="editButton">과목명 수정</span>
		</div>
		<div class="memoBtns">
			<label for="autoselect">자동</label>
			<input type="checkbox" id="autoselect">
			<button class="submitBtn" id="addMemo"> 메모 추가하기</button>
<!-- 			<button class="submitBtn">저장</button> -->
		</div>
	</div>
	
	<div class="content-wrap">
		<div class="subject-wrap scroll">
			<div class="subject-list">
				<div>
					<div id="nonSave" class="label-subject">임시메모</div>
					<div><!-- <input type="checkbox" name="subject" /> --></div>
				</div>
				<c:if test="${not empty sbjList}">
					<c:forEach var="sbj" items="${sbjList}">
					<div id="div${sbj.sbjNo}">
						<div id="${sbj.sbjNo}" class="label-subject">${sbj.subjectName}</div>
						<div>
							<input type="checkbox" name="subject" value="${sbj.sbjNo}" id="sub${sbj.sbjNo}" />
						</div>
					</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		
		<div id="stickyContainer">
			<div class="memoContainer scroll" id="memoContainer">
				<div class="stickyNote"></div>
			</div>
		</div>
	</div>
	
</div>


<script src="<c:url value="/resources/user/js/memo/memo-test.js"/>"></script>