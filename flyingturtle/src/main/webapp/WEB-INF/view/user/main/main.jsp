<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Header section ================================================== -->
<section id="header" class="header-one">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8">
				<div class="header-thumb">
					<h1 class="wow fadeIn" data-wow-delay="1.6s">Flying turtle,</h1>
					<h3 class="wow fadeInUp" data-wow-delay="1.9s">같이 날아볼까요</h3>
				</div>
			</div>
		</div>
	</div>
</section>


<!-- Portfolio section
================================================== -->
<section id="portfolio">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				
				<!-- iso section -->
				<div class="iso-section wow fadeInUp" data-wow-delay="2.6s">
					<ul class="filter-wrapper clearfix">
						<li>
							<a href="#" data-filter="*" class="selected opc-main-bg">
								당신의 모든것
							</a>
						</li>
						<li><a href="#" class="opc-main-bg" data-filter=".graphic">출결</a></li>
						<li><a href="#" class="opc-main-bg" data-filter=".template">누구나
								묻고 답하기</a></li>
						<li><a href="#" class="opc-main-bg" data-filter=".photoshop">추천
								동영상</a></li>
						<li><a href="#" class="opc-main-bg" data-filter=".branding">용어사전</a></li>
					</ul>

					<!-- iso box section -->
					<div class="iso-box-section wow fadeInUp" data-wow-delay="1s">
						<div class="iso-box-wrapper col4-iso-box">
							
							<div class="iso-box photoshop branding col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img
										src="<c:url value="/resources/images/portfolio-img1.jpg"/>"
										class="img-responsive" alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="single-project.html"><i class="fa fa-link"></i></a>
											<h2>Project One</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box graphic template col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img
										src="<c:url value="/resources/images/portfolio-img2.jpg"/>"
										class="img-responsive" alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="single-project.html"><i class="fa fa-link"></i></a>
											<h2>Project Two</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box template graphic col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img
										src="<c:url value="/resources/images/portfolio-img3.jpg"/>"
										class="img-responsive" alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="single-project.html"><i class="fa fa-link"></i></a>
											<h2>Project Three</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box graphic template col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img
										src="<c:url value="/resources/images/portfolio-img4.jpg"/>"
										class="img-responsive" alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="single-project.html"><i class="fa fa-link"></i></a>
											<h2>Project Four</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box photoshop branding col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img
										src="<c:url value="/resources/images/portfolio-img5.jpg"/>"
										class="img-responsive" alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="single-project.html"><i class="fa fa-link"></i></a>
											<h2>Project Five</h2>
										</div>
									</div>
								</div>
							</div>

							<div class="iso-box graphic branding col-md-4 col-sm-6">
								<div class="portfolio-thumb">
									<img
										src="<c:url value="/resources/images/portfolio-img6.jpg"/>"
										class="img-responsive" alt="Portfolio">
									<div class="portfolio-overlay">
										<div class="portfolio-item">
											<a href="single-project.html"><i class="fa fa-link"></i></a>
											<h2>Project Six</h2>
										</div>
									</div>
								</div>
							</div>
							
						</div><!-- iso-box-wrpper -->
					</div><!-- iso-box-section -->
				</div>
			</div>
		</div>
	</div>
</section>


