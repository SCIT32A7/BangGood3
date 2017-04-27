<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="assets/plugins/pace/pace-flash.css">
<!-- CSS Theme -->
<link rel="stylesheet" href="assets/css/construction.style.css">
<!-- 메인 -->
<link rel="stylesheet" href="assets/css/global.css">
<!-- 메인 글씨 -->
<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom.css">
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
 <!-- 자동완성 -->
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
   <link rel="stylesheet" href="/resources/demos/style.css">
<style type="text/css">

.mapwrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 300px;
	height: 201px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}


.mapwrap .info {
	width: 300px;
	height: 170px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.mapwrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 2px 0 0 10px;
	height: 30px;
	background: #f7be22;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 7px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	margin: 7px 0 0 0;
	height: 110px;
}

.desc .ellipsis {
	font-size: 15px;
    overflow: hidden;
    text-overflow: ellipsis;
}
.ellipsis_hit{
position:absolute;
bottom:3px;
right:5px;
overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.desc .jibun {
float:left;
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
float:left;
	width: 150px;
	height: 150px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #f78ab0;
}

#addresstext {
	z-index: 100000;
}

.ui-autocomplete {
	max-height: 100px;
	overflow-y: auto;
	z-index: 10000;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
}
/* IE 6 doesn't support max-height
         * we use height instead, but this forces the menu to always be this tall
         */
* html .ui-autocomplete {
	height: 100px;
}

label {
	font-size: 14px;
	font-weight: bold;
	line-height: 0.5;
	cursor: pointer;
	display: inline-block;
	padding: 14px 0px 5px 29px;
	position: relative;
	whitespace: no-wrap;
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-transition: all .15s ease;
	transition: all .15s ease;
	top: 0px;
}

}
label:first-of-type {
	border: 0;
}

label:before {
	content: "";
	position: absolute;
	left: 1rem;
	top: 1rem;
	width: 16px;
	height: 16px;
	border-radius: 50%;
	border: .2rem solid #ccc;
}

/**
 * How it should look when checked
 */
input:checked+label:before {
	border-color: white;
	border: none;
	background: #f7be22;
}

/**
 * How it should look when disabled
 */
input:disabled+label {
	background: #efefef;
	color: rgba(0, 0, 0, 0.5);
	cursor: not-allowed;
}

input:disabled+label:hover {
	border-color: rgba(0, 0, 0, 0.1);
}

input:disabled+label:before {
	border-color: white;
	background: white;
}

input[type=radio], input[type=checkbox] {
	display: none;
}

.option_menu .active {
	background-position: right 5px;
}
</style>

</head>

