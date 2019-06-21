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
			<span id="editButton"><i class="fas fa-edit fa-2x"></i></span>
		</div>
		<div class="memoBtns">
			<button class="submitBtn" id="addMemo"> 메모 추가하기</button>
<!-- 			<button class="submitBtn">저장</button> -->
		</div>
	</div>
	
	<div class="content-wrap">
		<div class="subject-wrap scroll">
			<div class="subject-list">
				<c:choose>
					<c:when test="${empty sbjList}">
						<div class="emptySbj">생성한 과목이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<div>
							<div id="nonSave" class="label-subject">임시메모</div>
							<div><!-- <input type="checkbox" name="subject" /> --></div>
						</div>
						
						<c:forEach var="sbj" items="${sbjList}">
							<div id="div${sbj.sbjNo}">
								<div id="${sbj.sbjNo}" class="label-subject">${sbj.subjectName}</div>
								<div>
									<input type="checkbox" name="subject" value="${sbj.sbjNo}" id="sub${sbj.sbjNo}" />
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<div id="stickyContainer">
			<div class="memoContainer scroll" id="memoContainer">
				<div class="stickyNote">
					<div class="stickyEdit">
						<div class="title"><h3>Title</h3></div>
						<div class="memo-content"></div>				
					</div>
					<div class="stickyBar">
						<span class="memobar date">2019.02.02에 마지막으로 수정됨</span>
						<span class="memobar editableMemo">이동</span>
						<span class="memobar editableMemo">삭제</span>
						<span class="memobar editableMemo">수정</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>


<script src="<c:url value="/resources/user/js/memo/memo-test.js"/>"></script>