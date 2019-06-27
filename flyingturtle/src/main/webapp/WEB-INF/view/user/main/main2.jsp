<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<div id="note"></div>
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item active"
				style="background-image: url(/flyingturtle/resources/images/lecture.jpg)">
				<div class="carousel-caption d-none d-md-block">
					<h3>${sessionScope.user.id}님,</h3>
					<p class="welcome" style="font-size: 35px;">오늘 계획은 무엇인가요?</p>
				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url(/flyingturtle/resources/user/images/learn.jpg)">
				<div class="carousel-caption d-none d-md-block">
<!-- 					<h3 style="font-size: 75px;">Flying Turtle</h3> -->
<%-- 					<P CLASS="WELCOME" STYLE="FONT-SIZE: 35PX;">${sessionScope.user.id}님 환영합니다!</P> --%>
				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url(/flyingturtle/resources/images/lecture.jpg)">
				<div class="carousel-caption d-none d-md-block">
					<h3>${sessionScope.user.id}님,</h3>
					<p class="welcome" style="font-size: 35px;">오늘 계획은 무엇인가요?</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</header>

<!-- Page Content -->
<div class="container">

	<!-- Marketing Icons Section -->
	<div class="row">
		<div class="col-lg-4 mb-4">
			<div class="card h-100">
				<h4 class="card-header"
					style="background: #003876; color: white; width: 100%">출결</h4>
				<div class="card-body">
					<div class="attend-status"><h4>TODAY :<span id="att-status"></span></h4> </div>
					<div id="attendCnt-area">					
						
					</div>
				</div>
				<div class="card-footer" id="card-footer2" style="width: 100%;">
					<a href="<c:url value="/user/mypage/my-main.do"/>" class="btn btn-primary"
						style="background: white; border: 1px solid white; color: black;">+
						더보기 </a>
				</div>
			</div>
		</div>
		<div class="col-lg-4 mb-4">
			<div class="card h-100">
				<h4 class="card-header"
					style="background: #003876; color: white; width: 100%;">공지사항</h4>
				<div class="card-body">
					<p class="card-text">
					<ul>
						<c:forEach items="${noticeList}" var="notice">
							<li><a
								href="<c:url value="/user/notice/detail.do?boardNo=${notice.boardNo}&fileGroupNo=${notice.fileGroupNo}"/>">
									${notice.title} </a></li>
						</c:forEach>
					</ul>
					</p>
				</div>
				<div class="card-footer" id="card-footer2" style="width: 100%;">
					<a href="<c:url value="/user/notice/list.do"/>"
						class="btn btn-primary"
						style="background: white; border: 1px solid white; color: black;">
						+ 더보기 </a>
				</div>
			</div>
		</div>
		<div class="col-lg-4 mb-4">
			<div class="card h-100">
				<h4 class="card-header"
					style="background: #003876; color: white; width: 100%;">묻고답하기</h4>
				<div class="card-body">
					<p class="card-text">
					<ul>
						<c:forEach items="${qnaList}" var="qna">
							<li><a href="<c:url value="/user/qna/detail.do?boardNo=${qna.qnaNo}&fileGroupNo=${qna.fileGroupNo}"/>">
									${qna.title} </a></li>
						</c:forEach>
					</ul>
					</p>
				</div>
				<div class="card-footer" id="card-footer2" style="width: 100%;">
					<a href="<c:url value="/user/qna/list.do"/>"
						class="btn btn-primary"
						style="background: white; border: 1px solid white; color: black;">
						+ 더보기 </a>
				</div>
			</div>
		</div>
	</div>
	<!-- /.row -->


	<div class="gide">
		<div class="gideLine">
			<hr class="pinkgide">
		</div>
		<span id="gideword">Trending</span>
		<div class="gideLine">
			<hr class="pinkgide">
		</div>
	</div>
	<div class="schedule" style="display: inline-block; height: 550px;">
			<h4>월별 출결현황</h4>
		<div style="display: inline-block; margin: 0 20px;">
 		 	<div id="chart_div"></div>   
		</div>
<!-- 		<div class="LineScheduleBox" -->
<!-- 			style="display: inline-block; width: 500px; height: 500px;"> -->

