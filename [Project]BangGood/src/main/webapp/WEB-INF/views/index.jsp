<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<c:if test = "${not empty result}">
	<c:if test = "${result=='fail'}">
		<script>
			alert('아이디나 비밀번호를 다시 확인해주세요.');
		</script>
	</c:if>
	<c:if test = "${result=='success'}">
		<script>
			alert('로그인 되었습니다.');
		</script>
	</c:if>
</c:if>
<html lang="en">
	<!--<![endif]-->
	<head>
		<title>banngg</title>

		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">

		<!-- Web Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Ek+Mukta:400,600,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/app.css">
		<link rel="stylesheet" href="assets/css/one.style.css">

		<!-- CSS Implementing Plugins -->
		<link rel="stylesheet" href="assets/plugins/owl-carousel2/assets/owl.carousel.css">
		<link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.theme.css">
		<link rel="stylesheet" href="assets/plugins/hover-effects/css/custom-hover-effects.css">
		<link rel="stylesheet" href="assets/plugins/pace/pace-flash.css">
		<!-- CSS Theme -->
		<link rel="stylesheet" href="assets/css/construction.style.css">
		<!-- 메인 -->
		<link rel="stylesheet" href="assets/css/global.css">
		<!-- 메인 글씨 -->
		<!-- CSS Customization -->
		<link rel="stylesheet" href="assets/css/custom.css">
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
	</head>

	<body id="body" data-spy="scroll" class="demo-lightbox-gallery font-main ">
		<main class="wrapper">
			<!-- header -->
			<%@ include file="header.jsp"%> 
			<!-- end header -->
			<!-- menu -->
			<%@ include file="join.jsp"  %> 
			<%@ include file="join2.jsp"  %> 
			<%@ include file="join3.jsp"  %> 
			<%@ include file="login.jsp" %> 
			<!-- end menu -->
			
			<!-- Promo Block-->
			<section class="promo-section" id="intro">
				<div class="container-fluid no-column-space">
					<div class="row ">
						<div class="col-sm-6 ">
							<div class="fullscreen-static-image1 fullheight promo-block ">
								<div class="promo-block__content g-pr-50 ">
									<div class="text-right pull-right ">
										<span class="promo__pretitle g-dp-block g-mb-20">찾기</span>
										<h1 class="promo__title promo__title--right-bar g-pr-30 font-main g-mb-30">SEARCH
										<br>
										MY HOUSE</h1>
										<a href="#" class="btn-u btn-u--construction trim e_img2">더 보기</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="fullscreen-static-image2 fullheight promo-block">
								<div class="promo-block__content g-pl-50 ">
									<div class="text-left pull-left">
										<span class="promo__pretitle g-dp-block g-mb-20">방 내놓기</span>
										<h1 class="promo__title g-pl-30 promo__title--left-bar font-main g-mb-30">Renting
										<br>
										My House</h1>
										<a href="#" class="btn-u btn-u--construction trim">더 보기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- End Promo Block -->

			<!-- floor -->
			<section id="floor">
				<div class="container g-pt-80">
					<div class="main_head text-center g-mb-60">
						<span class="main_name g-dp-block g-mb-20">search</span>
						<h1 class="main_title font-main g-mb-60">도면도 찾기</h1>
						<p class="main_text">
							방긋에서는 도면도로 찾기시스템을 제공하고있습니다.
						</p>
					</div>
				</div>

				<div class="container-fluid with-bg with-bg--2 no-padding">
					<div class="color-overlay"></div>
					<div class="container floor-lg g-pt-90">
						<!-- Owl Carousel v3-->
						<div class="owl-carousel owl-theme controls-v3">
							<div class="item text-center">
								<a href="#">
								<div>
									<h2 class="floor_title font-main ">2층 월세</h2>
									<h4 class="floor_sub">서울 강남구 코엑스</h4>
									<p class="floor_text"><img src="assets/img/room1.png">
									</p>
								</div></a>
							</div>
							<div class="item text-center">
								<a href="#">
								<div>
									<h2 class="floor_title font-main ">2층 월세</h2>
									<p class="floor_text"><img src="assets/img/room1.png">
									</p>
								</div></a>
							</div>
							<div class="item text-center">
								<a href="#">
								<div>
									<h2 class="floor_title font-main ">2층 월세</h2>
									<p class="floor_text"><img src="assets/img/room1.png">
									</p>
								</div></a>
							</div>
						</div>
						<div>
							<span><a href="#"><img src="assets/img/prev.png"></a></span>
						</div>
					</div>
				</div>
			</section>
			<!-- End floor -->
			
			<!-- footer -->
			<div class="container-fluid" style="background-color: #f7be22;">
				<div class="footer text-center">
					<div class="row">
						<!-- About Us -->
						<div class="col-md-12">
							<div class="heading-footer">
								<h2>굿방</h2>
							</div>
							<p>
								Lorem ipsum dolor sit amet,
								<br>
								consectetur adipiscing elit.
								<br>
								Duis blandit ut metus a commodo. Pellentesque congue
								<br>
								tellus
								sed enim sollicitudin, id blandit mauris eleifend.
							</p>
							<br>
						</div>
						<!-- End About Us -->
					</div>
				</div>

				<div class="copyright text-center">
					<div class="container">
						<ul class="list-inline terms-menu">
							<li class="silver">
								Copyright © 2014 - All Rights Reserved
							</li>
						</ul>
					</div>
				</div>
			</div>

			<!-- end footer -->
		</main>

		<!-- JS Global Compulsory -->
		<script src="assets/plugins/jquery/jquery.min.js"></script>
		<script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.js"></script>

		<!-- JS Implementing Plugins -->
		<script src="assets/plugins/smoothScroll.js"></script>
		<!-- 스크럴 -->
		<script src="assets/plugins/jquery.easing.min.js"></script>
		<!-- 애니메이션 -->
		<script src="assets/plugins/pace/pace.min.js"></script>
		<script src="assets/plugins/owl-carousel2/owl.carousel.min.js"></script>
		<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.form.min.js"></script>
		<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
		<script src="assets/plugins/cube-portfolio/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
		<script src="assets/plugins/modernizr.js"></script><!-- 브라우저 호환성 -->
		<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>

		<!-- JS Page Level-->
		<script src="assets/js/one.app.js"></script>
		<script src="assets/js/cube-portfolio.js"></script>
		<script src="assets/js/contact.js"></script>
		<script src="assets/js/promo.js"></script>
		
		<!-- custom -->
		<script src="assets/js/custom.js"></script>
		<script src="assets/js/custom2.js"></script>

	</body>
</html>