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

	<!-- Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Ek+Mukta:400,600,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
	
		<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/app.css">
		<link rel="stylesheet" href="assets/css/one.style.css">

		<!-- CSS Implementing Plugins -->
		<link rel="stylesheet" href="assets/plugins/hover-effects/css/custom-hover-effects.css">
		<link rel="stylesheet" href="assets/plugins/pace/pace-flash.css">
		<link rel="stylesheet" href="assets/css/construction.style.css">
		<link rel="stylesheet" href="assets/css/global.css">
		<!-- CSS Customization -->
		<link rel="stylesheet" href="assets/css/custom.css">
		
	</head>

	<body id="body" data-spy="scroll" class="">
		<main class="wrapper">
			<!-- header -->
			<%@ include file="header.jsp"%> 
			<!-- end header -->
			<!-- menu -->
			<%@ include file="join.jsp"  %> 
			<%@ include file="join2.jsp"  %> 
			<%@ include file="join3.jsp"  %> 
			<%@ include file="mail_check.jsp"  %> 
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
										<a href="search" class="btn-u btn-u--construction trim e_img2">더 보기</a>
									</div>
								</div>
							</div>
						</div>

						<div class="col-sm-6">
							<div class="fullscreen-static-image2 fullheight promo-block">
								<div class="promo-block__content g-pl-50 ">
									<div class="text-left pull-left">
										<span class="promo__pretitle g-dp-block g-mb-20">방 내놓기</span>
										<h1 class="promo__title g-pl-30 promo__title--left-bar font-main g-mb-30">RENTING
										<br>
										My House</h1>
										<a href="insert_property" class="btn-u btn-u--construction trim">더 보기</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
			<section id="theme">
				<div class="container g-mt-80 g-mb-50">
					<div class="main_head text-center ">
						<span class="main_name g-dp-block g-mb-20">테마 검색</span>
						<h1 class="main_title font-main g-mb-60">THEME SEARCH</h1>
					</div>
				</div>
				<div class="container-fluid no-column-space">
				
					<div class="row ">
						<div class="col-md-6 main_theme">
						<div class="best-service best-service-1 text-center">
							<div class="valign__middle">
								<h2 class="best-service__title font-main g-mb-20"> 주차 가능 </h2>
								<a href="themeSearch?keyword=car" class="btn-u btn-u--construction trim">
								<i class="g-mr-10 fa btn-u__fa fa-arrow-right"></i> SEARCH </a>
							</div>
						</div>
						</div>

						<div class="col-md-6">
						<div class="best-service best-service-2 text-center" >
							<div class="valign__middle">
								<h2 class="best-service__title font-main g-mb-20"> 반려동물 동반 </h2>
								<a href="themeSearch?keyword=pet" class="btn-u btn-u--construction trim">
								<i class="g-mr-10 fa btn-u__fa fa-arrow-right"></i> SEARCH </a>
							</div>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="col-md-6">
						<div class="best-service best-service-3 text-center">
							<div class="valign__middle">
								<h2 class="best-service__title font-main g-mb-20"> 관리비 없음 </h2>
								<a href="themeSearch?keyword=maintence_fee" class="btn-u btn-u--construction trim">
								<i class="g-mr-10 fa btn-u__fa fa-arrow-right"></i> SEARCH </a>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="best-service best-service-4 text-center">
							<div class="valign__middle">
								<h2 class="best-service__title font-main g-mb-20"> 신축 건물</h2>
								<a href="themeSearch?keyword=newbuild" class="btn-u btn-u--construction trim">
								<i class="g-mr-10 fa btn-u__fa fa-arrow-right"></i> SEARCH </a>
							</div>
						</div>
					</div>
				</div>
				</div>
			</section>
			<section id="information">
				<div class="container g-mt-80 g-mb-50">
					<div class="main_head text-center ">
						<span class="main_name g-dp-block g-mb-20">OUR SERVICES</span>
						<h1 class="main_title font-main">WHAT WE CAN DO</h1>
					</div>
				</div>
			</section>
			<!-- end theme -->
			<div class="container-fluid content">
				<div class="row">
					<div class="col-md-12 g-mb-20">
						<div class="col-sm-3 text-center" style="border-right:1px solid #f7b70b">
							<img src="assets/img/bg/plan.png" width="250" height="200" class="g-mb-20">
							<h5 class = "text-center">방 구조를 상세히 알 수 있는<br>
							평면도를 만들 수 있습니다.</h5>
						</div>
						<div class="col-sm-3 text-center" style="border-right:1px solid #f7b70b">
							<img src="assets/img/bg/chart.jpg" width="250" height="200" class="g-mb-20">
							<h5 class = "text-center">같은 동에 있는 매물들과<br>
							현재 보는 매물을 비교한<br>
							비교분석 차트를 제공합니다.</h5>
						</div>
						<div class="col-sm-3 text-center" style="border-right:1px solid #f7b70b">
							<img src="assets/img/bg/contract.png" width="250" height="200" class="g-mb-20">
							<h5 class = "text-center">사용자 간의 직거래를 위한<br>
							가계약서가 인쇄 가능합니다.</h5>
						</div>
						<div class="col-sm-3 text-center">
							<img src="assets/img/bg/search.jpg" width="250" height="200" class="g-mb-20">
							<h5 class = "text-center">지역, 보증금, 월세 이외에<br>
							상세한 옵션 검색이 가능합니다</h5>
						</div>
					</div>
				</div>
			</div>
			<!-- footer -->
			<%@ include file="footer.jsp"%> 
			<!-- end footer -->
		</main>

		<!-- JS Global Compulsory -->
				<script src="assets/plugins/jquery/jquery.min.js"></script>
		<script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
		<!-- JS Implementing Plugins -->
		<script src="assets/plugins/pace/pace.min.js"></script>
		<script src="assets/plugins/modernizr.js"></script>
		<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>
		<!-- JS Page Level-->
		<script src="assets/js/one.app.js"></script>
		<!-- custom -->
		<script src="assets/js/custom.js"></script>
	</body>
</html>