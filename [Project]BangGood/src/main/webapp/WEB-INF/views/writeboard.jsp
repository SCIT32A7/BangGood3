<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<title>banngg</title>
<script type="text/javascript">
function writeCheck(){
	var title = document.getElementById("searchtitle");
	var text = document.getElementById("searchtext");
	if(title.value.length == 0){
		alert('게시글의 제목을 입력해주세요');
		return false;
	}
	if(text.value.length == 0){
		alert('게시글의 내용을 입력해주세요');
		return false;
	}
	
	var form = document.getElementById("send_text");
	var searchBoard_title = document.getElementById("searchBoard_title");
	var searchBoard_text = document.getElementById("searchBoard_text");
	searchBoard_title.value = title.value;
	searchBoard_text.value = text.value;
	form.action = "write_searchboard";
	form.method = "post";
	form.submit();
}

</script>
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

<body id="body" data-spy="scroll" data-target="one-page-header"
	class="demo-lightbox-gallery font-main promo-padding-top">
	<main class="wrapper"> <!-- header --> 
	<%@ include file="header.jsp"%> <!-- end header --> <!-- menu -->
	<%@ include file="join.jsp"%> 
	<%@ include file="join2.jsp"%> 
	<%@ include file="join3.jsp"%> 
	<%@ include file="login.jsp"%> 
	<!-- end menu --> 
	
	<div class="searchboard_title2 margin-bottom-20">
		<div class="searchboard_title-in">
			<h1>글쓰기</h1>
		</div>
	</div>
	<div class="container content">
	<div class="row">
		<table class="table">
			<div class="form-group">
				<tbody>
					<tr>
						<th style="width: 100px">제목</th>
						<td><input class="rounded form-control pull-width" type="text" id = "searchtitle"></td>
					</tr>
					<tr>
						<th style="width: 100px">이름</th>
						<td><input class="rounded form-control pull-width" type="text" readonly value = "${loginId}" ></td>
					</tr>
					<tr>
						<th style="width: 100px">이메일</th>
						<td><input class="rounded form-control pull-width" type="text" readonly value = "${loginCustomer.email}"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea type="text" class="pull-width" id = "searchtext"
								style="width: 100%; height: 250px"></textarea></td>
					</tr>

				</tbody>
			</div>
			<form id = "send_text">
				<input type = "hidden" id = "searchBoard_text" name = "searchBoard_text">
				<input type = "hidden" id = "searchBoard_title" name = "searchBoard_title">
			</form>
		</table>
	</div>
	<div class="pull-right">
	<a href = "javascript:writeCheck()" class="btn-u btn-block g-ml-10" style="background-color:#f7be22; width:80px;">작성완료</a> 
	<a href="searchboard" class="btn-u btn-block" style="background-color:#f7be22; width:80px;">돌아가기</a>
	</div>
	</div>
	<div class="clearfix margin-bottom-20"></div>
	
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