<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="body-wrapper">

	<div class="Subtitle">
		<h4>날아갈 준비를 끝마친 <strong>${sessionScope.user.id}</strong>님, 어디로 가볼까요?</h4>
	</div>
	<div class="job_info-wrapper scroll">
		<div class="job_info-area">
			<c:forEach var="emp" items="${empList}" >
				<a href="${emp.url}">
					<div class="job_info">
						<div class="info">
							<span class=job_company>${emp.company}</span> <span
								class="job_title">${emp.title}</span>
						</div>
						<div class="job_endDate">
							<span> 
								~ <fmt:formatDate pattern="yyyy-MM-dd" value="${emp.endDate}" />
							</span>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>
		<!-- job_info-area -->
	</div>
	<!-- job_info-wrapper -->

</div>


<script>
	$("head").append(
		"<link rel='stylesheet' href='<c:url value="/resources/user/css/employment/list.css"/>'>"
	);

	
</script>