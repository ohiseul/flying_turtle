<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- =========================
    INTRO SECTION   
============================== -->
<section id="intro" class="parallax-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<h3 class="wow bounceIn" data-wow-delay="0.8s">flying turtle</h3>
				<h1 class="wow fadeInUp" data-wow-delay="0.9s">Web Design Conference</h1>
				<a id="signupBtn" class="btn btn-lg btn-default smoothScroll wow fadeInUp hidden-xs" data-wow-delay="1.1s">회원가입</a>
				<a id="loginBtn" class="btn btn-lg btn-danger smoothScroll wow fadeInUp" data-wow-delay="1.1s">로그인</a>
			</div>
		</div>
	</div>

<!-- =========================
    Register SECTION   
============================== -->
	<div id="login"></div>
	
	<div id="sign-up" style="display: none;">
	<div class="cont">
			<div class="form sign-up">
			<h4 style="height:50px; line-height: 50px;">당신의 위대한 첫걸음,</h4>
		<form id="form"  method="post" action="<c:url value="/user/signup/signup.do"/>">
				<table style="margin : 0 auto; height: 20px; font-size : 10px; margin-bottom:5px;">
					<tr>
						<td>
							<input type="radio" name="memberCode" value="50" id="student" checked="checked"/>
							<label for="student">학생</label>
						</td>
						<td>
							<input type="radio" name="memberCode" value="51" id="manager"/>
							<label for="manager">강사/매니저</label>
						</td>
					</tr>
				</table>
				
				<div class="form-wrapper">
				<table class='form-table'>
					<tr>
						<th>아이디*</th>
						<td>
							<input type="text" name="id" id="id" required="required" minlength="4"/>
							<span class="val-msg">아이디를 입력해주세요(4글자 이상)</span>
							<span class="val-msg">중복된 아이디입니다.</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호*</th>
						<td>
							<input type="password" name="pass" id="pass" required="required" />
							<span class="val-msg">비밀번호를 입력해주세요(8자 이상)</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인*</th>
						<td>
							<input type="password" name="pass1" id="pass1" required="required" />
							<span class="val-msg">비밀번호가 일치하지 않습니다.</span>
						   </td>
					</tr>
					<tr>
						<th>이메일*</th>
						<td>
							<input type="email" name="email" id="email" required="required" />
							<span class="val-msg">이메일을 입력해주세요.</span>
							<span class="val-msg">중복된 이메일 입니다.</span>
						</td>
					</tr>
					<tr>
						<th>이름*</th>
						<td>
							<input type="text" name="name" id="name" required="required" />
							<span class="val-msg">이름을 입력해주세요.</span>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="date" name="birthDate" /></td>
					</tr>
					<tr>
						<th>전공</th>
						<td><input type="text" name="major" /></td>
					</tr>
					<tr>
						<th>간편 비밀번호</th>
						<td><input type="password" name="patternPass" /></td>
					</tr>
					<tr>
						<th>목표 한마디</th>
						<td><input type="text" name="goal" /></td>
					</tr>
				</table>
				<button class="submit">Sign Up</button>
				<button class="quit">돌아가기</button>
			</div>
		</form>
			</div>
		</div>
	</div>

</section>


<!-- =========================
    OVERVIEW SECTION   
============================== -->
<section id="overview" class="parallax-section">
	<div class="container">
		<div class="row">

			<div class="wow fadeInUp col-md-6 col-sm-6" data-wow-delay="0.6s">
				<h2>flying turtle, 당신과 함께합니다.</h2>
				<p>This is a Bootstrap v3.3.6 layout that is responsive and mobile friendly. You may download and modify this template for your website. Please tell your friends about templatemo.</p>
				<p>Quisque facilisis scelerisque venenatis. Nam vulputate ultricies luctus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet.</p>
			</div>
					
			<div class="wow fadeInUp col-md-6 col-sm-6" data-wow-delay="0.9s">
				<img src="<c:url value='/resources/images/overview-img.jpg'/>" class="img-responsive" alt="Overview">
			</div>

		</div>
	</div>
</section>


<script>

	/* Modal div show or hide
	-------------------------------*/
	function Modal(ele, event) {
		$(ele).css("-webkit-animation", event + " 0.4s linear");
	};

	$("#loginBtn").click(function () {
		$(".row").hide();
		$("#login").load("<c:url value='/user/login/loginform2.do'/>");
		/* $("#login").load("loginform2.jsp"); */
		Modal("#login", "open");
	});
	
	$("#signupBtn").click(function () {
		$(".row").hide();
		Modal("#sign-up", "open");
		$("#sign-up").css("display", "block");
	});
	
	$(".quit").click(function () {
		$(".row").show();
		Modal("#sign-up", "close");
		$("#sign-up").hide();
	});
	
	
</script>