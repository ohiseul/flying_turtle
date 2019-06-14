<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$('head').append(
		'<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/dictionary/list.css">',
		'<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
		integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" 
		crossorigin="anonymous">'
);
</script>


<div class="box">
	<div class="buttonList1">
		<ul class="buttonList scroll">
			<li><img id="addButton"
				src="<c:url value="/resources/images/add.png"/>" /></li>
			<c:forEach var="sbj" items="${sbjList}">
				<li>
					<div class='sideMenu'>
						<input type='text' name='menu' class='menuInput' readonly
							value="${sbj.sbjName}" data-sbjNo="${sbj.sbjNo}" />
					</div> <span class='ddBtn'>+</span>
					<ul class='dropdown'>
						<c:forEach var="ssbj" items="${ssbjList}">
							<c:if test="${ssbj.sbjNo eq sbj.sbjNo}">
								<li>
									<div class='childMenu'>
										<input class='smallSubject' type='text' name='menu'
											value="${ssbj.ssbjName}" data-ssbjNo="${ssbj.ssbjNo}"
											data-sbjNo="${sbj.sbjNo}" readonly /> 
											<span class="go"
											style="z-index: 99;"> go </span> <span class='removeBtn'>-</span>
									</div>
								</li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</c:forEach>
		</ul>
		<div class="buttonList1 content">
			<div class="first-page">
				<p>함께 정리하는 용어사전 ...</p>
			</div>
			<main>
			<div id='dic-title'></div>
			<div id="editorjs"></div>
			<div class="btn-area">
				<button class="submitBtn">저장</button>
			</div>
			</main>
		</div>
	</div>

	<div id="position1">
		<a href="#header"><i class="fas fa-chevron-circle-up"></i></a>
		<!-- 누르면 top으로 돌아가게 -->
	</div>
	<div id="position2">
		<a href="#footer"><i class="fas fa-chevron-circle-down"></i></a>
		<!--누르면 맨아래로 돌아가게  -->
	</div>

</div>


<!-- EditorJS -->
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/header@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/link@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/list@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/embed@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/raw@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/simple-image@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/checklist@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/quote@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/image@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/marker@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/table@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/warning@latest"></script>
<script type="text/javascript" src="<c:url value="/resources/user/js/dictionary/list.js"/>"></script>