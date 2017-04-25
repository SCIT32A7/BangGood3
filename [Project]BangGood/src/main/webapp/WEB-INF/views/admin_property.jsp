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
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/btn_style.css">

<style>
.searchboard_title {
	text-align: center;
	position: relative;
	background: url(assets/img/bg/1.jpg) no-repeat ;
}
</style>	
	
</head>

<body id="body" data-spy="scroll" data-target=".one-page-header"
	class="demo-lightbox-gallery font-main promo-padding-top">
	<main class="wrapper"> 
	<!-- header --> 
	<%@ include file="header.jsp"%> 
	<!-- end header --> 
	<!-- menu -->
	<%@ include file="join.jsp"%> 
	<%@ include file="join2.jsp"%> 
	<%@ include file="join3.jsp"%> 
	<%@ include file="login.jsp"%> 
	<!-- end menu --> 
	<!--=== Breadcrumbs v2 ===-->
	<div class="searchboard_title g-mb-20">
		<div class="searchboard_title-in">
			<h1></h1>
		</div>
	</div>
	<!--=== End Breadcrumbs v2 ===--> <!--=== Content Part ===-->
	<div class="container content">
		<div class="headline">
			<h2>매물관리</h2>	
			
			<form action="searchboard" id = "pagingForm" method="get" class="g-dp-inline pull-right" style="vertical-align: middle;">
				<input type="text" name="searchText" id="searchText" value = "" style="width:170px;" 
				class="g-mr-10" placeholder="아이디를 입력해주세요.">
				<button class="btn-u btn-block rounded" style=" width: 80px;">
					<a href=""><i class="fa fa-search"></i>검색</a>
				</button>
		
			<button class="btn-u btn-block rounded" style=" width:80px;display:inline-block; background: #333">
						<a href="">삭제</a>	
			</button>
			<input type = "hidden" name = "page" id = "page">
			</form>
		</div>
		<!-- Tab pannel 4 -->

		<div class="table-responsive">
			<table class="table text-center">
				<colgroup>
					<col width="20px">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="*">
				</colgroup>
				<thead>
					<tr class="text-center">
						<th>
							 <input type="checkbox" id="checkedAll"/>
  							<label class="admin_label"for="checkedAll"></label>
						</th>
						<th class="text-center">매물번호</th>
						<th class="text-center">아이디</th>						
						<th class="text-center">거래타입</th>
						<th class="text-center">보증금/월세</th>
						<th class="text-center">등록일</th>
						<th class="text-center">제목</th>
					</tr>
				</thead>
					<tbody>
						<tr>
							<td>
								 <input name="subCheck" type="checkbox" id="check1" value="1">
  								<label class="admin_label" for="check1"></label>
							</td>
							<td>매물번호</td>
							<td>아잉디</td>
							<td>거래타입</td>
							<td>보증금/월세</td>
							<td>등록일</td>
							<td><a href="#">제목</a></td>
						</tr>
						<tr>
							<td>
								 <input name="subCheck" type="checkbox" id="check2" value="2">
  								<label class="admin_label" for="check2"></label>
							</td>
							<td>매물번호</td>
							<td>아잉디</td>
							<td>거래타입</td>
							<td>보증금/월세</td>
							<td>등록일</td>
							<td><a href="#">제목</a></td>
						</tr>
					</tbody>
				
			</table>
		</div>

		<div class="text-center">
				<ul class="pagination pagination">
					<li><a href="javascript:pagingForSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁</a></li>
					<li><a href="javascript:pagingForSubmit(${navi.currentPage - 1})">◀</a></li>
					<c:forEach var = "page" begin = "${navi.startPageGroup}" end="${navi.endPageGroup}">
						<li><a href="javascript:pagingForSubmit(${page})">${page}</a></li>
					</c:forEach>		
					<li><a href="javascript:pagingForSubmit(${navi.currentPage + 1})">▶</a></li>
					<li><a href="javascript:pagingForSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a></li>
				</ul>	
		</div>
		<!-- End Tab pannel 4 -->
	</div>
	<div class="clearfix margin-bottom-20"></div>
	<!--=== End Content Part ===--> 
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
	$(function(){
	
		$("#checkedAll").click(function(){
			if($('#checkedAll').prop('checked')){
				$('input[name=subCheck]:checkbox').each(function(){
					$(this).prop('checked',true);
				});
			} else{
				$('input[name=subCheck]:checkbox').each(function(){
					$(this).prop('checked',false);
				});
			}
		});
		
	});
	</script>
</body>
</html>