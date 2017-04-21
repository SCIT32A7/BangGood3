<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="assets/plugins/owl-carousel2/assets/owl.carousel.css">
<link rel="stylesheet"
	href="assets/plugins/owl-carousel/owl-carousel/owl.theme.css">
<link rel="stylesheet"
	href="assets/plugins/hover-effects/css/custom-hover-effects.css">
<link rel="stylesheet" href="assets/plugins/pace/pace-flash.css">
<!-- CSS Theme -->
<link rel="stylesheet" href="assets/css/construction.style.css">
<!-- 메인 -->
<link rel="stylesheet" href="assets/css/global.css">
<link rel="stylesheet" href="assets/plugins/fancybox/source/jquery.fancybox.css">
<!-- 메인 글씨 -->
<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom.css">
<link rel="stylesheet"
	href="assets/plugins/font-awesome/css/font-awesome.min.css">

<!-- graph -->
<script type="text/javascript" src="assets/plugins/jquery/jquery-3.2.0.min.js"></script>
<link rel="stylesheet" href="assets/css/Nwagon.css" type="text/css">
<!-- photo -->
<link rel="stylesheet" href="assets/css/lightbox.min.css" type="text/css">

	<style>

	
	</style>
	<script>
	var property_no = 160088;
	var selectedRadar;
	var avgRadar;
	var percentRadar;
	var maxRadar;
	var minRadar;
	
	window.onload = function () {
		$.ajax({
			method:"get",
			url:"loadChart",
			async: false,
			data: {property_no: property_no},
			success: getRadarChartData,
			error: function() {
				alert("조회 실패");
			}
		});
		
	}
	$(function(){
		
	var gal;
    var galout;
  var  light = "data-lightbox='roadtrip'";
		$(".gallery li img").on('click', function() {
			gal = $(this).attr("src");
			$(this).html(function(index, html) {
				galout = "<a href='"+gal+"' data-lightbox='roadtrip'><img src='"+gal+"'/></a>";
				$(".inner").html(galout);
			});
		});

	});
	</script>
	
</head>



