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
	<div class="container content profile"style="height:700px;">

		<div class="row">
			<!--Left Sidebar-->
			<div class="col-md-3 md-margin-bottom-40">

				<h4>
					<span>${loginId}</span> 님 마이페이지 입니다.
				</h4>

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
					<a href="get_messageList"><i class="fa fa-comments" style="width:15px; height:10px;"></i> 메세지</a>
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
						<div class="col-sm-9" style="margin-left:50px; padding:30px;">
						<form action ="customer_update" method = "post" onsubmit = "return checkUpdate()">
							<table class="table">							
										<tr >
											<th style="border-top:none">아이디</th>
											<td style="border-top:none"><span>${modify_customer.custid}</span></td>
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
								<!--// form-->
							</table>
						</form>
						<input class="rounded form-control mypage_modify_btn" type="submit" value="저장" style="font-size:26px; height:46px;">
						</div>
					</div>
					<!--  end row -->
				</div>
				<!-- End Profile Content -->
			</div>
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