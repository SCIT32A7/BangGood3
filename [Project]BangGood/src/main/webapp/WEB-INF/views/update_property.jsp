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
<link rel="stylesheet"
	href="assets/plugins/font-awesome/css/font-awesome.min.css">

<style>
table tr {
	margin-bottom: 4px;
}

table tr th {
	width: 165px;
	font-size: 16.5px;
	border-right: 1px solid #f7b70b
}

table tr td {
	height: 40px;
	padding: 15px;
	font-size: 15px;
}


</style>
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

	<div class="container-fluid content g-mt-30">
		<div class="row">
		<div class="col-md-2"></div>
		<form action = "update_property_data" method = "post">
		<div class="col-md-8">
			<div class="headline">
				<h2 style="font-size: 28px;">방 기본정보 수정</h2>
				<div class="pull-right">
					<h1>Step1</h1>
				</div>
			</div>

				<!-- map -->
				<!-- end map -->
				<div class="margin-bottom-50"></div>
				<!-- basic -->

				<div class="insert_head pull-left">
					<h1 class="insert_title font-main">
						<i class="fa fa-file-o insert_name"></i>기본정보
					</h1>
				</div>
				<div class="clearfix"></div>
				<div class="row ">
						<div class="col-md-12 insert_box_bg ">
							<div>
									<table style="width:100%">
										<colgroup>
											<col style="width:15%">
											<col style="width:35%">
											<col style="width:15%">
											<col style="width:35%">
										</colgroup>
										<tr class="borderline">
											<th>방 종류</th>
											<td colspan="3">
												<input type="radio" name="property_type" value = "원룸" 
												style="position:relative; top:6px" ${select_property.property_type == '원룸' ? 'checked' : ''}>
												<label class="insert_label">원룸</label>
												<input type="radio" name="property_type" value = "투룸" 
												style="position:relative; top:6px" ${select_property.property_type == '투룸' ? 'checked' : ''}>
												<label class="insert_label" >투룸</label>
											</td>
										</tr>
										<tr class="borderline">
											<th>매물 종류</th>
											<td colspan="3">
											<input type="radio" name="rent_type" value = "전세"
											 style="position:relative; top:6px" ${select_property.rent_type == '전세' ? 'checked' : ''}>
											<label class="insert_label">전세</label>
											<input type="radio" name="rent_type" value = "월세"
											 style="position:relative; top:6px" ${select_property.rent_type == '월세' ? 'checked' : ''}>
											<label class="insert_label">월세</label>
											<input type="hidden" name ="property_no" id="property_no" value = "${select_property.property_no}">
											</td>
										</tr>
										<tr class="borderline">
											<th>보증금 <br>/ 전세금</th>
											<td style="border-right: 1px solid #f7b70b">
											<input type="text" name = "deposit" id = "deposit" class="form-control rounded pull-left"
											 style="width: 150px;" value = "${select_property.deposit}"> 
											<label class="insert_label">만원</label>
											</td>
											<th style="padding-left: 18px">월세</th>
											<td><input type="text" name ="month_fee" id = "month_fee" class="form-control rounded pull-left"
											 style="width: 150px" value = "${select_property.month_fee}">
												<label class="insert_label">만원</label>
											</td>
										</tr>
										<tr class="borderline">
											<th>건물층수</th>
											<td style="border-right: 1px solid #f7b70b">
											<select id="floor" name = "floor" class="form-control" style="">
													<option value = "-1" ${select_property.floor == '-1' ? 'selected':''}>반지하</option>
													<option value = "1" ${select_property.floor == '1' ? 'selected':''}>1층</option>
													<option value = "2" ${select_property.floor == '2' ? 'selected':''}>2층</option>
													<option value = "3" ${select_property.floor == '3' ? 'selected':''}>3층</option>
													<option value = "4" ${select_property.floor == '4' ? 'selected':''}>4층</option>
													<option value = "5" ${select_property.floor == '5' ? 'selected':''}>5층</option>
													<option value = "6" ${select_property.floor == '6' ? 'selected':''}>6층</option>
													<option value = "7" ${select_property.floor == '7' ? 'selected':''}>7층</option>
													<option value = "8" ${select_property.floor == '8' ? 'selected':''}>8층</option>
													<option value = "9" ${select_property.floor == '9' ? 'selected':''}>9층</option>
													<option value = "10" ${select_property.floor == '10' ? 'selected':''}>10층 이상</option>
											</select></td>
											<th style="padding-left: 18px">면적</th>
											<td><input type="text" name ="roomsize" id = "roomsize" class="form-control rounded pull-left"
											 style="width: 150px" value = "${select_property.roomsize}">
												<label class="insert_label">평</label>
											</td>
										</tr>
										<tr class="borderline">
											<th>건축연도</th>
											<td  style="border-right: 1px solid #f7b70b">
											<input type="text" name = "built_year" id = "built_year" class="form-control rounded pull-left"
											 style="width: 150px;" value = "${select_property.built_year}"> 
											<label class="insert_label">년</label>
											</td>
											<th style="padding-left: 18px">건물명</th>
											<td><input type="text" name ="buildingname" id = "buildingname" class="form-control rounded pull-left"
											 style="width: 150px" value = "${select_property.buildingname}">
											</td>
										</tr>
									</table>
								<!-- </form> -->
							</div>
						</div>
					</div>
				<!-- basic -->
				<div class="margin-bottom-50"></div>
				<!-- option -->
				<div class="insert_head pull-left">
					<h1 class="insert_title font-main">
						<i class="fa fa-plus-square insert_name"></i>추가정보
					</h1>
				</div>
				<div class="clearfix"></div>
				<div class="row ">
					<div class="col-md-12 insert_box_bg ">
						<div>
								<table style="width:100%">
										<colgroup>
											<col style="width: 15%">
											<col style="width: 35%">
											<col style="width: 15%">
											<col style="width: 35%">
										</colgroup>
										<tr class="borderline">
										<th rowspan="2">관리비</th>
										<td colspan="3">
										<input type="text" id = "maintence_fee" name = "maintence_fee" class="form-control rounded pull-left"
										 style="width: 150px" value = "${select_property.maintence_fee}">
										<label class="insert_label">만원</label>
										</td>
									</tr>
									<tr class="borderline">
										<td colspan="3">
											<input type="checkbox" name="internet" value="1" 
											style="position:relative; top:6px" ${select_maintence.internet == '1' ? 'checked' : ''}>
											<label class="insert_label">인터넷</label>
											<input type="checkbox" name="tvfee" value="1"
											 style="position:relative; top:6px" ${select_maintence.tvfee == '1' ? 'checked' : ''}>
											<label class="insert_label">케이블</label>
											<input type="checkbox" name="cleaning" value="1"
											 style="position:relative; top:6px" ${select_maintence.cleaning == '1' ? 'checked' : ''}>
											<label class="insert_label">청소비</label>
											<input type="checkbox" name="waterfee" value="1"
											 style="position:relative; top:6px" ${select_maintence.waterfee == '1' ? 'checked' : ''}>
											<label class="insert_label">수도세</label>
											<input type="checkbox" name="gasfee" value="1"
											 style="position:relative; top:6px" ${select_maintence.gasfee == '1' ? 'checked' : ''}>
											<label class="insert_label">가스비</label>
											<input type="checkbox" name="electronic" value="1"
											 style="position:relative; top:6px" ${select_maintence.electronic == '1' ? 'checked' : ''}>
											<label class="insert_label">전기세</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>주차여부</th>
										<td colspan="3">
											<input type="radio" name="car" value = "1"
											 style="position:relative; top:6px" ${select_option.car == '1' ? 'checked' : ''}>
											<label class="insert_label">가능</label>
											<input type="radio" name="car" value = "2"
											 style="position:relative; top:6px" ${select_option.car == '2' ? 'checked' : ''}>
											<label class="insert_label">불가능</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>엘레베이터</th>
										<td colspan="3">
											<input type="radio" name="elevator" value = "1" 
											style="position:relative; top:6px" ${select_option.elevator == '1' ? 'checked' : ''}>
											<label class="insert_label">있음</label>
											<input type="radio" name="elevator" value = "2" 
											style="position:relative; top:6px" ${select_option.elevator == '2' ? 'checked' : ''}>
											<label class="insert_label">없음</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>반려동물</th>
										<td colspan="3">
											<input type="radio" name="pet" value = "1" 
											style="position:relative; top:6px" ${select_option.pet == '1' ? 'checked' : ''}>
											<label class="insert_label">가능</label>
											<input type="radio" name="pet" value = "2" 
											style="position:relative; top:6px" ${select_option.pet == '2' ? 'checked' : ''}>
											<label class="insert_label">불가능</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>옵션항목</th>
										<td colspan="3">
											<input type="checkbox" name="air_conditioner" value="1" 
											style="position:relative; top:6px" ${select_option.air_conditioner == '1' ? 'checked' : ''}>
											<label class="insert_label">에어콘</label>
											<input type="checkbox" name="fridge" value="1" 
											style="position:relative; top:6px" ${select_option.fridge == '1' ? 'checked' : ''}>
											<label class="insert_label">냉장고</label>
											<input type="checkbox" name="washing_machine" value="1" 
											style="position:relative; top:6px" ${select_option.washing_machine == '1' ? 'checked' : ''}>
											<label class="insert_label">세탁기</label>
											<input type="checkbox" name="gas_stove" value="1" 
											style="position:relative; top:6px" ${select_option.gas_stove == '1' ? 'checked' : ''}>
											<label class="insert_label">가스레인지</label>
											<input type="checkbox" name="electric_stove" value="1" 
											style="position:relative; top:6px" ${select_option.electric_stove == '1' ? 'checked' : ''}>
											<label class="insert_label">인덕션</label>
											<input type="checkbox" name="microwave" value="1" 
											style="position:relative; top:6px" ${select_option.microwave == '1' ? 'checked' : ''}>
											<label class="insert_label">전자레인지</label>
											<br>
											<input type="checkbox" name="desk" value="1" 
											style="position:relative; top:6px" ${select_option.desk == '1' ? 'checked' : ''}>
											<label class="insert_label">책상</label>
											<input type="checkbox" name="rack" value="1" 
											style="position:relative; top:6px" ${select_option.rack == '1' ? 'checked' : ''}>
											<label class="insert_label">선반</label>
											<input type="checkbox" name="bed" value="1" 
											style="position:relative; top:6px" ${select_option.bed == '1' ? 'checked' : ''}>
											<label class="insert_label">침대</label>
											<input type="checkbox" name="closet" value="1" 
											style="position:relative; top:6px" ${select_option.closet == '1' ? 'checked' : ''}>
											<label class="insert_label">옷장</label>
											<input type="checkbox" name="shoecabinet" 
											value="1" style="position:relative; top:6px" ${select_option.shoecabinet == '1' ? 'checked' : ''}>
											<label class="insert_label">신발장</label>
											<input type="checkbox" name="doorlock" 
											value="1" style="position:relative; top:6px" ${select_option.doorlock == '1' ? 'checked' : ''}>
											<label class="insert_label">도어락</label>
											<input type="checkbox" name="wifi" value="1" 
											style="position:relative; top:6px" ${select_option.wifi == '1' ? 'checked' : ''}>
											<label class="insert_label">무선인터넷</label>
										</td>
									</tr>
								</table>
						</div>
					</div>
				</div>
				<!-- end option -->
				<div class="margin-bottom-50"></div>
				<!-- board -->
				<div class="insert_head pull-left">
					<h1 class="insert_title font-main">
						<i class="fa fa-file-o insert_name"></i>상세설명</h1>
				</div>
				<div class="clearfix"></div>
				<div class="row ">
						<div class="col-md-12 insert_box_bg ">
							<div>
								<!-- <form method="" action=""> -->
									<table style="width:100%">
										<tr class="borderline">
											<th>방 제목</th>
											<td><input type="text" id="property_title" name = "property_title"
											 class="form-control rounded pull-width" value = "${select_property.property_title}">
											</td>
										</tr>
										<tr class="borderline">
											<th>방 설명</th>
											<td>
											<textarea type="text" class="pull-width" id="property_text" name = "property_text"
											 style="width: 100%; height: 250px">${select_property.property_text}</textarea>
											</td>
										</tr>
									</table>
							</div>
						</div>
					</div>
	
				<!-- end board -->
				<div class="margin-bottom-50"></div>
				
				<div class="margin-bottom-30"></div>
				<div class="row ">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<button type="submit" class="btn-u btn-block rounded insert_btn">
						매물 정보 변경
						</button>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div><!-- 전체콘테이너 -->
		</div><!-- 중간 맞추기col -->
		<div class="col-md-2"></div>
		</form>
		<!-- 전체 col2 -->
	</div>
	</div>
		<!-- container -->
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
		
	<!-- postcode -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//apis.daum.net/maps/maps3.js?apikey=8af91664dfbd610fb326b81f6ed2ca57&libraries=services"></script>
	<script src="assets/js/postcode.js"></script>
	
</body>
</html>