<body id="body" data-spy="scroll" data-target=".one-page-header"
	class="demo-lightbox-gallery font-main promo-padding-top">
	<main class="wrapper"> <!-- header --> 
	<%@ include file="header.jsp"%> 
	<!-- end header --> 
	<!-- menu -->
	<%@ include file="join.jsp"%> 
	<%@ include file="join2.jsp"%> 
	<%@ include file="join3.jsp"%> 
	<%@ include file="login.jsp"%> 
	<!-- end menu -->
		<!--contents-->
	<!--=== title Part ===-->
	<div class="container">
	<div class="container-fluid content g-mt-30">
      <div class="row">
         <div class="col-md-2"></div>
         <div class="col-md-8">
            <div class="headline">
               <h2 style="font-size: 28px;">등록 확인</h2>
               <div class="pull-right">
                  <h1>Step4</h1>
               </div>
            </div>
         </div>
      </div>
	<div class="view_title_bg">
		<div class="container">
			<div class="col-sm-12 text-center g-mt-40 g-mb-40">
				<h1 class="view_title g-pb-20" style="color:#333">${property.property_title}</h1>
			</div>
		</div>
	
	<!--=== End title Part ===-->
	<div class="container">
		
		<div class="container g-mb-30">
			<div class="row">
				<!--=== title left ===-->
				<div class="col-sm-8 view_bg g-mb-30">
				<div class="inner g-mt-30">
					<img src="assets/img/room/1.jpg" data-lightbox="roadtrip"/>
				</div>
				<div class="thumwrap">
					<ul class="gallery">
						<c:forEach var = "pic" items = "${picture}">
							<li><img src="download?pic_name=${pic.pic_name}&pic_savename=${pic.pic_savename}"></li>
						</c:forEach>
					</ul>
				</div>
				
			<!--=== title info ===-->
					<div class="g-pt-20 g-pb-20 clearfix"></div>
						<h3 style="font-weight: bold">방정보</h3>
							<table class="table">
								<tr>
									<th>보증금/월세</th>
									<th>방 종류</th>
									<th>방 크기</th>
									<th>관리비</th>
									<th>관리비포함항목</th>
									<th>엘레베이터</th>
									<th>주차</th>
									<th>반려동물</th>
								</tr>
								<tr>
									<th>[ ${property.rent_type} ] ${property.deposit} / ${property.month_fee}</th>
									<th>${property.property_type}</th>
									<th>${property.roomsize}</th>
									<th>${property.maintence_fee}</th>
									<td>
										무선인터넷 : <c:if test="${maintence.internet == 1}"> O </c:if><c:if test="${maintence.internet == 2}"> X </c:if><br>
										케이블TV : <c:if test="${maintence.tvfee == 1}"> O </c:if><c:if test="${maintence.tvfee == 2}"> X </c:if><br>
										청소비 : <c:if test="${maintence.cleaning == 1}"> O </c:if><c:if test="${maintence.cleaning == 2}"> X </c:if><br>
										수도료 : <c:if test="${maintence.waterfee == 1}"> O </c:if><c:if test="${maintence.waterfee == 2}"> X </c:if><br>
										가스비 : <c:if test="${maintence.gasfee == 1}"> O </c:if><c:if test="${maintence.gasfee == 2}"> X </c:if><br>
										전기세 : <c:if test="${maintence.electronic == 1}"> O </c:if><c:if test="${maintence.electronic == 2}"> X </c:if>
									</td>
									<td><c:if test="${option.elevator == 1}"> 있음 </c:if><c:if test="${option.elevator == 2}"> 없음 </c:if></td>
									<td><c:if test="${option.car == 1}"> 가능 </c:if><c:if test="${option.car == 2}"> 불가 </c:if></td>
									<td><c:if test="${option.pet == 1}"> 가능 </c:if><c:if test="${option.pet == 2}"> 불가 </c:if></td>
								</tr>
							</table>
					<div class="g-pt-20"></div>
					<h3 style="font-weight: bold">옵션</h3>
						<ul class="view_option">
							<c:if test="${option.elevator == 1}">
								<li><img src="assets/img/icon/1.png"><p>에어콘</p></li>
							</c:if>
							<li><img src="assets/img/icon/2.png"><p>냉장고</p></li>
							<li><img src="assets/img/icon/3.png"><p>세탁기</p></li>
							<li><img src="assets/img/icon/4.png"><p>가스레인지</p></li>
							<li><img src="assets/img/icon/5.png"><p>인덕션</p></li>
							<li><img src="assets/img/icon/6.png"><p>전자렌지</p></li>
							<li><img src="assets/img/icon/7.png"><p>책상</p></li>
							<li><img src="assets/img/icon/8.png"><p>선반</p></li>
							<li><img src="assets/img/icon/9.png"><p>침대</p></li>
							<li><img src="assets/img/icon/10.png"><p>옷장</p></li>
							<li><img src="assets/img/icon/11.png"><p>신발장</p></li>
							<li><img src="assets/img/icon/12.png"><p>도어락</p></li>
							<li><img src="assets/img/icon/13.png"><p>무선인터넷</p></li>
						</ul>
					<h3 style="font-weight: bold">상세설명</h3>
						<span>이런집이어딧어</span>
					<h3 style="font-weight: bold">위치 및 주변 편의시설</h3>
					<div class="margin-bottom-30"></div>
			         
				</div>
				<!--=== End title left ===-->
				<!--=== title right ===-->
				<div class="col-sm-3 view_bg g-ml-10">
					<div class="g-padding-20">
						<h3 style="font-weight: bold">원룸 전세 <span style="color:#f7be22; font-size:30px; font-weight: normal">65/65</span></h3>
						<p class="g-mb-10">서울특별시 서초구 반포동</p>
						
						<hr>
						<b class="g-mb-10">게시자 : <span>OOO</span></b>
						<p>연락처: <span>OOO-OOO-OOO</span></p>
						<a href="#" class="btn-u btn-u-lg btn-block" type="button">메세지보내기</button></a>
					</div>
				</div>
				<!--=== End title right ===-->
				
			</div>
		</div>
	</div>
	</div>
	<div class="clearfix"></div>
		<div class="row g-pt-40">
			            <div class="col-md-2"></div>
			            <div class="col-md-4">
			               <button href="insert_property2" type="submit"
			                  class="btn-u btn-block rounded insert_btn">다음단계</button>
			            </div>
			            <div class="col-md-4">
			               <button class="btn-u btn-block rounded insert_btn"
			                  style="background-color: #ccc">돌아가기</button>
			            </div>
			            <div class="col-md-2"></div>
			         </div>
	</div>
	</div>
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
	
	<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>

	<!-- JS Page Level-->
	<script src="assets/js/one.app.js"></script>
	<script src="assets/js/cube-portfolio.js"></script>
	<script src="assets/js/contact.js"></script>
	<script src="assets/js/promo.js"></script>
	<!-- custom -->
	<script src="assets/js/custom.js"></script>
	<script src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
	<!-- graph -->
	<script type="text/javascript" src="assets/js/radar.js"></script>
	<script type="text/javascript" src="assets/js/Nwagon.js"></script>
	<!-- photo -->
	<script type="text/javascript" src="assets/js/lightbox-plus-jquery.min.js"></script>
	
</body>
</html>