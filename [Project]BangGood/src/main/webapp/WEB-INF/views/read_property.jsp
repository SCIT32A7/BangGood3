<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:if test = "${not empty result}">
	<script>
		if(confirm('장바구니로 이동하시겠습니까?')){
			location.href = "mypage2";
		}else{
			history.go(-1);
		}
	</script>

</c:if>
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
<!-- graph -->
<script type="text/javascript" src="assets/plugins/jquery/jquery-3.2.0.min.js"></script>
<link rel="stylesheet" href="assets/css/Nwagon.css" type="text/css">
<!-- photo -->
<link rel="stylesheet" href="assets/css/lightbox.min.css" type="text/css">

	<style>
		.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
		.map_wrap {position:relative;width:100%;height:350px;}
		#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
		#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
		#category li.on {background: #eee;}
		#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
		#category li:last-child{margin-right:0;border-right:0;}
		#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
		#category li .category_bg {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
		#category li .bank {background-position: -10px 0;}
		#category li .mart {background-position: -10px -36px;}
		#category li .pharmacy {background-position: -10px -72px;}
		#category li .oil {background-position: -10px -108px;}
		#category li .cafe {background-position: -10px -144px;}
		#category li .store {background-position: -10px -180px;}
		#category li.on .category_bg {background-position-x:-46px;}
		.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
		.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
		.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
		.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
		.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
		.placeinfo .tel {color:#0f7833;}
		.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
	</style>	
</head>
<body id="body" data-spy="scroll" data-target=".one-page-header"
	class="demo-lightbox-gallery font-main">
	<main class="wrapper"> <!-- header --> 
			<div class="view_title_bg">
		<div class="container">
			<div class="col-sm-12 text-center g-mt-40 g-mb-40">
				<h1 class="view_title g-pb-20" style="color:#333">${read_property.property_title}</h1>
			</div>
		</div>
	
	<!--=== End title Part ===-->
	<div class="container">
      
      <div class="container g-mb-30">
         <div class="row">
            <!--=== title left ===-->
            <div class="col-sm-8 view_bg g-mb-30">
            <div class="inner g-mt-30">
              
               <c:forEach var = "pic" items = "${read_picture}">
                   <a href="download?pic_name=${read_picture[0].pic_name}&pic_savename=${read_picture[0].pic_savename}" data-lightbox='roadtrip'>
                     <img style="position: absolute;left:11.5%;" src="download?pic_name=${read_picture[0].pic_name}&pic_savename=${read_picture[0].pic_savename}">
               </a>
               </c:forEach>
              <div class="clearfix"></div>
            </div>
            
            <div class="thumwrap">
               <ul class="gallery">
                  <c:forEach var = "pic" items = "${read_picture}">
                     <li><img src="download?pic_name=${pic.pic_name}&pic_savename=${pic.pic_savename}"></li>
                  </c:forEach>
               </ul>
            </div>
            
         <!--=== title info ===-->
         <div class="clearfix"></div>
               <div class="g-pt-20 g-pb-20 clearfix"></div>
                  <h3 style="font-weight: bold">방정보</h3>
                     <table class="table">
                        <colgroup>
                     <col width="20%">
                     <col width="20%">
                     <col width="20%">
                     <col width="20%">
                     <col width="20%">
                  </colgroup>
                        <tr>
                           <td>보증금/월세</td>
                           <td>방 종류</td>
                           <td>방 크기</td>
                           <td>층</td>
                           <td>건축연도</td>
                        </tr>
                        <tr>
                           <th>${read_property.deposit} 만원 / ${read_property.month_fee} 만원</th>
                           <th>${read_property.property_type}</th>
                           <th>${read_property.roomsize} 제곱미터</th>
                           <th>${read_property.floor} 층</th>
                           <th>${read_property.built_year} 년</th>
                        </tr>
                     </table>
               <div class="g-pt-20"></div>
                  <table class="table">
                        <colgroup>
                     <col width="15%">
                     <col width="35%">
                     <col width="15%">
                     <col width="15%">
                     <col width="15%">
                  </colgroup>
                        <tr>
                           <td>관리비</td>
                           <td>관리비포함항목</td>
                           <td>엘레베이터</td>
                           <td>주차</td>
                           <td>반려동물</td>
                        </tr>
                        <tr>
                           <th>${read_property.maintence_fee} 만원</th>
                           <th>
                              무선인터넷 : <c:if test="${read_maintence.internet == 1}"> O </c:if><c:if test="${read_maintence.internet == 2}"> X </c:if>
                              케이블TV : <c:if test="${read_maintence.tvfee == 1}"> O </c:if><c:if test="${read_maintence.tvfee == 2}"> X </c:if>
                              청소비 : <c:if test="${read_maintence.cleaning == 1}"> O </c:if><c:if test="${read_maintence.cleaning == 2}"> X </c:if><br>
                              수도료 : <c:if test="${read_maintence.waterfee == 1}"> O </c:if><c:if test="${read_maintence.waterfee == 2}"> X </c:if>
                              가스비 : <c:if test="${read_maintence.gasfee == 1}"> O </c:if><c:if test="${read_maintence.gasfee == 2}"> X </c:if>
                              전기세 : <c:if test="${read_maintence.electronic == 1}"> O </c:if><c:if test="${read_maintence.electronic == 2}"> X </c:if>
                           </th>
                           <th><c:if test="${read_option.elevator == 1}"> 있음 </c:if><c:if test="${read_option.elevator == 2}"> 없음 </c:if></th>
                           <th><c:if test="${read_option.car == 1}"> 가능 </c:if><c:if test="${read_option.car == 2}"> 불가 </c:if></th>
                           <th><c:if test="${read_option.pet == 1}"> 가능 </c:if><c:if test="${read_option.pet == 2}"> 불가 </c:if></th>
                        </tr>
                     </table>
               <div class="g-pt-20"></div>
               <h3 style="font-weight: bold">옵션</h3>
                  <ul class="view_option">
                     <c:if test="${read_option.air_conditioner == 1}">
                        <li><img src="assets/img/icon/1.png"><p>에어콘</p></li>
                     </c:if>
                     <c:if test="${read_option.fridge == 1}">
                        <li><img src="assets/img/icon/2.png"><p>냉장고</p></li>
                     </c:if>
                     <c:if test="${read_option.washing_machine == 1}">
                        <li><img src="assets/img/icon/3.png"><p>세탁기</p></li>
                     </c:if>
                     <c:if test="${read_option.gas_stove == 1}">
                        <li><img src="assets/img/icon/4.png"><p>가스레인지</p></li>
                     </c:if>
                     <c:if test="${read_option.electric_stove == 1}">
                        <li><img src="assets/img/icon/5.png"><p>인덕션</p></li>
                     </c:if>
                     <c:if test="${read_option.microwave == 1}">
                        <li><img src="assets/img/icon/6.png"><p>전자렌지</p></li>
                     </c:if>
                     <c:if test="${read_option.desk == 1}">
                        <li><img src="assets/img/icon/7.png"><p>책상</p></li>
                     </c:if>
                     <c:if test="${read_option.rack == 1}">
                        <li><img src="assets/img/icon/8.png"><p>선반</p></li>
                     </c:if>
                     <c:if test="${read_option.bed == 1}">
                        <li><img src="assets/img/icon/9.png"><p>침대</p></li>
                     </c:if>
                     <c:if test="${read_option.closet == 1}">
                        <li><img src="assets/img/icon/10.png"><p>옷장</p></li>
                     </c:if>
                     <c:if test="${read_option.shoecabinet == 1}">
                        <li><img src="assets/img/icon/11.png"><p>신발장</p></li>
                     </c:if>
                     <c:if test="${read_option.doorlock == 1}">
                        <li><img src="assets/img/icon/12.png"><p>도어락</p></li>
                     </c:if>
                     <c:if test="${read_option.wifi == 1}">
                        <li><img src="assets/img/icon/13.png"><p>무선인터넷</p></li>
                     </c:if>
                  </ul>
                <div class="clearfix g-pt-20"></div>
               <h3 style="font-weight: bold">상세설명</h3>
               	<div style="width:100%; border:1px solid #f7be22; border-radius: 4px">
                  <span style="white-space: pre-wrap; ">${read_property.property_text}</span>             
               	</div>
               	<br />
               <h3 id="chartTitle" style="font-weight: bold"></h3>
               <pre id="subTitle"></pre>
               <div id="Nwagon" style="float:left; margin:20px"></div>
               <h3>지역 실제 평균</h3>
                  <span id="avgData" ></span>
                  <div class="full-left">
                     <div ></div>
                     <h3 id="field"></h3>
                        <span id="field_data"></span>
               </div>
               <div class="margin-bottom-30"></div> 
              	<div class="map_wrap">
  				 <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
  				  <ul id="category">
    			    <li id="BK9" data-order="0"> 
   			         <span class="category_bg bank"></span>
       				     은행
   				    </li>       
   				    <li id="MT1" data-order="1"> 
         		   	 <span class="category_bg mart"></span>
     				    마트
    			    </li>  
        			<li id="PM9" data-order="2"> 
          			  <span class="category_bg pharmacy"></span>
         			   약국
     			   </li>  
      		       <li id="OL7" data-order="3"> 
        		     <span class="category_bg oil"></span>
           			 주유소
        		   </li>  
       			   <li id="CE7" data-order="4"> 
            		 <span class="category_bg cafe"></span>
          			  카페
       			   </li>  
       			   <li id="CS2" data-order="5"> 
           			 <span class="category_bg store"></span>
          			  편의점
     			   </li>      
   				 </ul>
				</div>
				<div class="g-pb-30"></div>
								<!-- 댓글 시작 -->
	<div id ="property_reply">	
		<form id = "replyform" action = "insert_propertyReply" method = "post" enctype="multipart/form-data">
			<ul style="list-style: none;" class="pull-width g-mb-20">
				<li><input type = "text" id ="propertyreply_text" name = "propertyreply_text" class="form-control pull-left" style="width:80%"></li>
				<li><input type = "submit" id ="click_reply" class="form-control pull-left btn-u btn-block rounded g-ml-10" value = "댓글입력" style="width:15%"></li>
				<li><input type="file" id = "replyFile" name="replyFile" accept=".gif, .jpg, .png" class="pull-left"></li>
			</ul>
			<input type ="hidden" id = "property_no" name = "property_no" value = "${read_property.property_no}">
		</form>
		<div class="clearfix margin-bottom-20"></div>
		<span id = "replyArea"></span>
	</div>
	
	<!-- 댓글 끝 -->
            </div>
            <!--=== End title left ===-->
            <!--=== title right ===-->
            <div class="col-sm-3 view_bg g-ml-10">
               <div class="g-padding-20">
                  <h3 style="font-weight: bold">${read_property.rent_type} / ${read_property.property_type} <span style="color:#f7be22; font-size:30px; font-weight: normal">${read_property.deposit}/${read_property.month_fee}</span></h3>
                  <p class="g-mb-10">${read_property.address}번지 ${read_property.buildingname} ${read_property.address_detail}</p>
                  
                  <hr>

                  <c:if test= "${loginId != read_property.custid}">
                 	 <c:if test = "${loginId != 'admin'}">
                 		 <p class="g-mb-10">게시자 : <span>${read_property.custid}</span></p>
                  		 <a href="javascript:msg_send()" class="btn-u btn-u-lg btn-block" type="button">메세지보내기</button></a>
                 		 <a href="insert_cart?property_no=${read_property.property_no}" class="btn-u btn-u-lg btn-block" type="button">찜하기</button></a>
                 	 </c:if>
                 	 <c:if test = "${loginId == 'admin'}">
                 	 	<c:if test = "${read_property.isaccessible == 'true'}">
              	  			<button class="btn-u btn-u-lg btn-block">
								<a href="stop_showing_property?property_no=${read_property.property_no}">게시 중지</a>
							</button>
						</c:if>
						<c:if test = "${read_property.isaccessible == 'false'}">
              	  			<button class="btn-u btn-u-lg btn-block">
								<a href="restart_showing_property?property_no=${read_property.property_no}">게시 재시작</a>
							</button>      
						</c:if>        	  
              	  	</c:if>
              	  </c:if>
              	  <c:if test = "${loginId == read_property.custid}">
                 	 <a href="select_property_data?property_no=${read_property.property_no}" class="btn-u btn-u-lg btn-block" type="button">매물 수정</button></a>
                 	 <a href="loadCanvasForUpdate?property_no=${read_property.property_no}" class="btn-u btn-u-lg btn-block" type="button">평면도 변경</button></a>
                 	 <a href="select_property_file?property_no=${read_property.property_no}" class="btn-u btn-u-lg btn-block" type="button">파일 변경</button></a>
                 	 <c:if test = "${read_property.issoldout == 'true'}">
						<button class="btn-u btn-u-lg btn-block">
							<a href="javascript:check_stopShowing(${read_property.property_no})">게시 중지</a>
						</button>
					 </c:if>
					 <c:if test = "${read_property.issoldout == 'false'}">
						<button class="btn-u btn-u-lg btn-block">
							<a href="javascript:check_restartShowing(${read_property.property_no})">게시 재시작</a>
						</button>
					 </c:if>
					 <button class="btn-u btn-u-lg btn-block">
						<a href="contract_property?property_no=${read_property.property_no}">가계약서 출력</a>
					 </button>
              	  </c:if>
              	 
               </div>
            </div>
				<!--=== End title right ===-->

			</div>
		</div>
	</div>
	</div>
	<div class="clearfix"></div>
	<!--=== End Content Part ===-->
	</main>
	
	
	
	
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
	<!-- graph -->
	<script type="text/javascript" src="assets/js/radar.js"></script>
	<script type="text/javascript" src="assets/js/Nwagon.js"></script>
	<!-- photo -->
	<script type="text/javascript" src="assets/js/lightbox-plus-jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.form.js"></script>
	
	<script type="text/javascript"
      src="//apis.daum.net/maps/maps3.js?apikey=8af91664dfbd610fb326b81f6ed2ca57&libraries=services"></script>
	
	<script>	
	var id = "${loginId}";
	var property_no = "${read_property.property_no}";
	var selectedRadar;
	var avgRadar;
	var percentRadar;
	var maxRadar;
	var minRadar;
	var searchArea;
	var roomNoTotal;
	
	// 그래프 자료 받아오기
 	window.onload = function () {
		$.ajax({
			method:"get",
			url:"loadChart",
			async: false,
			data: {"property_no" : property_no},
			success: function(map) {
				getRadarChartData(map, "${read_property.rent_type}", "${read_property.property_type}");
			},
			error: function() {
				console.log("비교 분석 차트 조회 실패");
			}
		});
	} 
	
	
	// 댓글 관련 메소드  
	// 화면 뜨자마자 댓글 리스트 불러오기
	$(function(){
		$("#click_reply").on('click', insert_reply);
		init();		
	})
	
	// 댓글리스트 받기
	function init() {
		$.ajax({
			method : "post",
			url : "get_propertyReply",
			dataType : "json",
			data : {			
				"property_no" : property_no
			},
			success : output
		});
	}
	
	// 댓글 리스트 출력 함수
	function output(resp) {
	var data = '<table class="g-mb-20">';
	$.each(resp, function(index, item){
		data += '<tr class="reviewtr">';
		data += '	<td class="name" style="padding-right:30px;">' + item.custid + '</td>';
		data += '	<td class="text" style="width:100%; "><a href="reply_download?pic_name='+item.pic_name+'&pic_savename='+item.pic_savename+'" data-lightbox="reply"><img src="reply_download?pic_name='+item.pic_name+'&pic_savename='+item.pic_savename+'" width="80" height="80" style="margin-right:10px;"></a>' + item.propertyreply_text+'</td>';
		data += '	<td class="regdate text-right">' + item.propertyreply_inputdate + '</td>';
		data += '	<td><input type="button" class="delbtn btn-u btn-block rounded g-mb-5" style="background-color:#f7be22";" reply_id="'+item.custid+'" reply_no="'+item.property_reply_no+'"value="삭제" /></td>';
		data += '</tr>';
	});
		data += '</table>';	
		$("#replyArea").html(data);
		$(".delbtn").on('click', replyDel);
		$("#propertyreply_text").val("");
		$("#replyFile").val("");
	}

	// 댓글입력 함수	
	function insert_reply(){	
		var replytext = $("#propertyreply_text").val();
		if(replytext.length == 0){
			alert('댓글을 입력해주세요');
			return false;
		}		
		if(confirm('댓글을 입력하시겠습니까?')){			
			$("#replyform").ajaxForm({
				async : false,
				success : function(resp){
					init();			
				}
			});
		}else{
			$("#propertyreply_text").val("");
			$("#replyFile").val("");
		}
	}
	
	//댓글 삭제 함수
	function replyDel(){
		var reply_id = $(this).attr("reply_id");
		if(id != reply_id){
			alert('작성자만 삭제 가능합니다.')
			return false;
		}		
		var replynum = $(this).attr("reply_no");
		$.ajax({
			method : "post",
			url : "delete_propertyReply",
			data : {
				"property_reply_no" : replynum,
				"property_no" : property_no
			},
			async : false,
			success : init()
		});
	}	
	
 	
	// 사진 확대 및 전환을 위한 메소드
	$(function(){		
	var gal;
    var galout;
		$(".gallery li img").on('click', function() {
			gal = $(this).attr("src");
			$(this).html(function(index, html) {
				galout = "<a href='"+gal+"' data-lightbox='roadtrip'><img src='"+gal+"' data-lightbox='roadtrip'/></a>";
				$(".inner").html(galout);
			});
		});

	});
	
 	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이
	var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수
	 
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 5 // 지도의 확대 레벨
	    }; 

	// 지도를 생성    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	var address = "${read_property.address}";
	// 주소로 좌표를 검색
	geocoder.addr2coord(address, function(status, result) {
	    // 정상적으로 검색이 완료 시
	     if (status === daum.maps.services.Status.OK) {
	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	        // 지도의 중심을 결과값으로 받은 위치로 이동
	        var marker = new daum.maps.Marker({
            map: map,
            position: coords
      	   });	        
	        map.setCenter(coords);
	    } 
	}); 	
	
	// 장소 검색 객체를 생성
	var ps = new daum.maps.services.Places(map); 
	// 지도에 idle 이벤트를 등록
	daum.maps.event.addListener(map, 'idle', searchPlaces);
	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가
	contentNode.className = 'placeinfo_wrap';
	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록
	addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);
	// 커스텀 오버레이 컨텐츠를 설정
	placeOverlay.setContent(contentNode);  
	// 각 카테고리에 클릭 이벤트를 등록
	addCategoryClickEvent();
	// 엘리먼트에 이벤트 핸들러를 등록하는 함수
	function addEventHandle(target, type, callback) {
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}

	// 카테고리 검색을 요청하는 함수
	function searchPlaces() {
	    if (!currCategory) {
	        return;
	    }
		 // 커스텀 오버레이를숨기기
	    placeOverlay.setMap(null);
		// 지도에 표시되고 있는 마커를 제거
	    removeMarker();	    
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수
	function placesSearchCB( status, data, pagination ) {
	    if (status === daum.maps.services.Status.OK) {
	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	        displayPlaces(data.places);
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
	        // 검색결과가 없는경우
	    } else if (status === daum.maps.services.Status.ERROR) {
	        // 에러로 인해 검색결과가 나오지 않은 경우	        
	    }
	}

	// 지도에 마커를 표출하는 함수
	function displayPlaces(places) {
	    // 몇번째 카테고리가 선택되어 있는지 받는다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용
	    var order = document.getElementById(currCategory).getAttribute('data-order');
	    for ( var i=0; i<places.length; i++ ) {
	            // 마커를 생성하고 지도에 표시
	            var marker = addMarker(new daum.maps.LatLng(places[i].latitude, places[i].longitude), order);
	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록
	            (function(marker, place) {
	                daum.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
	    }
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수
	function addMarker(position, order) {
	    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지
	        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	    marker.setMap(map); // 지도 위에 마커 표출
	    markers.push(marker);  // 배열에 생성된 마커 추가합
	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.placeUrl + '" target="_blank" title="' + place.title + '">' + place.title + '</a>';   
	    if (place.newAddress) {
	        content += '    <span title="' + place.newAddress + '">' + place.newAddress + '</span>' +
	                    '  <span class="jibun" title="' + place.address + '">(지번 : ' + place.address + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address + '">' + place.address + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';
	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new daum.maps.LatLng(place.latitude, place.longitude));
	    placeOverlay.setMap(map);  
	}

	// 각 카테고리에 클릭 이벤트를 등록
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;
	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}

	// 카테고리를 클릭했을 때 호출되는 함수
	function onClickCategory() {
	    var id = this.id,
	        className = this.className;
	    placeOverlay.setMap(null);
	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}

	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;
	    for ( i=0; i<children.length; i++ ) {
	        children[i].className = '';
	    }
	    if (el) {
	        el.className = 'on';
	    } 
	} 
	
	//메시지 창 열기
	function msg_send() {
		  window.open("message_send?sender="+${read_property.custid}, "", 'titlebar=no, scrollbars=yes, toolbar=no, location=no, resizable=no, status=no, menubar=yes, width=350, height=400, left=30%, top=40%');
	};

	// 광고 중단 여부 재확인 메소드
	function check_stopShowing(num){
		if(confirm('해당 매물의 광고를 중단하시겠습니까?')){
			location.href = "stop_showing?property_no="+num;
		}
	}
	
	
	// 광고 개시 여부 재확인 메소드
	function check_restartShowing(num){
		if(confirm('해당 매물의 광고를 다시 시작하시겠습니까?')){
			location.href = "restart_showing?property_no="+num;
		}
	};

	</script>
</body>
</html>