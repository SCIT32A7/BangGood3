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
	<div class="container content profile" style="height:auto;">

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
					<li class="list-group-item">
					<a href="mypage"><i class="fa fa-cubes" style="width:15px; height:10px;"></i> 등록매물</a>
					</li>
					<li class="list-group-item active">
					<a href="mypage2"><i class="fa fa-cubes" style="width:15px; height:10px;"></i> 관심매물</a>
					</li>
					<li class="list-group-item">
					<a href="get_messageList"><i class="fa fa-comments" style="width:15px; height:10px;"></i> 메세지</a>
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
				<c:if test = "${myCart.size() == 0}">
					<h2>관심목록이 비어 있습니다.</h2>
				</c:if>
				<c:if test = "${myCart.size() > 0}">
					<div class="headline">
						<h2>관심 매물</h2>
					</div>
					<!--row-->
					<c:forEach var = "cart" items = "${myCart}">
					<div class="row">
						<div class="col-sm-5">
							<img class ="img-responsive"  src="download?pic_name=${cart.pic_name}&pic_savename=${cart.pic_savename}">
						</div>
						<div class="col-sm-5">
							<h2>
								<a href="read_property?property_no=${cart.property_no}" target="_blank">[ ${cart.rent_type} ] ${cart.deposit} / ${cart.month_fee}</a>
							</h2>
							<p style="float: left">${cart.property_title}</p><br>
							<ul class="list-unstyled list-inline blog-info-v2" style="float: left">
								<li>By: <a class="color-green" href="#">${cart.custid}</a>
								</li>
								<li><i class="fa fa-clock-o"></i> ${cart.property_inputdate}</li><br>								
								<li> [관리비] ${cart.maintence_fee}만원</li><br>
								<li> [면적] ${cart.roomsize}제곱미터 &nbsp;&nbsp;&nbsp; [층수] ${cart.floor}층</li><br>
								<li> [건축연도] ${cart.built_year}년</li><br>
							</ul>							
						</div>
						<div class="col-sm-2">
							<button class="mypage_btn btn-u btn-block rounded">
								<a href="delete_cart?property_no=${cart.property_no}">삭제</a>
							</button>
							<div class="project-share">
								<ul class="list-inline comment-list-v2 pull-right g-mt-100">
									<li><i class="fa fa-eye"></i>${cart.property_hits}</li>
									<li><i class="fa fa-comments"></i>${cart.reply_count}</li>
									<li><i class="fa fa-heart"></i>${cart.property_like}</li>
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
			</div>
		</div>
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