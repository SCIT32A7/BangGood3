<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<c:if test = "${not empty result}">
	<c:if test = "${result == 'fail'}">
		<script>
			alert('변경에 실패하였습니다.');
			location.href = "./mypage4";
		</script>
	</c:if>
	<c:if test = "${result == 'success'}">
		<script>
			alert('변경되었습니다.');
			location.href = "./mypage";
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
					<li class="list-group-item">
					<a href="mypage"><i class="fa fa-cubes" style="width:15px; height:10px;"></i> 등록매물</a>
					</li>
					<li class="list-group-item">
					<a href="mypage2"><i class="fa fa-cubes" style="width:15px; height:10px;"></i> 관심매물</a>
					</li>
					<li class="list-group-item">
					<a href="mypage3"><i class="fa fa-comments" style="width:15px; height:10px;"></i> 메세지</a>
					</li>
					<li class="list-group-item active">
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
						<h2>비밀번호 변경</h2>
					</div>
					<!--row-->
					<div class="row">
						<div class="col-sm-8">
						<form action ="customer_update" method = "post" onsubmit = "return checkUpdate()">
							<table class="table">							
								<div class="form-group">
									<tbody>
										<tr>
											<th>아이디</th>
											<td><span>${modify_customer.custid}</span></td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td><input class="rounded form-control pull-width"
												type="password" name = "password" id = "pw1"></td>
										</tr>
										<tr>
											<th>비밀번호 <br>다시입력</th>
											<td><input class="rounded form-control pull-width"
												type="password" id = "pw2"></td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td><input class="rounded form-control pull-width"
												type="text" id = "phone" name = "phone" value = "${modify_customer.phone}"></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><span id = "email" name = "email">${modify_customer.email}</span></td>
										</tr>
										<tr>
											<td colspan="2">
											<input class="rounded form-control mypage_modify_btn" type="submit" value="저장"></td>
										</tr>
									</tbody>
								</div>
								<!--// form-->
							</table>
						</form>
						</div>
					</div>
					<hr>
					<!--  end row -->
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
		<script type="text/javascript">
		function checkUpdate(){
			var pw1 = document.getElementById("pw1");
			var pw2 = document.getElementById("pw2");
			var p = document.getElementById("phone");
			
			if(pw1.value.length == 0){
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			
			if(pw2.value.length == 0){
				alert('비밀번호 재입력을 입력해주세요.');
				return false;
			}
			
			if(pw1.value != pw2.value){
				alert('비밀번호 다시 확인해 주세요.');
				return false;
			}
			
			if(p.value.length == 0){
				alert('전화번호를 입력해주세요.');
				return false;
			}
			return true;
		}
		</script>
</body>
</html>