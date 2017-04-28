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

	<div class="container-fluid content view_title_bg">
		<div class="row">
		<div class="col-md-2"></div>
		<form action = "insert_property" method = "post">
		<div class="col-md-8">
			<div class="headline">
				<h2 style="font-size: 28px;">방 등록</h2>
				<div class="pull-right">
					<h1>Step1</h1>
				</div>
			</div>
			<!-- place -->
			<div class="container-fluid g-pt-30 ">
				<div class="insert_head pull-left">
					<h1 class="insert_title font-main">
						<i class="fa fa-map-marker insert_name"></i>위치정보
					</h1>
				</div>
				<div class="clearfix"></div>
				<div class="row">
					<div class="col-md-12  insert_box_bg">
						<div>
							<!-- <form method="" action=""> -->
								<table>
										<colgroup>
											<col style="width:15%">
											<col>
											<col style="width:22%">
										</colgroup>
									<tr class="borderline" style="font-size:10px;">
										<th>주소</th>
										<td>
										
										<div class="g-mb-30">
										<input type="button" onclick="sample5_execDaumPostcode()" class="btn-u btn-block rounded insert_btn" 
										value="주소검색" style="width:105px; margin-left:5px; float:left;height:35px;">
										<h4 class="insert_label" style="font-size:14px;">검색버튼을 눌러주세요.</h4>										
										</div>
										<input type="text" id="sample5_roadAddress" class="form-control rounded g-mb-5" readonly="readonly">
										<input type="text" id="sample5_jibunAddress" name = "address" class="form-control rounded  g-mb-10" readonly="readonly">
										<input type="text" class="form-control rounded" name = "address_detail" style="height:75px;" placeholder="상세주소를 입력해주세요." required="required">
										
										</td>
										<td>
										<img id="coverimg" src="assets/img/blank.png">
										<div id="map" style="width:300px;height:250px;margin-top:10px;display:none">
										</div>
										</td>
									</tr>
								</table>
							<!-- </form> -->
						</div>
					</div>
				</div>
				<!-- end place -->
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
							<!-- 	<form method="" action=""> -->
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
												<input type="radio" id="oneroom" name="property_type" value = "oneroom">
												<label for="oneroom" >원룸</label>
												<input type="radio" id="tworoom" name="property_type" value = "tworoom">
												<label for="tworoom" >투룸</label>
											</td>
										</tr>
										<tr class="borderline">
											<th>매물 종류</th>
											<td colspan="3">
											<input type="radio" id="rent_type1" name="rent_type" value = "year_rent">
											<label for="rent_type1">전세</label>
											<input type="radio" id="rent_type2" name="rent_type" value = "month_rent" style="position:relative; top:6px">
											<label for="rent_type2">월세</label>
											</td>
										</tr>
										<tr class="borderline">
											<th>보증금 <br>/ 전세금</th>
											<td style="border-right: 1px solid #f7b70b">
											<input type="text" name = "deposit" id = "deposit" class="form-control rounded pull-left" style="width: 150px;"> 
											<b class="insert_label2">만원</b>
											</td>
											<th style="padding-left: 18px">월세</th>
											<td><input type="text" name ="month_fee" id = "month_fee" class="form-control rounded pull-left" style="width: 150px">
												<b class="insert_label2">만원</b>
											</td>
										</tr>
										<tr class="borderline">
											<th>건물층수</th>
											<td style="border-right: 1px solid #f7b70b">
											<select id="floor" name = "floor" class="form-control" style="">
													<option value = "-1">반지하</option>
													<option value = "1" selected="selected">1층</option>
													<option value = "2">2층</option>
													<option value = "3">3층</option>
													<option value = "4">4층</option>
													<option value = "5">5층</option>
													<option value = "6">6층</option>
													<option value = "7">7층</option>
													<option value = "8">8층</option>
													<option value = "9">9층</option>
													<option value = "10">10층 이상</option>
											</select></td>
											<th style="padding-left: 18px">면적</th>
											<td><input type="text" name ="roomsize" id = "roomsize" class="form-control rounded pull-left" style="width: 150px">
												<b class="insert_label2">평</b>
											</td>
										</tr>
										<tr class="borderline">
											<th>건축연도</th>
											<td  style="border-right: 1px solid #f7b70b">
											<input type="text" name = "built_year" id = "built_year" class="form-control rounded pull-left" style="width: 150px;"> 
											<b class="insert_label2">년</b>
											</td>
											<th style="padding-left: 18px">건물명</th>
											<td><input type="text" name ="buildingname" id = "buildingname" class="form-control rounded pull-left" style="width: 150px">
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
							<!-- <form method="" action=""> -->
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
										<input type="text" id = "maintence_fee" name = "maintence_fee" class="form-control rounded pull-left" style="width: 150px">
										<b class="insert_label2">만원</b>
										</td>
									</tr>
									<tr class="borderline">
										<td colspan="3">
											<input type="checkbox" name="internet" value="1" id="internet">
											<label for="internet">인터넷</label>
											 
											<input type="checkbox" name="tvfee" value="1" id="tvfee">
											<label for="tvfee">케이블</label>
											
											<input type="checkbox" name="cleaning" value="1" id="cleaning">
											<label for="cleaning">청소비</label>
											
											<input type="checkbox" name="waterfee" value="1" id="waterfee">
											<label for="waterfee">수도세</label>
											
											<input type="checkbox" name="gasfee" value="1" id="gasfee">
											<label for="gasfee">가스비</label>
											
											<input type="checkbox" name="electronic" value="1" id="electronic">
											<label for="electronic">전기세</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>주차여부</th>
										<td colspan="3">
											<input type="radio" name="car" value = "1" id="car1">
											<label for="car1">가능</label>
											<input type="radio" name="car" value = "2" id="car2">
											<label for="car2">불가능</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>엘레베이터</th>
										<td colspan="3">
											<input type="radio" id="elevator" name="elevator" value = "1" >
											<label for="elevator">있음</label>
											<input type="radio" id="elevator1" name="elevator" value = "2" >
											<label for="elevator1">없음</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>반려동물</th>
										<td colspan="3">
											<input type="radio" id="pet" name="pet" value = "1" >
											<label for="pet">가능</label>
											<input type="radio" id="pet1" name="pet" value = "2" >
											<label for="pet1">불가능</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>옵션항목</th>
										<td colspan="3">
											<input type="checkbox" id="air_conditioner" name="air_conditioner" value="1" >
											<label for="air_conditioner">에어콘</label>
											<input type="checkbox" id="fridge" name="fridge" value="1" >
											<label for="fridge">냉장고</label>
											<input type="checkbox" id="washing_machine" name="washing_machine" value="1" >
											<label for="washing_machine">세탁기</label>
											<input type="checkbox" id="gas_stove" name="gas_stove" value="1" >
											<label for="gas_stove">가스레인지</label>
											<input type="checkbox" id="electric_stove" name="electric_stove" value="1" >
											<label for="electric_stove">인덕션</label>
											<input type="checkbox" id="microwave" name="microwave" value="1" >
											<label for="microwave">전자레인지</label>
											<br>
											<input type="checkbox" id="desk" name="desk" value="1" >
											<label for="desk">책상</label>
											<input type="checkbox" id="rack" name="rack" value="1" >
											<label for="rack">선반</label>
											<input type="checkbox" id="bed" name="bed" value="1" >
											<label for="bed">침대</label>
											<input type="checkbox" id="closet" name="closet" value="1" >
											<label for="closet">옷장</label>
											<input type="checkbox" id="shoecabinet" name="shoecabinet" value="1" >
											<label for="shoecabinet">신발장</label>
											<input type="checkbox" id="doorlock" name="doorlock" value="1" >
											<label for="doorlock">도어락</label>
											<input type="checkbox" id="wifi" name="wifi" value="1" >
											<label for="wifi">무선인터넷</label>
										</td>
									</tr>
								</table>
							<!-- </form> -->
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
											<td><input type="text" id="property_title" name = "property_title" class="form-control rounded pull-width" placeholder="예) 코엑스 5분거리 살기좋은 곳입니다.">
											</td>
										</tr>
										<tr class="borderline">
											<th>방 설명</th>
											<td>
											<textarea type="text" class="pull-width" id="property_text" name = "property_text" style="width: 100%; height: 250px" placeholder="방에 대한 설명을 써주세요."></textarea>
											</td>
										</tr>
									</table>
								<!-- </form> -->
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
						다음단계
						</button>
					</div>
					<div class="col-md-4">
						<button class="btn-u btn-block rounded insert_btn" style="background-color:#ccc" onClick = "location.href='./'">
						돌아가기
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
	<!-- footer -->
	<%@ include file="footer.jsp"%> 
	<!-- end footer -->
		<!-- container -->
	</main>
	
	<!-- JS Global Compulsory -->
	<script src="assets/plugins/jquery/jquery.min.js"></script>
		<script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
		<!-- JS Implementing Plugins -->
		<script src="assets/plugins/pace/pace.min.js"></script>
		<script src="assets/plugins/modernizr.js"></script><!-- 브라우저 호환성 -->
		<script src="assets/plugins/backstretch/jquery.backstretch.min.js"></script>
		<!-- JS Page Level-->
		<script src="assets/js/one.app.js"></script>
		<!-- custom -->
		<script src="assets/js/custom.js"></script>
	
</body>
</html>