<body id="body" data-spy="scroll" data-target=".one-page-header"
   class="demo-lightbox-gallery font-main promo-padding-top"style="height:100%;">
   <main class="wrapper"> <!-- header --> 
   <%@ include   file="header.jsp"%> <!-- end header --> 
   <!-- menu -->
   <%@ include file="join.jsp"%>
   <%@ include   file="join2.jsp"%>
   <%@ include   file="join3.jsp"%>
   <%@ include   file="login.jsp"%>
   <!-- end menu -->
   <!-- searchbox -->
      <div id="searchbox" class="search">
         <input type="text" id="addresstext" name="searchText" class="search_form col-sm-9" placeholder="지역을 입력하세요." > 
         <input type="image" id ="searchaddresscenter_button" src="assets/img/search.png" class="search_label">
      </div>
      
      <div class="clearfix"></div>
   <!-- end searchbox -->
    <div style="margin-top:10px"></div>
    <div class="search_container">
    <div class="searchbox2 col-sm-2" id="searchbox2">
       
       
      <div class="searchbox3">
            <table class="table text-center">
               <tbody>
                  <tr>
                     <td>
                        
                        <input type="radio" name="property" id ="year_rent" >
                        <label for="year_rent">전세</label>
                        
                        <input type="radio" name="property" id ="month_rent" class="insert_label">   
                        <label for="month_rent" class="g-ml-10">월세</label>
                     </td>
                  </tr>
                  <tr>
                     <td>
                       
                        <input type="radio" name="rent_type" id ="oneroom">
                         <label for="oneroom">원룸</label>         
                        
                        <input type="radio" name="rent_type" id ="tworoom"> 
                        <label for="tworoom" class="g-ml-10">투룸</label>        
                     </td>
                  </tr>
                 <tr>
                     <td>
                        <p>보증금</p>
                         <select class="form-control" id="deposit1" style="float:left; width:46%">
                             <option selected="selected" value = "0">----</option>
                             <option value = "100">100만원</option>
                             <option value = "500">500만원</option>
                             <option value = "1000">1000만원</option>
                             <option value = "1500">1500만원</option>
                             <option value = "2000">2000만원</option>
                             <option value = "3000">3000만원</option>
                             <option value = "4000">4000만원</option>
                             <option value = "5000">5000만원</option>
                             <option value = "6000">6000만원</option>
                             <option value = "7000">7000만원</option>
                             <option value = "8000">8000만원</option>
                             <option value = "9000">9000만원</option>
                             <option value = "10000">1억원</option>
                        </select>
                        <span class="pull-left g-mt-10" style="margin:">~</span>
                        <select class="form-control" id="deposit2" style="float:left; width:46%">
                             <option selected="selected" value = "999999">무제한</option>
                             <option value = "500">500만원</option>
                             <option value = "1000">1000만원</option>
                             <option value = "1500">1500만원</option>
                             <option value = "2000">2000만원</option>
                             <option value = "3000">3000만원</option>
                             <option value = "4000">4000만원</option>
                             <option value = "5000">5000만원</option>
                             <option value = "6000">6000만원</option>
                             <option value = "7000">7000만원</option>
                             <option value = "8000">8000만원</option>
                             <option value = "9000">9000만원</option>
                             <option value = "10000">1억원</option>
                             <option value = "20000">2억원</option>
                             <option value = "30000">3억원</option>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <p>월세</p>
                         <select class="form-control" id="month_fee1" style="float:left; width:46%">
                             <option selected="selected" value = "0">----</option>
                             <option value = "10">10만원</option>
                             <option value = "20">20만원</option>
                             <option value = "30">30만원</option>
                             <option value = "40">40만원</option>
                             <option value = "50">50만원</option>
                             <option value = "60">60만원</option>
                             <option value = "70">70만원</option>
                             <option value = "80">80만원</option>
                             <option value = "90">90만원</option>
                             <option value = "100">100만원</option>
                        </select>
                        <span class="pull-left g-mt-10" style="margin:">~</span>
                        <select class="form-control" id="month_fee2" style="float:left; width:46%">
                            <option selected="selected" value = "9999">무제한</option>
                             <option value = "30">30만원</option>
                             <option value = "40">40만원</option>
                             <option value = "50">50만원</option>
                             <option value = "60">60만원</option>
                             <option value = "70">70만원</option>
                             <option value = "80">80만원</option>
                             <option value = "90">90만원</option>
                             <option value = "100">100만원</option>
                             <option value = "150">150만원</option>
                             <option value = "200">200만원</option>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <p style="display:inline;">층수</p>
                         <select class="form-control" id="floor" style="display:inline; width:46%">
                             <option selected="selected" value = "0">-----</option>
                             <option value="1">1~3층</option>
                             <option value="4">4~6층</option>
                             <option value="7">7~10층</option>
                             <option value="10">10층 이상</option>
                           </select>
                     </td>
                  <tr>
                  <tr>
                     <td class="addoption ">
                        <h4 style="background:#f7be22; color:#fff">추가옵션 <i class="	fa fa-caret-down"></i></h4>
                        <div class="option_menu text-left">
                        <input type="checkbox" name="maintence_fee" id = "maintence_fee" value="" 
                        ${keyword == 'maintence_fee' ? 'checked' : ''}> 
                        <label for="maintence_fee">관리비 없음</label>     
                        
                        <input type="checkbox" name="car" id = "car" value="" 
                        ${keyword == 'car' ? 'checked' : ''}>
                        <label for="car">주차 가능</label>
                        
                        <input type="checkbox" name="elevator" id = "elevator" value="">
                         <label for="elevator">엘리베이터</label>
                        
                        <input type="checkbox" name="pet" id = "pet" value="" 
                         ${keyword == 'pet' ? 'checked' : ''}>
                        <label for="pet">애완동물</label>
                        
                        <input type="checkbox" name="newbulid" id = "newbuild" value="" 
                         ${keyword == 'newbuild' ? 'checked' : ''}>
                        <label for="newbuild">신축</label>
                        </div>
                     </td>
                  </tr>
                  <tr>
                     <td class="addoption2">
                        <h4 style="background:#f7be22; color:#fff">가구옵션<i class="	fa fa-caret-down"></i></h4>
                        <div class="option_menu2 text-left">
                        <input type="checkbox" name="newbulid" id = "air_conditioner" value="">
                         <label for="air_conditioner">에어컨</label>  
                               
                       
                        <input type="checkbox" name="option" id = "fridge" value="">
                         <label for="fridge">냉장고</label>
                        
                        
                        <input type="checkbox" name="option" id = "washing_machine" value="">
                        <label for="washing_machine">세탁기</label>         
                        
                        <input type="checkbox" name="option" id = "gas_stove" value="">
                        <label for="gas_stove">가스렌지</label>
                        
                        
                        <input type="checkbox" name="option" id = "electric_stove" value="">         
                        <label for="electric_stove">인덕션</label>
                        
                        <input type="checkbox" name="option" id = "microwave" value="">
                        <label for="microwave">전자레인지</label>
                        
                        <input type="checkbox" name="option" id = "desk" value="">  
                        <label for="desk">책상</label>
                               
                        <input type="checkbox" name="option" id = "rack" value="">
                        <label for="rack">선반</label>
                        
                        <input type="checkbox" name="option" id = "bed" value="">
                        <label for="bed">침대</label>
                        
                        <input type="checkbox" name="option" id = "closet" value="">
                        <label for="closet">옷장</label>
                        
                        
                        <input type="checkbox" name="option" id = "shoecabinet" value=""> 
                        <label for="shoecabinet">신발장</label>
                          
                        <input type="checkbox" name="option" id = "doorlock" value="">
                        <label for="doorlock">도어락</label>
                        
                       
                        <input type="checkbox" name="option" id = "wifi" value="">  
                         <label for="wifi">무선인터넷</label>
                         
                        </div>       
                     </td>
                  </tr>
                     
               </tbody>
            </table>
         </div>
    </div>
    <div class="col-sm-10" style="margin:0; padding:0;">
   <div id="map" class="map" style="width:100%; height:677px; float:left;"></div>
   </div>
   </div>
   </main>

  
  <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8af91664dfbd610fb326b81f6ed2ca57&libraries=services"></script>
   <script type="text/javascript">      
   	  var keyword = "${keyword}";
   
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
      var overlays = [];
      
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
      if (keyword == 'maintence_fee'){
    	  maintence_fee = 1;
      }
      var newbuild = "all";
      if (keyword == 'newbuild'){
    	  newbuild = 'new';
      }
      var pet = 0;
      if (keyword == 'pet'){
    	  pet = 1;
      }
      var car = 0;
      if (keyword == 'car'){
    	  car = 1;
      }
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
      
   /*  //eunji_
  	$(function(){
  	var height = $(window).height();
  	$("#map").css("height",height+"px");
  	
  	}); */
  	
  	
  	
  	$(function() {
  		
  		alert(keyword);
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
                     send_data();
                  }
               });              
              }       
          });
          
          $("#year_rent").click(function(){
              rent_type = '전세';
              send_data();
           });
           
           $("#month_rent").click(function(){
              rent_type = '월세';
              send_data();
           });

           $("#oneroom").click(function(){
              property_type = '원룸';
              send_data();
           });
           
           $("#tworoom").click(function(){
              property_type = '투룸';
              send_data();
           });          

           $("#deposit1").click(function(){
              if($("#deposit1").val() == 0 && deposit1 == 0){
                 return false;
              }
              if($("#deposit1").val() == 0){
                 deposit1 = 0;
              }
              if($("#deposit1").val() != 0){
                 deposit1 = $("#deposit1").val();
                 if(deposit1 > deposit2){
                    return false;
                 }
              }
              send_data();          
           });
           
           $("#deposit2").click(function(){
              if($("#deposit2").val() == 999999 && deposit1 == 999999){
                 return false;
              }
              if($("#deposit2").val() == 999999){
                 deposit2 = 999999;
              }
              if($("#deposit2").val() != 999999){
                 deposit2 = $("#deposit2").val();
                 if(deposit1 > deposit2){
                    return false;
                 }
              }
              send_data();          
           });
           
           $("#month_fee1").click(function(){
              if($("#month_fee1").val() == 0 && month_fee1 == 0){
                 return false;
              }   
              if($("#month_fee1").val() == 0){
                 month_fee1 = 0;
              }   
              if($("#month_fee1").val() != 0){
                 month_fee1 = $("#month_fee1").val();
                 if(month_fee1 > month_fee2){
                    return false;
                 }
              }
              send_data();          
           });
           
           $("#month_fee2").click(function(){
              if($("#month_fee2").val() == 9999 && month_fee2 == 9999){
                 return false;
              }
              if($("#month_fee2").val() == 9999){
                 month_fee2 = 9999;
              }
              if($("#month_fee2").val() != 9999){
                 month_fee2 = $("#month_fee2").val();
                 if(month_fee1 > month_fee2){
                    return false;
                 }
              }
              send_data();          
           });
           
           
           $("#floor").click(function(){
              if($("#floor").val() == 0 && floor == 0){
                 return false;
              }
              if($("#floor").val() == 0){
                 floor = $("#floor").val();
              }
              if($("#floor").val() != 0){
                 floor = $("#floor").val();                
              }
              send_data();
           });
           
           $("#maintence_fee").click(function(){
              if (maintence_fee == 'all') {
                 maintence_fee = 1;
              } else if (maintence_fee != 'all') {
                 maintence_fee = 'all';
              }
              send_data();             
           });
           
           $("#car").click(function(){
              if (car == 0) {
                 car = 1;
              } else if (car > 0) {
                 car = 0;
              }
              send_data();             
           });
           
           $("#elevator").click(function(){
              if (elevator == 0) {
                 elevator = 1;
              } else if (elevator > 0) {
                 elevator = 0;
              }
              send_data();             
           });
           
           $("#pet").click(function(){
              if (pet == 0) {
                 pet = 1;
              } else if (pet > 0) {
                 pet = 0;
              }
              send_data();   
           });
           
           $("#newbuild").click(function(){
              if (newbuild == 'all') {
                 newbuild = 'new';
              } else if (newbuild == 'new') {
                 newbuild = 'all';
              }
              send_data();          
           });
           
           $("#air_conditioner").click(function(){
              if (air_conditioner == 0) {
                 air_conditioner = 1;
              } else if (air_conditioner > 0) {
                 air_conditioner = 0;
              }
              send_data();          
           });
           
           $("#fridge").click(function(){
              if (fridge == 0) {
                 fridge = 1;
              } else if (fridge > 0) {
                 fridge = 0;
              }
              send_data();          
           });
           
           $("#washing_machine").click(function(){
              if (washing_machine == 0) {
                 washing_machine = 1;
              } else if (washing_machine > 0) {
                 washing_machine = 0;
              }
              send_data();          
           });
           
           $("#gas_stove").click(function(){
              if (gas_stove == 0) {
                 gas_stove = 1;
              } else if (gas_stove > 0) {
                 gas_stove = 0;
              }
              send_data();          
           });
           
           $("#electric_stove").click(function(){
              if (electric_stove == 0) {
                 electric_stove = 1;
              } else if (electric_stove > 0) {
                 electric_stove = 0;
              }
              send_data();          
           });
           
           $("#microwave").click(function(){
              if (microwave == 0) {
                 microwave = 1;
              } else if (microwave > 0) {
                 microwave = 0;
              }
              send_data();          
           });
           
           $("#desk").click(function(){
              if (desk == 0) {
                 desk = 1;
              } else if (desk > 0) {
                 desk = 0;
              }
              send_data();          
           });
           
           $("#rack").click(function(){
              if (rack == 0) {
                 rack = 1;
              } else if (rack > 0) {
                 rack = 0;
              }
              send_data();          
           });
           
           $("#bed").click(function(){
              if (bed == 0) {
                 bed = 1;
              } else if (bed > 0) {
                 bed = 0;
              }
              send_data();          
           });
           
           $("#closet").click(function(){
              if (closet == 0) {
                 closet = 1;
              } else if (closet > 0) {
                 closet = 0;
              }
              send_data();          
           });
           
           $("#shoecabinet").click(function(){
              if (shoecabinet == 0) {
                 shoecabinet = 1;
              } else if (shoecabinet > 0) {
                 shoecabinet = 0;
              }
              send_data();          
           });
           
           $("#doorlock").click(function(){
              if (doorlock == 0) {
                 doorlock = 1;
              } else if (doorlock > 0) {
                 doorlock = 0;
              }
              send_data();          
           });
           
           $("#wifi").click(function(){
              if (wifi == 0) {
                 wifi = 1;
              } else if (wifi > 0) {
                 wifi = 0;
              }
              send_data();          
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
      
   
   // 검색될 매물을 마커로 표시
   function output(addre) {
      var num = 0;
      allCloseOverlay();
      setMarkers(null);   // 기존 마커 제거
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
               //image : markerImage,
               clickable : true
            });

            marker.setMap(map);               
            markers.push(marker);
               
            var property_map;  // 전송받는 매물 정보를 담을 변수      
            var content; // 오버레이 태그 내용
            
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
                           var overlayTitle = " [ "+property_map.rent_type+" ] "+ property_map.deposit+"/"+property_map.month_fee;
                           content = '<div class="mapwrap">';
                           content +=   '<div class="info">';
                           content +=      '<div class="title">';
                           content +=         overlayTitle
                           content +=         '<div class="close" onclick="closeOverlay('+num+')" title="X"></div>';
                           content +=      '</div>';
                           content +=      '<div class="body">'
                           content +=         '<div class="img">';
                           content +=            '<img src="download?pic_name='+property_map.pic_name+'&pic_savename='+property_map.pic_savename+'" width="150" height="140">';
                           content +=         '</div>';
                           content +=         '<div class="desc g-ml-5">';
                           content +=            '<h3 class="ellipsis"><a href="#">'+property_map.property_title+'</a></h3>';
                           content +=            '<div class="jibun ellipsis"></div>';
                           content +=            '<div><a href="#" target="_blank" class="link"><i class="fa fa-heart"></i>책갈피</a></div>';
                           content +=            '<div class="info_label"><span class="label label-success g-ml-10 rounded">신축</span></div>';
                           content +=            '<div><a href="read_property?property_no='+property_map.property_no+'" target="_blank" class="link">자세히보기</a></div>';
                           content +=            '<p class="ellipsis_hit"> <i class="fa fa-eye"></i>' +property_map.property_hits+ '  <i class="fa fa-comments"></i>'+property_map.reply_count+'  <i class="fa fa-heart"></i>'+property_map.property_like+'</p>';
                           content +=         '</div>';                  
                           content +=      '</div>';
                           content +=    '</div>';
                           content += '</div>';
                         
                           overlay = new daum.maps.CustomOverlay({
                               content: content,
                               map: map,
                               position: marker.getPosition()
                           });
                           
                           overlay.setMap(map);
                           overlays.push(overlay);
                           num += 1;
                           
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
   function closeOverlay(num) {
      overlays[num].setMap(null);
   }
   
   // 오픈 된 모든 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
   function allCloseOverlay() {
      for (var i = 0; i < overlays.length; i++) {
         overlays[i].setMap(null);
      }
      overlays = [];
   }      
      
   // 지도에 나타난 마커를 지우는 함수
   function setMarkers(map) {         
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(map);
      }            
   }
   // eunji_버튼 css
   $(function(){
		$(".option_menu").hide();
		$(".option_menu2").hide();
		$(".addoption h4").click(function(){
	        $(".option_menu").slideToggle("slow");
	        $(".addoption h4 i").toggleClass('fa-caret-up');
	    });
		$(".addoption2 h4").click(function(){
	        $(".option_menu2").slideToggle("slow");
	        $(".addoption2 h4 i").toggleClass('fa-caret-up');
	    });
	});
 
   </script>
      
   <!-- JS Global Compulsory -->
   
   <script src="assets/plugins/jquery/jquery.min.js"></script>
   <script src="assets/plugins/jquery/jquery-migrate.min.js"></script>
   <script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <!-- custom -->
   <script src="assets/js/custom.js"></script>
    

</body>
</html>