<!-- 			<div class="schedule-title" style="display: inline-block;"> -->
<!-- 				<h4>강의일정</h4> -->
<!-- 			</div> -->
<!-- 			<br> -->
<!-- 			<div class="schedule-inner"> -->
<!-- 				<ul> -->
<!-- 					<br> -->

<!-- 					<li style="display: block; margin-top: 0" class="first"><span -->
<!-- 						class="date">05.31</span>수업일수 4/4선</li> -->
<!-- 					<li style="display: block"><span class="date">05.24</span>프로젝트 -->
<!-- 						발표</li> -->
<!-- 					<li style="display: block"><span class="date">05.21</span>수업일수 -->
<!-- 						3/4선</li> -->
<!-- 					<li style="display: block"><span class="date">05.13</span>수업일수 -->
<!-- 						2/3선</li> -->
<!-- 					<li style="display: block"><span class="date">05.12</span>석가탄신일</li> -->
<!-- 					<li style="display: block"><span class="date">05.06</span>대체공휴일(어린이날) -->
<!-- 						[수업휴강일]</li> -->
<!-- 					<li style="display: none"><span class="date">05.05</span>어린이날</li> -->
<!-- 					<li style="display: none"><span class="date">05.02</span>학기경과일수 -->
<!-- 						60일째</li> -->
<!-- 					<li style="display: none"><span class="date">05.01</span>근로자의 -->
<!-- 						날[수업휴강일]</li> -->
<!-- 					</span> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 				<input type="hidden" name="ctl00$hdnStartIndex" id="hdnStartIndex" -->
<!-- 					value="0"> -->
<!-- 			</div> -->

<!-- 		</div> -->
	</div>
	<div class="gide">
		<div class="gideLine">
			<hr class="pinkgide">
		</div>
		<span id="gideword">Trending</span>
		<div class="gideLine">
			<hr class="pinkgide">
		</div>
	</div>

	<!-- Features Section -->
	<div class="row">
		<div class="job_info-wrapper">

			<div class="job-viewMore">
				<button class="submitBtn"
					onClick="location.href='<c:url value="/user/employment/list.do"/>'">
				더보기</button>
				<%-- <a href="<c:url value="/user/employment/list.do"/>"
					class="submitBtn">더보기</a> --%>
			</div>

			<div class="job_info-area">
				<c:forEach var="emp" items="${empList}" begin="0" end="9">
					<a data-href="${emp.url}">
						<div class="job_info">
							<div class="info">
								<span class=job_company>${emp.company}</span> <span
									class="job_title">${emp.title}</span>
							</div>
							<div class="job_endDate">
								<span> ~<fmt:formatDate pattern="yyyy-MM-dd"
										value="${emp.endDate}" />
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

	<div class="gide">
		<div class="gideLine">
			<hr class="pinkgide">
		</div>
		<span id="gideword">Trending</span>
		<div class="gideLine">
			<hr class="pinkgide">
		</div>
	</div>

	<!-- Call to Action Section -->
	<div class="row mb-4">
		<div class="col-md-8">
			<p>
				비트캠프의 최고의 강사 손병찬 강사님과 함께라면 우린 최고의 개발자가 될 수 있다.<br> No gain No
				pain..★
			</p>
		</div>
		<div class="col-md-4">
			<a class="btn btn-lg btn-secondary btn-block" href="#">▲</a>
		</div>
	</div>

</div>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
<script>

 	//파이chart
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
	 var count = new google.visualization.DataTable();
	  count.addColumn('string', 'Topping');
	  count.addColumn('number', 'Slices');
	  count.addRows([
		 ['출석횟수',${pieChart.checkInCount}], 
		 ['결석횟수',${pieChart.absentCount}],
		 ['지각횟수',${pieChart.lateCount}],
		 ['조퇴횟수',${pieChart.earlyCount}]
	 ]);
	 
	
	 var options = {
	   colors:['F291A6','82CDFF','90E6E6','FFC891'],	 
// 	   title: '월별 ',
	   pieSliceText: 'value',
	   chartArea: {'width': '100%', 'height': '90%'},
	   width:700,
	   height:450
	 };
	
	 var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
	
	 chart.draw(count, options);
	}
</script>
