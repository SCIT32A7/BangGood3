<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
<style>
.list li{
	font-size:17px;
}
</style>
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
			<h1> 접속 중 열람한 매물 </h1>
		</div>
	</div>
	<div class="container content profile" style="height:auto;">

			<!-- Profile Content -->
				<div class="g-pd-20">
				<c:if test = "${myClick.size() == 0}">
					<h2>오늘 본 매물이 없습니다.</h2>
				</c:if>
				<c:if test = "${myClick.size() > 0}">
					<div class="headline">
						<h2>오늘 본 매물</h2>
					</div>
					<!--row-->
					<c:forEach var = "click" items = "${myClick}">
					<div class="row">
						<div class="col-sm-4">
							<img class ="img-responsive"  src="download?pic_name=${click.pic_name}&pic_savename=${click.pic_savename}">
						</div>
						<div class="col-sm-6">
							<h2>
								<a href="read_property?property_no=${click.property_no}" target="_blank">[ ${click.rent_type} ] ${click.deposit} / ${click.month_fee}</a>
							</h2>
							<h4 style="display:inline;float: left">${click.property_title}</h4><br><br>
							
							<ul class="list list-unstyled list-inline blog-info-v2" style="float: left">
								<li>By: <a class="color-green" href="#">${click.custid}</a>
								</li>
								<li><i class="fa fa-clock-o"></i> ${click.property_inputdate}</li><br>
								<li> [관리비] ${click.maintence_fee}만원</li><br>
								<li> [면적] ${click.roomsize}제곱미터 &nbsp;&nbsp;&nbsp; [층수] ${click.floor}층</li><br>
								<li> [건축연도] ${click.built_year}년</li><br>
							</ul>
						</div> 
						
						<div class="col-sm-2">
							<div class="project-share">
								<ul class="list-inline comment-list-v2 pull-right g-mt-100">
									<li style="font-size:17px;"><i class="fa fa-eye"></i>${click.property_hits}</li>
									<li style="font-size:17px;"><i class="fa fa-comments"></i>${click.reply_count}</li>
									<li style="font-size:17px;"><i class="fa fa-heart"></i>${click.property_like}</li>
								</ul>
							</div>
						</div>
					</div>
					<hr>
					</c:forEach>
					<!--  end row -->	
					</c:if>				
				</div>
				</div>
				
				<!-- End Profile Content -->
		<!-- footer -->
			<%@ include file="footer.jsp"%> 
			<!-- end footer -->
		</main>
		
		<!--=== End Profile ===-->
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