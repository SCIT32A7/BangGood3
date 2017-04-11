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
							<form method="" action="">
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
										<label class="insert_label" style="font-size:12px">검색버튼을 눌러주세요.</label>										
										</div>
										<input type="text" id="sample5_roadAddress" class="form-control rounded g-mb-5" readonly="readonly">
										<input type="text" id="sample5_jibunAddress" class="form-control rounded  g-mb-10" readonly="readonly">
										<input type="text" class="form-control rounded" style="height:75px;" placeholder="상세주소를 입력해주세요." required="required">
										
										</td>
										<td>
										<img id="coverimg" src="assets/img/main/img22.jpg" style="width:300px; height:250px;">
										<div id="map" style="width:300px;height:250px;margin-top:10px;display:none">
										</div>
										</td>
									</tr>
								</table>
							</form>
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
								<form method="" action="">
									<table style="width:100%">
										<colgroup>
											<col style="width:15%">
											<col style="width:35%">
											<col style="width:15%">
											<col style="width:35%">
										</colgroup>
										<tr class="borderline">
											<th>매물 종류</th>
											<td colspan="3">
												<input type="radio" name="property_tpye" style="position:relative; top:6px"><label class="insert_label">원룸</label>
												<input type="radio" name="property_tpye" style="position:relative; top:6px"><label class="insert_label" >투룸</label>
												<input type="radio" name="property_tpye" style="position:relative; top:6px"><label class="insert_label">오피스텔</label>
												<input type="radio" name="property_tpye" style="position:relative; top:6px"><label class="insert_label">아파트</label>
											</td>
										</tr>
										<tr class="borderline">
											<th>방 종류</th>
											<td colspan="3">
											<input type="radio" name="rent_type"style="position:relative; top:6px">
											<label class="insert_label">전세</label>
											<input type="radio" name="rent_type"style="position:relative; top:6px">
											<label class="insert_label">월세</label>
											</td>
										</tr>
										<tr class="borderline">
											<th>보증금 <br>/ 전세금</th>
										<td colspan="3">
										<input type="text" class="form-control rounded pull-left" style="width: 150px;"> 
										<label class="insert_label">만원</label>
										</td>
										</tr>
										<tr class="borderline">
											<th>건물층수</th>
											<td style="border-right: 1px solid #f7b70b">
											<select id="" class="form-control" style="">
													<option>반지하</option>
													<option selected="selected">1층</option>
													<option>2층</option>
													<option>3층</option>
													<option>4층</option>
													<option>5층</option>
													<option>6층 이상</option>

											</select></td>
											<th style="padding-left: 18px">면적</th>
											<td><input type="text" class="form-control rounded pull-left" style="width: 150px">
												<label class="insert_label">평</label>
											</td>
										</tr>
									</table>
								</form>
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
							<form method="" action="">
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
										<input type="text" class="form-control rounded pull-left" style="width: 150px">
										<label class="insert_label">만원</label>
										</td>
									</tr>
									<tr class="borderline">
										<td colspan="3">
											<input type="checkbox" name="maintence" value="internet" style="position:relative; top:6px">
											<label class="insert_label">인터넷</label>
											<input type="checkbox" name="maintence" value="tvfee" style="position:relative; top:6px">
											<label class="insert_label">케이블</label>
											<input type="checkbox" name="maintence" value="cleaning" style="position:relative; top:6px">
											<label class="insert_label">청소비</label>
											<input type="checkbox" name="maintence" value="waterfee" style="position:relative; top:6px">
											<label class="insert_label">수도세</label>
											<input type="checkbox" name="maintence" value="gasfee" style="position:relative; top:6px">
											<label class="insert_label">가스비</label>
											<input type="checkbox" name="maintence" value="electronic" style="position:relative; top:6px">
											<label class="insert_label">전기세</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>주차여부</th>
										<td colspan="3">
											<input type="radio" name="rent_type"style="position:relative; top:6px">
											<label class="insert_label">가능</label>
											<input type="radio" name="rent_type"style="position:relative; top:6px">
											<label class="insert_label">불가능</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>엘레베이터</th>
										<td colspan="3">
											<input type="radio" name="rent_type"style="position:relative; top:6px">
											<label class="insert_label">있음</label>
											<input type="radio" name="rent_type"style="position:relative; top:6px">
											<label class="insert_label">없음</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>반려동물</th>
										<td colspan="3">
											<input type="radio" name="rent_type"style="position:relative; top:6px">
											<label class="insert_label">가능</label>
											<input type="radio" name="rent_type"style="position:relative; top:6px">
											<label class="insert_label">불가능</label>
										</td>
									</tr>
									<tr class="borderline">
										<th>옵션항목</th>
										<td colspan="3">
											<input type="checkbox" name="option" value="air_conditioner" style="position:relative; top:6px">
											<label class="insert_label">에어콘</label>
											<input type="checkbox" name="option" value="fridge" style="position:relative; top:6px">
											<label class="insert_label">냉장고</label>
											<input type="checkbox" name="option" value="washing_machine" style="position:relative; top:6px">
											<label class="insert_label">세탁기</label>
											<input type="checkbox" name="option" value="gas_stove" style="position:relative; top:6px">
											<label class="insert_label">가스레인지</label>
											<input type="checkbox" name="option" value="electric_stove" style="position:relative; top:6px">
											<label class="insert_label">인덕션</label>
											<input type="checkbox" name="option" value="microwave" style="position:relative; top:6px">
											<label class="insert_label">전자레인지</label>
											<br>
											<input type="checkbox" name="option" value="desk" style="position:relative; top:6px">
											<label class="insert_label">책상</label>
											<input type="checkbox" name="option" value="rack" style="position:relative; top:6px">
											<label class="insert_label">선반</label>
											<input type="checkbox" name="option" value="bed" style="position:relative; top:6px">
											<label class="insert_label">침대</label>
											<input type="checkbox" name="option" value="closet" style="position:relative; top:6px">
											<label class="insert_label">옷장</label>
											<input type="checkbox" name="option" value="shoecabinet" style="position:relative; top:6px">
											<label class="insert_label">신발장</label>
											<input type="checkbox" name="option" value="doorlock" style="position:relative; top:6px">
											<label class="insert_label">도어락</label>
											<input type="checkbox" name="option" value="wifi" style="position:relative; top:6px">
											<label class="insert_label">무선인터넷</label>
										</td>
									</tr>
								</table>
							</form>
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
								<form method="" action="">
									<table style="width:100%">
										<tr class="borderline">
											<th>방 제목</th>
											<td><input type="text" id="board_title" class="form-control rounded pull-width" placeholder="예) 코엑스 5분거리 살기좋은 곳입니다.">
											</td>
										</tr>
										<tr class="borderline">
											<th>방 설명</th>
											<td>
											<textarea type="text" class="pull-width" id = "searchtext" style="width: 100%; height: 250px" placeholder="방에 대한 설명을 써주세요."></textarea>
											</td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</div>
				<!-- end board -->
				<div class="margin-bottom-50"></div>
				<!--  picture -->
				<div class="insert_head pull-left">
					<h1 class="insert_title font-main">
						<i class="fa fa-file-o insert_name"></i>사진 업로드
					</h1>
				</div>
				<div class="clearfix"></div>
				<div class="row ">
						<div class="col-md-12 insert_box_bg ">
							<div style="width:100px; height:350px">
							<button type="" class="btn-u btn-block rounded insert_btn"
							style="">
							사진등록
							</button>
							</div>
						</div>
					</div>
				<!--  end picture -->
				
				<div class="margin-bottom-30"></div>
				<div class="row ">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<button type="submit" class="btn-u btn-block rounded insert_btn">
						다음단계
						</button>
					</div>
					<div class="col-md-4">
						<button class="btn-u btn-block rounded insert_btn" style="background-color:#ccc">
						돌아가기
						</button>
					</div>
					<div class="col-md-2"></div>
				</div>
			</div><!-- 전체콘테이너 -->
		</div><!-- 중간 맞추기col -->
		<div class="col-md-2"></div>
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