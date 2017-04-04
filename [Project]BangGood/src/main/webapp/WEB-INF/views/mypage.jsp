<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
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
<link
	href='https://fonts.googleapis.com/css?family=Ek+Mukta:400,600,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="assets/css/one.style.css">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="assets/plugins/owl-carousel2/assets/owl.carousel.css">
<link rel="stylesheet"
	href="assets/plugins/owl-carousel/owl-carousel/owl.theme.css">
<link rel="stylesheet"
	href="assets/plugins/hover-effects/css/custom-hover-effects.css">
<link rel="stylesheet" href="assets/plugins/pace/pace-flash.css">
<!-- CSS Theme -->
<link rel="stylesheet" href="assets/css/construction.style.css">
<!-- 메인 -->
<link rel="stylesheet" href="assets/css/global.css">
<!-- 메인 글씨 -->
<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom.css">
<link rel="stylesheet"
	href="assets/plugins/font-awesome/css/font-awesome.min.css">
</head>

<body id="body" data-spy="scroll" data-target=".one-page-header"
	class="demo-lightbox-gallery font-main promo-padding-top">
	<main class="wrapper"> <!-- header --> <%@ include
		file="header.jsp"%> <!-- end header --> <!-- menu -->
	<%@ include file="join.jsp"%> <%@ include
		file="join2.jsp"%> <%@ include
		file="join3.jsp"%> <%@ include
		file="login.jsp"%> <!-- end menu --> <!--=== Profile ===-->

	<div class="searchboard_title margin-bottom-20">
		<div class="searchboard_title-in">
			<h1>My page</h1>
		</div>
	</div>
	<div class="container content profile">

		<div class="row">
			<!--Left Sidebar-->
			<div class="col-md-3 md-margin-bottom-40">

				<h4>
					<span>${loginId}</span> 님 마이페이지 입니다.
				</h4>
				<hr>

				<div class="margin-bottom-50"></div>
				<ul class="list-group sidebar-nav-v1 margin-bottom-40"
					id="sidebar-nav-1">
					<li class="list-group-item active">
					<a href="mypage"><i class="fa fa-cubes" style="width:15px; height:10px;"></i> 등록매물</a>
					</li>
					<li class="list-group-item">
					<a href="mypage2"><i class="fa fa-cubes" style="width:15px; height:10px;"></i> 관심매물</a>
					</li>
					<li class="list-group-item">
					<a href="mypage3"><i class="fa fa-comments" style="width:15px; height:10px;"></i> 메세지</a>
					</li>
					<li class="list-group-item ">
					<a href="mypage4"><i class="fa fa-user" style="width:15px; height:10px;"></i> 개인정보 수정</a>
					</li>
				</ul>

				<!--Datepicker-->
				<form action="#" id="sky-form2" class="sky-form">
					<div id="inline-start"></div>
				</form>
				<!--End Datepicker-->
			</div>
			<!--End Left Sidebar-->

			<!-- Profile Content -->
			<div class="col-md-9">
				<div class="g-pd-20">
					<div class="headline">
						<h2>등록매물</h2>
					</div>
					<!--row-->
					<div class="row">
						<div class="col-sm-5">
							<img class="img-responsive" src="assets/img/main/img12.jpg"
								style="">
						</div>
						<div class="col-sm-5">
							<h2>
								<a href="#">Rigging in Autodesk 3Ds Max</a>
							</h2>
							<ul class="list-unstyled list-inline blog-info-v2"
								style="float: left">
								<li>By: <a class="color-green" href="#">Edward Rooster</a>
								</li>
								<li><i class="fa fa-clock-o"></i> Jan 02, 2013</li>
							</ul>
							<p style="float: left">Lorem Ipsum is simply dummy text of
								the printing and typesetting industry printing. Donec non
								dignissim eros. Mauris faucibus turpis volutpat sagittis
								rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.
							</p>
						</div>
						<div class="col-sm-2">
							<button class=" mypage_btn btn-u btn-block rounded">
								<a href="#">수정</a>
							</button>
							<button class="mypage_btn btn-u btn-block rounded">
								<a href="#">삭제</a>
							</button>
							<div class="project-share">
								<ul class="list-inline comment-list-v2 pull-right g-mt-100">
									<li><i class="fa fa-eye"></i><a href="#">25</a></li>
									<li><i class="fa fa-comments"></i><a href="#">32</a></li>
									<li><i class="fa fa-heart"></i><a href="#">32</a></li>
								</ul>
							</div>
						</div>
					</div>
					<hr>
					<!--  end row -->

					<!--row-->
					<div class="row">
						<div class="col-sm-5">
							<img class="img-responsive" src="assets/img/main/img12.jpg"
								style="">
						</div>
						<div class="col-sm-5">
							<h2>
								<a href="#">Rigging in Autodesk 3Ds Max</a>
							</h2>
							<ul class="list-unstyled list-inline blog-info-v2"
								style="float: left">
								<li>By: <a class="color-green" href="#">Edward Rooster</a>
								</li>
								<li><i class="fa fa-clock-o"></i> Jan 02, 2013</li>
							</ul>
							<p style="float: left">Lorem Ipsum is simply dummy text of
								the printing and typesetting industry printing. Donec non
								dignissim eros. Mauris faucibus turpis volutpat sagittis
								rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.
							</p>
						</div>
						<div class="col-sm-2">
							<button class=" mypage_btn btn-u btn-block rounded">
								<a href="#">수정</a>
							</button>
							<button class="mypage_btn btn-u btn-block rounded">
								<a href="#">삭제</a>
							</button>
							<div class="project-share">
								<ul class="list-inline comment-list-v2 pull-right g-mt-100">
									<li><i class="fa fa-eye"></i><a href="#">25</a></li>
									<li><i class="fa fa-comments"></i><a href="#">32</a></li>
									<li><i class="fa fa-heart"></i><a href="#">32</a></li>
								</ul>
							</div>
						</div>
					</div>
					<hr>
					<!-- row -->

				</div>
				<!-- End Profile Content -->
			</div>
		</div>
		<!--=== End Profile ===-->
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
		<script
			src="assets/plugins/sky-forms-pro/skyforms/js/jquery.form.min.js"></script>
		<script
			src="assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
		<script
			src="assets/plugins/cube-portfolio/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
		<script src="assets/plugins/modernizr.js"></script>
		<!-- 브라우저 호환성 -->
		<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>
		<!-- JS Page Level-->
		<script src="assets/js/one.app.js"></script>
		<script src="assets/js/cube-portfolio.js"></script>
		<script src="assets/js/contact.js"></script>
		<script src="assets/js/promo.js"></script>

		<!-- custom -->
		<script src="assets/js/custom.js"></script>
</body>
</html>