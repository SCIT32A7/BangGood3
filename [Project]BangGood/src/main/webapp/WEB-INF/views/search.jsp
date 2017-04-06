<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> 
<html lang="en"> <!--<![endif]-->
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
		<link href='https://fonts.googleapis.com/css?family=Ek+Mukta:400,600,700' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Niconne' rel='stylesheet' type='text/css'>
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

<body id="body" data-spy="scroll" data-target=".one-page-header" class="demo-lightbox-gallery font-main promo-padding-top">
	<main class="wrapper">
		<!-- header -->
			<%@ include file="header.jsp"%> 
			<!-- end header -->
			<!-- menu -->
			<%@ include file="join.jsp"  %> 
			<%@ include file="join2.jsp"  %> 
			<%@ include file="join3.jsp"  %> 
			<%@ include file="login.jsp" %> 
			<!-- end menu -->
		<div id="map" style="width: 100%; height: 800px;"></div>
		
	</main>

<!-- google map -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8af91664dfbd610fb326b81f6ed2ca57&libraries=services"></script>
<script type="text/javascript">
   var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
   var options = { //지도를 생성할 때 필요한 기본 옵션
      center : new daum.maps.LatLng(37.584556360279436, 126.98217957940335), //지도의 중심좌표.
      level : 5
   //지도의 레벨(확대, 축소 정도)
   };

   var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
   
	// 주소-좌표 변환 객체를 생성합니다
   var geocoder = new daum.maps.services.Geocoder();

   var address;
   $(function() {
      $.ajax({
         method : "POST",
         url : "intoMap",
         success : function(resp) {
           address = resp;
           output(address);
         },
         error : function() {
            console.log("33");
         }
      });
   });


   function output(addre){	
   	for (var index in addre) {
   		//add = addre[index];
   		///console.log(add);
   	// 주소로 좌표를 검색합니다
    	geocoder.addr2coord(addre[index].address+" "+addre[index].address_detail, function(status, result) {
   		
   	    // 정상적으로 검색이 완료됐으면 
   	     if (status === daum.maps.services.Status.OK) {

   	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
           
   	        // 결과값으로 받은 위치를 마커로 표시합니다
   	        var marker = new daum.maps.Marker({
   	            map: map,
   	            position: coords,
   	            clickable: true
   	        });	        
   	        
   	        marker.setMap(map); 

   	      console.log(JSON.stringify(result));
   	       //var iwContent = "<div style='padding:5px;'>"+result.addr[0].newAddress+"<br>"+result.addr[0].title+"</div>"; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

   	     var content1;
   	     var detailAddr;
   	 	 var property_map;	
   	       
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
      			      	
      			  	    	detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
             		  	    detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
             		  	    detailAddr += '<div>전월세 : ' + property_map.rent_type + '</div>';
             		  	    detailAddr += '<div>보증금 : ' + property_map.deposit + '</div>';
             		 	    detailAddr += '<div>월세 : ' + property_map.month_fee + '</div>';
             	      
              		 	    content = '<div class="bAddr">' +
                			            '<span class="title">매물정보</span>' + 
                 		  	                 detailAddr + 
                   		    	        '</div>';

             		      // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
               		  	 infowindow.setContent(detailAddr);
                			   infowindow.open(map, marker);
      			      	 }      			         
      			    });  
       		    }   
     		});
   		});
   	       
   	       
   			/*  function searchAddrFromCoords(coords, callback) {
       		// 좌표로 행정동 주소 정보를 요청합니다
      			 geocoder.coord2addr(coords, callback); 
   	       } */
   	       
   	       function searchDetailAddrFromCoords(coords, callback) {
   	    	 // 좌표로 법정동 상세 주소 정보를 요청합니다
   	    	  geocoder.coord2detailaddr(coords, callback);
   	       }   
   	    
   	     var iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다 
   		 // 인포윈도우를 생성합니다
   	 	 var infowindow = new daum.maps.InfoWindow({
   	        content : content1,
   	        removable : iwRemoveable
   	   	 });

   	   	 // 마커에 클릭이벤트를 등록합니다	   	 
   	  	  daum.maps.event.addListener(marker, 'click', function() {
   	          // 마커 위에 인포윈도우를 표시합니다
   	          infowindow.open(map, marker);  
   	   	 });
   	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
   	      //  map.setCenter(coords);	        
   	    } 
   	});   
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
		<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.form.min.js"></script>
		<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
		<script src="assets/plugins/cube-portfolio/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
		<script src="assets/plugins/modernizr.js"></script><!-- 브라우저 호환성 -->
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