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

table tr td {
   height: 200px;
   border: 1px solid #f7be22;
   padding: 9px;
   font-size: 15px;
   position: relative;
}

.photo {
   border: 1px solid #f7b70b;
   border-radius: 10px;
   background-color: #fff;
}

.close {
   font-size: 37px;
   position: absolute;
   right: 8px;
   top: 0px;
   margin:0;
   padding:0;
}

.photo_btn { /*input tag 공통 스타일*/
   width: 205px;
   border-radius: 3px;
   font-weight: 600;
   border-color: transparent;
   font-size: 20px;
   background: #f7be22;
   color: #fff;
   cursor: pointer;
   z-index : 1;
}

.upload {
   opacity: 0; /*input type="file" tag 투명하게 처리*/
   position: relative;
   top: 76px;
   left: 4px;
}

.replace { /*button tag 에 원하는 스타일 적용*/
   position: absolute;
   border-radius: 10px;
   background: #f7be22;
   color: #fff;
   cursor: pointer;
   width: 150px;
   top: 93px;
   left: 37px;
}

.photo_blank {
   width: 200px;
    position: relative;
    height: 150px;
    z-index: -10000;
    background: #ccc;
    z-index : -1;
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
               <h2 style="font-size: 28px;">매물 사진 변경</h2>
               <div class="pull-right">
                  <h1>Step3</h1>
               </div>
            </div>
         </div>
      </div>
      <div style="width:672px; margin:auto;">
      <form action="update_property3" method="post" enctype="multipart/form-data">
         <table class="photo_line">
            <tr>
               <td>
               <div id = "wrapper1">
                  <button type="button" class="close" onclick="photoRemove(1);">×</button>
                     <button style = "zIndex : -1" id="replace1" class="photo_btn replace">메인</button>
                     <input type="file" name="uploadFile1" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(1);"
                        class="upload photo_btn ">
                  <div id='holder1'>
                     <div class="photo_blank">
                  	   <img style = "zIndex:100000" class="photo_blank" src="download?pic_name=${picture[0].pic_name}&pic_savename=${picture[0].pic_savename}">
                     </div>
                  </div>
               </div>
               </td>
               <td>
               <div id = "wrapper2">
                   <button type="button" class="close" onclick="photoRemove(2);">×</button>
                     <button style = "zIndex : -1" id="replace2" class="photo_btn replace">평면도</button>
                     <input type="file" name="uploadFile2" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(2);"
                        class="upload photo_btn ">
                  <div id='holder2'>
                     <div class="photo_blank">
                     	 <img style = "zIndex:100000" class="photo_blank" src="download?pic_name=${picture[1].pic_name}&pic_savename=${picture[1].pic_savename}">
                     </div>
                  </div>
               </div>
               </td>
               <td>
               <div id = "wrapper3">
                  <button type="button" class="close" onclick="photoRemove(3);">×</button>
                     <button id="replace3" class="photo_btn replace" <c:if test = "${picture.size() >= 3 }"> style = "zIndex:-1" </c:if>>현관</button>
                     <input type="file" name="uploadFile3" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(3);"
                        class="upload photo_btn ">
                  <div id='holder3'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() >= 3 }">
                     	<img class="photo_blank" src="download?pic_name=${picture[2].pic_name}&pic_savename=${picture[2].pic_savename}">
                     	</c:if>
                     </div>
                  </div>
               </div>
               </td>
            </tr>
            <tr>
               <td>
               <div id = "wrapper4">
                  <button type="button" class="close" onclick="photoRemove(4);">×</button>
                     <button id="replace4" class="photo_btn replace" <c:if test = "${picture.size() >= 4 }"> style = "zIndex:-1" </c:if>>방</button>
                     <input type="file" name="uploadFile4" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(4);"
                        class="upload photo_btn ">
                  <div id='holder4'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() >= 4 }">
                     	<img class="photo_blank" src="download?pic_name=${picture[3].pic_name}&pic_savename=${picture[3].pic_savename}">
                     	</c:if>
                     </div>
                  </div>
               </div>
               </td>
               <td>
               <div id = "wrapper5">
                  <button type="button" class="close" onclick="photoRemove(5);">×</button>
                     <button id="replace5" class="photo_btn replace" <c:if test = "${picture.size() >= 5 }"> style = "zIndex:-1" </c:if>>부엌</button>
                     <input type="file" name="uploadFile5" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(5);"
                        class="upload photo_btn ">
                  <div id='holder5'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() >= 5 }">
                     	<img class="photo_blank" src="download?pic_name=${picture[4].pic_name}&pic_savename=${picture[4].pic_savename}">
                     	</c:if>                     
                     </div>
                  </div>
               </div>
               </td>
               <td>
               <div id = "wrapper6">
                  <button type="button" class="close" onclick="photoRemove(6);">×</button>
                     <button id="replace6" class="photo_btn replace" <c:if test = "${picture.size() >= 6 }"> style = "zIndex:-1" </c:if>>화장실</button>
                     <input type="file" name="uploadFile6" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(6);"
                        class="upload photo_btn ">
                  <div id='holder6'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() >= 6 }">
                     	<img class="photo_blank" src="download?pic_name=${picture[5].pic_name}&pic_savename=${picture[5].pic_savename}">
                     	</c:if>                     
                     </div>
                  </div>
               </div>
               </td>
            </tr>
            <tr>
               <td>
               <div id = "wrapper7">
                  <button type="button" class="close" onclick="photoRemove(7);">×</button>
                     <button id="replace7" class="photo_btn replace" <c:if test = "${picture.size() >= 7 }"> style = "zIndex:-1" </c:if>>사진</button>
                     <input type="file" name="uploadFile7" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(7);"
                        class="upload photo_btn ">
                  <div id='holder7'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() >= 7 }">
                     	<img class="photo_blank" src="download?pic_name=${picture[6].pic_name}&pic_savename=${picture[6].pic_savename}">
                     	</c:if>
                     </div>
                  </div>
               </div>
               </td>
               <td>
               <div id = "wrapper8">
                  <button type="button" class="close" onclick="photoRemove(8);">×</button>
                     <button id="replace8" class="photo_btn replace" <c:if test = "${picture.size() >= 8 }"> style = "zIndex:-1" </c:if>>사진</button>
                     <input type="file" name="uploadFile8" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(8);"
                        class="upload photo_btn ">
                  <div id='holder8'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() >= 8 }">
                     	<img class="photo_blank" src="download?pic_name=${picture[7].pic_name}&pic_savename=${picture[7].pic_savename}">
                     	</c:if>
                     </div>
                  </div>
               </div>
               </td>
               <td>
               <div id = "wrapper9">
                  <button type="button" class="close" onclick="photoRemove(9);">×</button>
                     <button id="replace9" class="photo_btn replace" <c:if test = "${picture.size() >= 9 }"> style = "zIndex:-1" </c:if>>사진</button>
                     <input type="file" name="uploadFile9" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(9);"
                        class="upload photo_btn ">
                  <div id='holder9'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() >= 9 }">
                     	<img class="photo_blank" src="download?pic_name=${picture[8].pic_name}&pic_savename=${picture[8].pic_savename}">
                     	</c:if>
                     </div>
                  </div>
               </div>
               </td>
            </tr>
            <tr>
               <td>
               <div id = "wrapper10">
                  <button type="button" class="close" onclick="photoRemove(10);">×</button>
                     <button id="replace10" class="photo_btn replace" <c:if test = "${picture.size() >= 10 }"> style = "zIndex:-1" </c:if>>사진</button>
                     <input type="file" name="uploadFile10" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(10);"
                        class="upload photo_btn ">
                  <div id='holder10'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() >= 10 }">
                     	<img class="photo_blank" src="download?pic_name=${picture[9].pic_name}&pic_savename=${picture[9].pic_savename}">
                     	</c:if>
                     </div>
                  </div>
               </div>
               </td>
               <td>
               <div id = "wrapper11">
                  <button type="button" class="close" onclick="photoRemove(11);">×</button>
                     <button id="replace11" class="photo_btn replace" <c:if test = "${picture.size() >= 11 }"> style = "zIndex:-1" </c:if>>사진</button>
                     <input type="file" name="uploadFile11" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(11);"
                        class="upload photo_btn ">
                  <div id='holder11'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() >= 11 }">
                     	<img class="photo_blank" src="download?pic_name=${picture[10].pic_name}&pic_savename=${picture[10].pic_savename}">
                     	</c:if>
                     </div>
                  </div>
               </div>
               </td>
               <td>
               <div id = "wrapper12">
                  <button type="button" class="close" onclick="photoRemove(12);">×</button>
                     <button id="replace12" class="photo_btn replace" <c:if test = "${picture.size() >= 12 }"> style = "zIndex:-1" </c:if>>사진</button>
                     <input type="file" name="uploadFile12" accept=".gif, .jpg, .png"
                        multiple onclick="proFileShow(12);"
                        class="upload photo_btn ">
                  <div id='holder12'>
                     <div class="photo_blank">
                     	<c:if test = "${picture.size() == 12 }">
                     	<img style = "zIndex:100" class="photo_blank" src="download?pic_name=${picture[11].pic_name}&pic_savename=${picture[11].pic_savename}">
                     	</c:if>
                     </div>
                  </div>
               </div>
               </td>
            </tr>
         </table>
      
         <div class="margin-bottom-30"></div>
         <div class="row ">
            <div class="col-md-2"></div>
               <button type="submit"
                  class="btn-u btn-block rounded insert_btn">사진 변경</button>
            <div class="col-md-2"></div>
         </div>
         </form>
      </div>
      </div>
      
      
      <!--  picture -->
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
   <script type="text/javascript">

