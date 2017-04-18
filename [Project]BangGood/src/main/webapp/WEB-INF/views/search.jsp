<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>

<!-- JS Global Compulsory -->
<script src="assets/plugins/jquery/jquery.min.js"></script>
<script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
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
<link href='https://fonts.googleapis.com/css?family=Niconne'
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
<style type="text/css">
.searchbox2 {
	background-color: rgba(247, 190, 34, 0.5);
	position: absolute;
	top: 50%;
	left: 9%;
	z-index: 100;
	width: 300px;
	height: 190px;
	padding: 10px;
}




.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}


</style>


</head>

<body id="body" data-spy="scroll" data-target=".one-page-header"
	class="demo-lightbox-gallery font-main promo-padding-top">
	<main class="wrapper"> <!-- header --> 
	<%@ include	file="header.jsp"%> <!-- end header --> 
	<!-- menu -->
	<%@ include file="join.jsp"%>
	<%@ include	file="join2.jsp"%>
	<%@ include	file="join3.jsp"%>
	<%@ include	file="login.jsp"%>
	<!-- end menu -->
	<!-- searchbox -->
	<div id="searchbox" class="g-mt-10 pull-width"
		style="border-top: 1px solid #333; height: 50px;">
		<input id="addresstext" name="searchText"> 
		<input id = "searchaddresscenter_button" type="button" value="찾기">
	</div>
	<!-- end searchbox -->

	<div id="map" style="width: 100%; height: 800px;"></div>


	<!-- searchbox2 -->
	<div class="searchbox2">
		<input id="addresstext" name="searchText"> 
		<input type="button" id ="searchaddress_button" value="찾기">
	</div>
	<!-- end searchbox2 --> </main>

	<!-- 자동완성 -->
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<style>
	
		.ui-autocomplete {
			max-height: 100px;
			overflow-y: auto;
			/* prevent horizontal scrollbar */
			overflow-x: hidden;
		}
		/* IE 6 doesn't support max-height
 		  * we use height instead, but this forces the menu to always be this tall
  		 */
		* html .ui-autocomplete {
			height: 100px;
		}
	</style>
	<script src="assets/plugins/jquery/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- google map -->
	<script type="text/javascript"
		src="//apis.daum.net/maps/maps3.js?apikey=8af91664dfbd610fb326b81f6ed2ca57&libraries=services"></script>
	
	<script type="text/javascript">		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new daum.maps.LatLng(37.584556360279436,
					126.98217957940335), //지도의 중심좌표.
			level : 5 //지도의 레벨(확대, 축소 정도)
		};

		var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴	
		var imageSrc = "assets/img/maker.png", // 마커이미지의 주소입니다    
	   	  imageSize = new daum.maps.Size(32, 35), // 마커이미지의 크기입니다
	  	  imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption)
		
		var markers = []; //마커 생성을 위한 전역변수
		
		var text; // 주소 검색을 위한 전역변수		
		var address = $("#addresstext"); // 동주소 검색용 전역변수
		
		// 조건 검색용 전역변수
		var searchaddress = "서울 종로";
		var property_type = "all";
		var rent_type = "all";
		var deposit1 = 0;
		var deposit2 = 999999;
		var month_fee1 = 0;
		var month_fee2 = 9999;
		var floor = 0;
		var maintence_fee = "all";
		var newbuild = "all";
		var pet = 0;
		var car = 0;
		var elevator = 0;
		var air_conditioner = 0;
		var fridge = 0;
		var washing_machine = 0;
		var gas_stove = 0;
		var electric_stove = 0;
		var microwave = 0;
		var desk = 0;
		var rack = 0;
		var bed = 0;
		var closet = 0;
		var shoecabinet = 0;
		var doorlock = 0;
		var wifi = 0;	
		
		
		$(function() {
			send_data();
		});
		
	
		$(function() {			
			// 주소 자동 완성을 위한 메소드
			text = $("#addresstext");
			var array;
			$("#addresstext").keyup(function() {
				$.ajax({
					method : "get",
					url : "search_point",
					data : {
						"searchText" : text.val()
					},
					success : function(resp) {
						array = resp;
						$("#addresstext").autocomplete({
							source : resp
						})
					}
				});
			});		
			
			// 검색한 동의 중심좌표를 구하기 위한 메소드
			$("#searchaddresscenter_button").click(function(){
				searchaddress = $("#addresstext").val();
				$.ajax({
					method : "get",
					url : "search_town",
					data : {
						"searchaddress" : searchaddress
					},
					success : function(resp) {
						set_center(resp.position_address); // 찾은 좌표로 중심 이동
						setMarkers(null);	// 기존 마커 제거
						send_data();
					}
				});
			});
			
		    $("input[name=searchText]").keydown(function (key) {		    	 
		        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
		        	searchaddress = $("#addresstext").val();
					$.ajax({
						method : "get",
						url : "search_town",
						data : {
							"searchaddress" : searchaddress
						},
						success : function(resp) {
							set_center(resp.position_address); // 찾은 좌표로 중심 이동
							setMarkers(null);	// 기존 마커 제거
							send_data();
						}
					});		     	
		        }		 
		    });
		})
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();
		
		function set_center(search_town){
			geocoder.addr2coord(search_town, function(status, result) {
				// 정상적으로 검색이 완료됐으면 
				if (status === daum.maps.services.Status.OK) {
					var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});
		}

		
		// 검색 조건을 서버에 보내는 메소드
		function send_data(){
			$.ajax({
				method : "POST",
				url : "intoMap",
				data : {
					"searchaddress" : searchaddress,
					"property_type" : property_type,
					"rent_type" : rent_type,
					"deposit1" : deposit1,
					"deposit2" : deposit2,
					"month_fee1" : month_fee1,
					"month_fee2" : month_fee2,
					"floor" : floor,
					"maintence_fee" : maintence_fee,
					"newbuild" : newbuild,
					"pet" : pet,
					"car" : car,
					"elevator" : elevator,
					"air_conditioner" : air_conditioner,
					"fridge" : fridge,
					"washing_machine" : washing_machine,
					"gas_stove" : gas_stove,
					"electric_stove" : electric_stove,
					"microwave" : microwave,
					"desk" : desk,
					"rack" : rack,
					"bed" : bed,
					"closet" : closet,
					"shoecabinet" : shoecabinet,
					"doorlock" : doorlock,
					"wifi" : wifi
				},
				success : function(resp) {
					address = resp;
					output(address);
				},
				
				error : function() {
					console.log("33");
				}
			});
		}
		
		var content; // 오버레이 태그 내용
		var overlay; // 오버레이 전역변수
		// 검색될 매물을 마커로 표시
		function output(addre) {			
		
			for (var index in addre) {		
				
				///console.log(add);
				// 주소로 좌표를 검색합니다
				geocoder.addr2coord(addre[index], function(status, result) {
				// 정상적으로 검색이 완료됐으면 
				if (status === daum.maps.services.Status.OK) {

					var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new daum.maps.Marker({
						map : map,
						position : coords,
						image : markerImage,
						clickable : true
					});

					marker.setMap(map);
					markers.push(marker);

					//console.log(JSON.stringify(result));
					//var iwContent = "<div style='padding:5px;'>"+result.addr[0].newAddress+"<br>"+result.addr[0].title+"</div>"; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					
					var property_map;  // 전송받는 매물 정보를 담을 변수		
					
					daum.maps.event.addListener(marker, 'click', function(mouseEvent) {
						searchDetailAddrFromCoords(coords, function(status, result) {
						if (status === daum.maps.services.Status.OK) {
							console.log(JSON.stringify(result));
							
							$.ajax({
								method : "POST",
								url : "read_property_map",
								data : {
									"address" : result[0].jibunAddress.name
								},
								success : function(resp) {
										
										property_map = resp;					
										content = '<div class="wrap">';
										content +=	'<div class="info">';
										content +=		'<div class="title">';
										content +=			property_map.property_title
										content +=			'<div class="close" onclick="closeOverlay()" title="X"></div>';
										content +=		'</div>';
										content +=		'<div class="body">'
										content +=			'<div class="img">';
										content +=				'<img src="download?pic_name='+property_map.pic_name+'&pic_savename='+property_map.pic_savename+'" width="73" height="71">';
										content +=			'</div>';
										content +=			'<div class="desc">';
										content +=				'<div class="ellipsis">'+property_map.rent_type +'</div>';
										content +=				'<div class="jibun ellipsis">'+property_map.deposit+'/'+property_map.month_fee+'</div>';
										content +=				'<div><a href="" target="_blank" class="link">내용보기</a></div>';
										content +=			'</div>';						
										content +=		'</div>';
										content +=	 '</div>';
										content += '</div>';
										
										overlay = new daum.maps.CustomOverlay({
										    content: content,
										    map: map,
										    position: marker.getPosition()       
										});
										
										overlay.setMap(map);
										// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
										//infowindow.setContent(content);
										//infowindow.open(map, marker);
								}
							});
						}
						});
					});
					}
					function searchDetailAddrFromCoords(coords, callback) {
					// 좌표로 법정동 상세 주소 정보를 요청합니다
						geocoder.coord2detailaddr(coords,callback);
					}			     
				});			
			}			
		}
	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
		overlay.setMap(null);
	}
		
		
	// 지도에 나타난 마커를 지우는 함수
	function setMarkers(map) {			
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}            
	}
	</script>
	<!-- custom -->


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
	<script src="assets/js/plugins/cube-portfolio.js"></script>
	<script src="assets/js/forms/contact.js"></script>
	<script src="assets/js/plugins/promo.js"></script>

	<!-- custom -->
	<script src="assets/js/custom.js"></script>

</body>
</html>