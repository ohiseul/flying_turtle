<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
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
					<h3 style="font-size: 75px;">Flying Turtle</h3>
					<p class="welcome" style="font-size: 35px;">${sessionScope.user.id}님
						환영합니다!</p>
				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url(/flyingturtle/resources/user/images/learn.jpg)">
				<div class="carousel-caption d-none d-md-block">
					<h3 style="font-size: 75px;">Flying Turtle</h3>
					<p class="welcome" style="font-size: 35px;">${sessionScope.user.id}님
						환영합니다!</p>
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
				<div class="card-body"
					style="border: 1px solid #003876; width: 100%;">
					<div class="attend-status"><h4>TODAY : 출석</h4></div>
					<div class="attend-area">
						<div class="attendCnt">전체</div>
						<div class="attendCnt">0일</div>
					</div>
					<div class="attend-area">
						<div class="attendCnt">출석</div>
						<div class="attendCnt">0일</div>
					</div>
					<div class="attend-area">
						<div class="attendCnt">지각</div>
						<div class="attendCnt">0일</div>
					</div>
					<div class="attend-area">
						<div class="attendCnt">조퇴</div>
						<div class="attendCnt">0일</div>
					</div>
					<div class="attend-area">
						<div class="attendCnt">결석</div>
						<div class="attendCnt">0일</div>
					</div>
				
					<!-- <ul>
						<li style="list-style: none;">TODAY : 출석완료</li>
						<br>
						<li>출석률 : 80% (98/125일)</li>
						<li>지각 : 3회</li>
						<li>결석 : 1회</li>
					</ul> -->
					
				</div>
				<div class="card-footer" id="card-footer2" style="width: 100%;">
					<a href="#" class="btn btn-primary"
						style="background: white; border: 1px solid white; color: black;">+
						더보기 </a>
				</div>
			</div>
		</div>
		<div class="col-lg-4 mb-4">
			<div class="card h-100">
				<h4 class="card-header"
					style="background: #003876; color: white; width: 100%;">공지사항</h4>
				<div class="card-body"
					style="border: 1px solid #003876; width: 100%;">
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
					style="background: #003876; color: white; width: 100%;">과제</h4>
				<div class="card-body"
					style="border: 1px solid #003876; width: 100%;">
					<p class="card-text">
					<ul>
						<li>구현 예정</li>
						<li>구현 예정</li>
						<li>구현 예정</li>
						<li>구현 예정</li>
						<li>구현 예정</li>
					</ul>
					</p>
				</div>
				<div class="card-footer" id="card-footer2" style="width: 100%;">
					<a href="#" class="btn btn-primary"
						style="background: white; border: 1px solid white; color: black;">+
						더보기</a>
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
		<div style="display: inline-block; margin: 0 20px;">
			<img src="<c:url value="/resources/user/images/maincalendar.png"/>"
				style="width: 500px; height: 500px; position: relative; top: -60px">
		</div>
		<div class="LineScheduleBox"
			style="display: inline-block; width: 500px; height: 500px;">

			<div class="schedule-title" style="display: inline-block;">
				<h4>강의일정</h4>
			</div>
			<br>
			<div class="schedule-inner">
				<ul>
					<br>

					<li style="display: block; margin-top: 0" class="first"><span
						class="date">05.31</span>수업일수 4/4선</li>
					<li style="display: block"><span class="date">05.24</span>프로젝트
						발표</li>
					<li style="display: block"><span class="date">05.21</span>수업일수
						3/4선</li>
					<li style="display: block"><span class="date">05.13</span>수업일수
						2/3선</li>
					<li style="display: block"><span class="date">05.12</span>석가탄신일</li>
					<li style="display: block"><span class="date">05.06</span>대체공휴일(어린이날)
						[수업휴강일]</li>
					<li style="display: none"><span class="date">05.05</span>어린이날</li>
					<li style="display: none"><span class="date">05.02</span>학기경과일수
						60일째</li>
					<li style="display: none"><span class="date">05.01</span>근로자의
						날[수업휴강일]</li>
					</span>
					</li>
				</ul>
				<input type="hidden" name="ctl00$hdnStartIndex" id="hdnStartIndex"
					value="0">
			</div>

		</div>
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

	<br> <br>
	<div class="col">
		<div class="quick-banner">
			<ul>
				<li class="list01"><a href="http://lib.deu.ac.kr/"
					target="_self"> <span class="icon"
						style="background-image: url(/flyingturtle/resources/user/images/attendance.png)">
					</span>출결<br>관리
				</a></li>
				<li class="list01"><a
					href="https://d4u.deu.ac.kr/urp4wn/web/com/login.aspx"
					target="_self"> <span class="icon"
						style="background-image: url(/flyingturtle/resources/user/images/attendance.png)"></span>
						오늘의<br>과제
				</a></li>
				<li class="list01"><a href="https://dap.deu.ac.kr"
					target="_self"><span class="icon"
						style="background-image: url(/flyingturtle/resources/user/images/attendance.png)">
					</span>공지<br>사항</a></li>
				<li class="list01"><a href="#none" target="_self"><span
						class="icon"
						style="background-image: url(/flyingturtle/resources/user/images/attendance.png)">
					</span>용어<br>사전</a></li>
				<li class="list01"><a
					href="http://dess.deu.ac.kr/index.php?mid=Page7" target="_self"><span
						class="icon"
						style="background-image: url(/flyingturtle/resources/user/images/attendance.png)">
					</span>누구나<br>묻고<br>답하기</a></li>
				<li class="list01"><a href="/www/content/56" target="_self">
						<span class="icon"
						style="background-image: url(/flyingturtle/resources/user/images/attendance.png)"></span>강사님<br>몰라요<br>
				</a></li>
				<li class="list01"><a href="/www/boardview/3/462"
					target="_self"> <span class="icon"
						style="background-image: url(/flyingturtle/resources/user/images/attendance.png)"></span>투두<br>리스트
				</a></li>
			</ul>
		</div>
	</div>
	<br>
	<br>

	<div class="gide">
		<div class="gideLine">
			<hr class="pinkgide">
		</div>
		<span id="gideword">취업정보</span>
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
<!-- /.container -->