function proFileShow(num) {
    var upload = document.getElementsByName('uploadFile' + num)[0];
    var holder = document.getElementById('holder' + num);
    var replace = document.getElementById('replace' + num);

    upload.onchange = function(e) {
       e.preventDefault();
       var file = upload.files[0];
       var reader = new FileReader();
       reader.onload = function(event) {
          var img = new Image();
          replace.style.zIndex=-2;
          img.src = event.target.result;
          img.width = 200;
          img.height = 150;
        
          holder.innerHTML = '';
          holder.appendChild(img);          
       };
       reader.readAsDataURL(file);
       return false;
    };
 }


function photoRemove(num) {
   if(confirm('사진을 취소하시겠습니까?')){
       var wrapper = document.getElementById('wrapper' + num);
       var reset = "<button type='button' class='close' onclick='photoRemove("+num+");'>×</button>";
  	   if(num == 1){
   		reset += "<button id='replace"+num+"' class='photo_btn replace'>메인</button>";
  	   }else if(num == 2){
   		reset += "<button id='replace"+num+"' class='photo_btn replace'>평면도</button>";
  	   }else if(num == 3){
   		reset += "<button id='replace"+num+"' class='photo_btn replace'>현관</button>";
  	   }else if(num == 4){
   		reset += "<button id='replace"+num+"' class='photo_btn replace'>방</button>";
  	   }else if(num == 5){
   		reset += "<button id='replace"+num+"' class='photo_btn replace'>부엌</button>";
  	   }else if(num == 6){
   		reset += "<button id='replace"+num+"' class='photo_btn replace'>화장실</button>";
  	   }else{
   		reset += "<button id='replace"+num+"' class='photo_btn replace'>사진</button>";
  	   }
   	   reset += "<input type='file' name='uploadFile"+num+"' accept='.gif, .jpg, .png'";
       reset += "multiple onclick='proFileShow("+num+");'"
       reset += "class='upload photo_btn '>";
	  	   reset += "<div id='holder"+num+"'>";
   	   reset += "<div class='photo_blank'></div>";
	 	   reset += "</div>"
       var reset = "<button type='button' class='close' onclick='photoRemove("+num+");'>×</button>";
      	   reset += "<button id='replace"+num+"' class='photo_btn replace'>메인</button>";
      	   reset += "<input type='file' name='uploadFile"+num+"' accept='.gif, .jpg, .png'";
           reset += "multiple onclick='proFileShow("+num+");'"
           reset += "class='upload photo_btn '>";
  	  	   reset += "<div id='holder"+num+"'>";
       	   reset += "<div class='photo_blank'></div>";
   	 	   reset += "</div>"
       wrapper.innerHTML = reset;
       replace.style.zIndex=1;
   }
}
</script>
   
   
</body>
</html>