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
<link rel="stylesheet" href="assets/css/lightbox.css" type="text/css">
	
	<style>
		table tr td, table tr th
		{
			text-align:center;
		}
		table tr td{
			background-color:#f7f7f7;
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
      <!--contents-->
   <!--=== title Part ===-->
   <div class="container">
   <div class="container-fluid content g-mt-30">
  	<form action = "insert_property4" method = "post">
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
            	
               <c:forEach var = "pic" items = "${up_picture}">
                	<a  href="download?pic_name=${up_picture[0].pic_name}&pic_savename=${up_picture[0].pic_savename}" data-lightbox='roadtrip'>
                     <img style="position: absolute;left:11.5%;" src="download?pic_name=${pic.pic_name}&pic_savename=${pic.pic_savename}">
            		</a>
            	</c:forEach>
            	<div class="clearfix"></div>
            	
            </div>
            
            <div class="thumwrap">
               <ul class="gallery">
                  <c:forEach var = "pic" items = "${up_picture}">
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
                           <th>${property.deposit} / ${property.month_fee}</th>
                           <th>${property.property_type}</th>
                           <th>${property.roomsize}</th>
                           <th>${property.floor}</th>
                           <th>${property.built_year}</th>
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
                           <th>${property.maintence_fee}</th>
                           <th>
                              무선인터넷 : <c:if test="${maintence.internet == 1}"> O </c:if><c:if test="${maintence.internet == 2}"> X </c:if>
                              케이블TV : <c:if test="${maintence.tvfee == 1}"> O </c:if><c:if test="${maintence.tvfee == 2}"> X </c:if>
                              청소비 : <c:if test="${maintence.cleaning == 1}"> O </c:if><c:if test="${maintence.cleaning == 2}"> X </c:if><br>
                              수도료 : <c:if test="${maintence.waterfee == 1}"> O </c:if><c:if test="${maintence.waterfee == 2}"> X </c:if>
                              가스비 : <c:if test="${maintence.gasfee == 1}"> O </c:if><c:if test="${maintence.gasfee == 2}"> X </c:if>
                              전기세 : <c:if test="${maintence.electronic == 1}"> O </c:if><c:if test="${maintence.electronic == 2}"> X </c:if>
                           </th>
                           <th><c:if test="${option.elevator == 1}"> 있음 </c:if><c:if test="${option.elevator == 2}"> 없음 </c:if></th>
                           <th><c:if test="${option.car == 1}"> 가능 </c:if><c:if test="${option.car == 2}"> 불가 </c:if></th>
                           <th><c:if test="${option.pet == 1}"> 가능 </c:if><c:if test="${option.pet == 2}"> 불가 </c:if></th>
                        </tr>
                     </table>
               <div class="g-pt-20"></div>
               <h3 style="font-weight: bold">옵션</h3>
                  <ul class="view_option">
                     <c:if test="${option.air_conditioner == 1}">
                        <li><img src="assets/img/icon/1.png"><p>에어콘</p></li>
                     </c:if>
                     <c:if test="${option.fridge == 1}">
                        <li><img src="assets/img/icon/2.png"><p>냉장고</p></li>
                     </c:if>
                     <c:if test="${option.washing_machine == 1}">
                        <li><img src="assets/img/icon/3.png"><p>세탁기</p></li>
                     </c:if>
                     <c:if test="${option.gas_stove == 1}">
                        <li><img src="assets/img/icon/4.png"><p>가스레인지</p></li>
                     </c:if>
                     <c:if test="${option.electric_stove == 1}">
                        <li><img src="assets/img/icon/5.png"><p>인덕션</p></li>
                     </c:if>
                     <c:if test="${option.microwave == 1}">
                        <li><img src="assets/img/icon/6.png"><p>전자렌지</p></li>
                     </c:if>
                     <c:if test="${option.desk == 1}">
                        <li><img src="assets/img/icon/7.png"><p>책상</p></li>
                     </c:if>
                     <c:if test="${option.rack == 1}">
                        <li><img src="assets/img/icon/8.png"><p>선반</p></li>
                     </c:if>
                     <c:if test="${option.bed == 1}">
                        <li><img src="assets/img/icon/9.png"><p>침대</p></li>
                     </c:if>
                     <c:if test="${option.closet == 1}">
                        <li><img src="assets/img/icon/10.png"><p>옷장</p></li>
                     </c:if>
                     <c:if test="${option.shoecabinet == 1}">
                        <li><img src="assets/img/icon/11.png"><p>신발장</p></li>
                     </c:if>
                     <c:if test="${option.doorlock == 1}">
                        <li><img src="assets/img/icon/12.png"><p>도어락</p></li>
                     </c:if>
                     <c:if test="${option.wifi == 1}">
                        <li><img src="assets/img/icon/13.png"><p>무선인터넷</p></li>
                     </c:if>
                  </ul>
                <div class="clearfix g-pt-20"></div>
               <h3 style="font-weight: bold">상세설명</h3>
                  <span style="white-space: pre-wrap;">${property.property_text}</span>
               <div class="margin-bottom-30"></div>
                  
            </div>
            <!--=== End title left ===-->
            <!--=== title right ===-->
            <div class="col-sm-3 view_bg g-ml-10">
               <div class="g-padding-20">
                  <h3 style="font-weight: bold">${property.rent_type} / ${property.property_type} <span style="color:#f7be22; font-size:30px; font-weight: normal">65/65</span></h3>
                  <p class="g-mb-10">${property.address} ${property.buildingname} ${property.address_detail}</p>
                  
                  <hr>
                  <p class="g-mb-10">게시자 : <span>${loginCustomer.custid}</span></p>
                  <p class="g-mb-10">연락처 : <span>${loginCustomer.phone}</span></p>
                  <p class="g-mb-10">이메일 : <span>${loginCustomer.email}</span></p>
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
                        <button type="submit"
                           class="btn-u btn-block rounded insert_btn">방 등록</button>
                     </div>
                     <div class="col-md-4">
                        <button class="btn-u btn-block rounded insert_btn"
                           style="background-color: #ccc">돌아가기</button>
                     </div>
                     <div class="col-md-2"></div>
                  </div>
	</form>
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

   <!-- photo -->
   <script type="text/javascript" src="assets/js/lightbox.js"></script>
      <script>
   $(function(){      
  	 var gal;
  	 var galout;
 	 var light = "data-lightbox='roadtrip'";
 	 var picList ="${up_picture}";
      $(".gallery li img").on('click', function() {
         gal = $(this).attr("src");
         $(this).html(function(index, html) {
            galout = "<a href='"+gal+"' data-lightbox='roadtrip'><img src='"+gal+"'/></a>";
            $(".inner").html(galout);
         });
      });
   });
   </script>
</body>
</html>