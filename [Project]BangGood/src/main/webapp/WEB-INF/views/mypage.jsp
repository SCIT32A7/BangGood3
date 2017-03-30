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

	<body id="body" data-spy="scroll" data-target=".one-page-header" class="demo-lightbox-gallery font-main promo-padding-top">
		<main class="wrapper">
			<!-- header -->
			<%@ include file="header.jsp"%> 
			<!-- end header -->
			<!-- menu -->
			<%@ include file="join.jsp" %> 
			<%@ include file="join2.jsp" %> 
			<%@ include file="join3.jsp" %> 
			<%@ include file="login.jsp" %> 
			<!-- end menu -->
			<!--=== Profile ===-->
			<div class="container content profile">
				<div class="row">
					<!--Left Sidebar-->
					<div class="col-md-3 md-margin-bottom-40">
						<img class="img-responsive profile-img margin-bottom-20" src="assets/img/team/img32-md.jpg" alt="">

						<ul class="list-group sidebar-nav-v1 margin-bottom-40" id="sidebar-nav-1">
							<li class="list-group-item active">
								<a href="page_profile_projects.html"><i class="fa fa-cubes"></i> My Projects</a>
							</li>
							<li class="list-group-item">
								<a href="page_profile_comments.html"><i class="fa fa-comments"></i> Comments</a>
						</ul>
						<hr>

						<div class="margin-bottom-50"></div>

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
							<!--Projects-->
							<div class="row">
								<div class="col-sm-6">
									<div class="easy-block-v1">
										<img class="img-responsive" src="assets/img/main/img12.jpg" alt="">
										<div class="easy-block-v1-badge rgba-red">
											Web Design
										</div>
									</div>
									<div class="projects">
										<h2><a class="color-dark" href="#">Rigging in Autodesk 3Ds Max</a></h2>
										<ul class="list-unstyled list-inline blog-info-v2">
											<li>
												By: <a class="color-green" href="#">Edward Rooster</a>
											</li>
											<li>
												<i class="fa fa-clock-o"></i> Jan 02, 2013
											</li>
										</ul>
										<p>
											Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.
										</p>
									</div>
									<div class="project-share">
										<ul class="list-inline comment-list-v2 pull-left">
											<li>
												<i class="fa fa-eye"></i><a href="#">25</a>
											</li>
											<li>
												<i class="fa fa-comments"></i><a href="#">32</a>
											</li>
											<li>
												<i class="fa fa-retweet"></i><a href="#">77</a>
											</li>
										</ul>
										<ul class="list-inline star-vote pull-right">
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star-half-o"></i>
											</li>
											<li>
												<i class="color-green fa fa-star-o"></i>
											</li>
										</ul>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="service-or easy-block-v2 no-margin-bottom">
										<img class="img-responsive" src="assets/img/main/img16.jpg" alt="">
										<div class="easy-bg-v2 rgba-default">
											Unify
										</div>
									</div>
									<div class="projects">
										<h2><a class="color-dark" href="#">Getting Started Photography</a></h2>
										<ul class="list-unstyled list-inline blog-info-v2">
											<li>
												By: <a class="color-green" href="#">Edward Rooster</a>
											</li>
											<li>
												<i class="fa fa-clock-o"></i> Jan 07, 2013
											</li>
										</ul>
										<p>
											Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.
										</p>
									</div>
									<div class="project-share">
										<ul class="list-inline comment-list-v2 pull-left">
											<li>
												<i class="fa fa-eye"></i><a href="#">45</a>
											</li>
											<li>
												<i class="fa fa-comments"></i><a href="#">90</a>
											</li>
											<li>
												<i class="fa fa-retweet"></i><a href="#">84</a>
											</li>
										</ul>
										<ul class="list-inline star-vote pull-right">
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star-half-o"></i>
											</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!--End Projects-->

							<hr>

							<!--Projects-->
							<div class="row">
								<div class="col-sm-6">
									<div class="easy-block-v1">
										<img class="img-responsive" src="assets/img/main/img17.jpg" alt="">
										<div class="easy-block-v1-badge rgba-purple">
											Graphic Design
										</div>
									</div>
									<div class="projects">
										<h2><a class="color-dark" href="#">Rigging in Autodesk 3Ds Max</a></h2>
										<ul class="list-unstyled list-inline blog-info-v2">
											<li>
												By: <a class="color-green" href="#">Edward Rooster</a>
											</li>
											<li>
												<i class="fa fa-clock-o"></i> Jan 02, 2013
											</li>
										</ul>
										<p>
											Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.
										</p>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="service-or easy-block-v2 no-margin-bottom">
										<img class="img-responsive" src="assets/img/main/img18.jpg" alt="">
										<div class="easy-bg-v2 rgba-blue">
											Nokia
										</div>
									</div>
									<div class="projects">
										<h2><a class="color-dark" href="#">Getting Started Photography</a></h2>
										<ul class="list-unstyled list-inline blog-info-v2">
											<li>
												By: <a class="color-green" href="#">Edward Rooster</a>
											</li>
											<li>
												<i class="fa fa-clock-o"></i> Jan 07, 2013
											</li>
										</ul>
										<p>
											Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.
										</p>
									</div>
									<div class="project-share">
										<ul class="list-inline comment-list-v2 pull-left">
											<li>
												<i class="fa fa-eye"></i><a href="#">45</a>
											</li>
											<li>
												<i class="fa fa-comments"></i><a href="#">90</a>
											</li>
											<li>
												<i class="fa fa-retweet"></i><a href="#">84</a>
											</li>
										</ul>
										<ul class="list-inline star-vote pull-right">
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star-half-o"></i>
											</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!--End Projects-->

							<hr>

							<!--Projects-->
							<div class="row margin-bottom-30">
								<div class="col-sm-6">
									<div class="easy-block-v1">
										<img class="img-responsive" src="assets/img/main/img19.jpg" alt="">
										<div class="easy-block-v1-badge rgba-aqua">
											Unify Project
										</div>
									</div>
									<div class="projects">
										<h2><a class="color-dark" href="#">Rigging in Autodesk 3Ds Max</a></h2>
										<ul class="list-unstyled list-inline blog-info-v2">
											<li>
												By: <a class="color-green" href="#">Edward Rooster</a>
											</li>
											<li>
												<i class="fa fa-clock-o"></i> Jan 02, 2013
											</li>
										</ul>
										<p>
											Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.
										</p>
									</div>
									<div class="project-share">
										<ul class="list-inline comment-list-v2 pull-left">
											<li>
												<i class="fa fa-eye"></i><a href="#">25</a>
											</li>
											<li>
												<i class="fa fa-comments"></i><a href="#">32</a>
											</li>
											<li>
												<i class="fa fa-retweet"></i><a href="#">77</a>
											</li>
										</ul>
										<ul class="list-inline star-vote pull-right">
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star-half-o"></i>
											</li>
											<li>
												<i class="color-green fa fa-star-o"></i>
											</li>
										</ul>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="service-or easy-block-v2 no-margin-bottom">
										<img class="img-responsive" src="assets/img/main/img20.jpg" alt="">
										<div class="easy-bg-v2 rgba-yellow">
											Sony
										</div>
									</div>
									<div class="projects">
										<h2><a class="color-dark" href="#">Getting Started Photography</a></h2>
										<ul class="list-unstyled list-inline blog-info-v2">
											<li>
												By: <a class="color-green" href="#">Edward Rooster</a>
											</li>
											<li>
												<i class="fa fa-clock-o"></i> Jan 07, 2013
											</li>
										</ul>
										<p>
											Lorem Ipsum is simply dummy text of the printing and typesetting industry printing. Donec non dignissim eros. Mauris faucibus turpis volutpat sagittis rhoncus. Pellentesque et rhoncus sapien, sed ullamcorper justo.
										</p>
										<br>
										<h3 class="heading-xs">Project Completeness <span class="pull-right">92%</span></h3>
										<div class="progress progress-u progress-xxs">
											<div class="progress-bar progress-bar-u" role="progressbar" aria-valuenow="92" aria-valuemin="0" aria-valuemax="100" style="width: 92%"></div>
										</div>
										<ul class="list-inline blog-info-v2">
											<li>
												<strong>45%</strong>
												<span>Funded</span>
											</li>
											<li>
												<strong>58%</strong>
												<span>Pludged</span>
											</li>
											<li>
												<strong>5</strong>
												<span>days to go</span>
											</li>
										</ul>
									</div>
									<div class="project-share">
										<ul class="list-inline comment-list-v2 pull-left">
											<li>
												<i class="fa fa-eye"></i><a href="#">45</a>
											</li>
											<li>
												<i class="fa fa-comments"></i><a href="#">90</a>
											</li>
											<li>
												<i class="fa fa-retweet"></i><a href="#">84</a>
											</li>
										</ul>
										<ul class="list-inline star-vote pull-right">
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star"></i>
											</li>
											<li>
												<i class="color-green fa fa-star-half-o"></i>
											</li>
										</ul>
									</div>
								</div>
							</div><!--/end row-->
							<!--End Projects-->
							<button type="button" class="btn-u btn-u-default btn-u-sm btn-block">
								Load More
							</button>
						</div>
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
</body>
</html>