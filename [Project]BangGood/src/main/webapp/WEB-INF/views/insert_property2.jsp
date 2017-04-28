<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<title>banggood</title>

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
<!-- 평면도 CSS -->
<style type="text/css">
.box { display: inline-flex; }
 
#rightCanvas {
	background: #f0f0f5;
	border: thin solid gray;
	box-shadow: rgba(0, 0, 0, 0.5) 1px 0px 4px;
	border-radius: 8px;
}


#menuSidebar {
	background: #f7f7f7;
	border: thin solid gray;
	box-shadow: rgba(0, 0, 0, 0.5) 1px 0px 4px;
	border-radius: 8px;
}

.canvas__mirror {
	height: 563px;
    left: 14px;
    position: absolute;
    top: 0px;
    z-index: -1;
}

.pencilContainer {
	background:"#76c2af";
}

.do_btn{
	width:50px;
	height:50px;
}

.tab_switcher{
    width: 100%;
}


.tab_switcher_img{
	-webkit-filter: grayscale(100%);
	filter: grayscale(100%);
	-webkit-transition: .3s ease-in-out;
	transition: .3s ease-in-out;
}

.tab_switcher_img img{
	width:60px;
	height:60px;
	margin:6px 2px;
}

.tab_switcher_img:hover{
	-webkit-filter: grayscale(0);
	filter: grayscale(0);
}
.tab_switcher_img:VISITED{
-webkit-filter: grayscale(0);
	filter: grayscale(0);
}
.furniture div img {
	margin-bottom:5px;
}
.mouse_status{
    width: 170px;
    display: inline-block;
    top: -18px;
    position: relative;
}
/* 평면도 시작시, 축적 선택 폼 체크 */
  .custom-combobox {
    position: relative;
    display: inline-block;
  }
  .custom-combobox-toggle {
    position: absolute;
    top: 0;
    bottom: 0;
    margin-left: -1px;
    padding: 0;
  }
  .custom-combobox-input {
    margin: 0;
    padding: 5px 10px;
  }
  .buttonImage{
  	width:95px;
  	height:95px;
  	margin-left:5px;
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

   <div class="container-fluid g-mt-30">
      <div class="row">
      <div class="col-md-2"></div>
      <div class="col-md-8">
         <div class="headline">
            <h2 style="font-size: 28px;">도면도 그리기</h2>
            <div class="pull-right">
               <h1>Step2</h1>
            </div>
         </div>
      </div><!-- 중간 맞추기col -->
     
      <div class="col-md-2"></div>
         <!-- 전체 col2 -->
      </div><!-- end row -->
      <div class="clearfix"></div>
 		<div class="">
 		<h3>
           <div id="testdiv">테스트</div>
               <input type="button" value="열기" onclick="$('.common').toggle()" />
               <input type="button" value="닫기" onclick="$('.room').toggle()" />
            <div class="icons">
			<div id="image_container" class="image_container">
 		           <button class="pull-left g-mr-50 btn-u btn-block rounded insert_btn" style="background-color: #ccc; width:100px;">돌아가기</button>
           	<input type="image" id="undo" src="assets/img/icons/sidebar/undo.png" class="do_btn tab_switcher_img" data-toggle="tooltip" title="Undo 단축키 Ctrl+z">
           	<input type="image" id="redo" src="assets/img/icons/sidebar/redo.png" class="do_btn tab_switcher_img" data-toggle="tooltip" title="Redo 단축키 Ctrl+y">
            <input type="image" src="assets/img/icons/sidebar/Init.png" alt="초기화" id="clearCanvas" class="do_btn tab_switcher_img" data-toggle="tooltip" title="초기화"/>
           	<input type="image" src="assets/img/icons/sidebar/Eraser.png" alt="선택삭제" id="deleteCanvasObject" class="do_btn tab_switcher_img" 
           		data-toggle="tooltip" title="선택삭제  단축키: ESC+대상클릭+delete"/>
           	<input type="image" src="assets/img/icons/sidebar/Rotation.png" alt="아이콘 회전" id="iconRotation" class="do_btn tab_switcher_img" data-toggle="tooltip" title="아이콘 회전 단축키:마우스 Wheel"/>
           	<input type="image" src="assets/img/icons/sidebar/SelectorMode.png" alt="선택자 모드" id="SelectorMode" class="do_btn tab_switcher_img" data-toggle="tooltip" title="선택자 모드 단축키:ESC"/>
           	<input type="image" src="assets/img/icons/sidebar/Shift.png" alt="직선그리기" id="shiftMode" class="do_btn tab_switcher_img" data-toggle="tooltip" title="직선 단축키:Shift 누른 상태 유지"/>
           	<input type="image" src="assets/img/icons/sidebar/Ctrl.png" alt="이어그리기" id="ctrlMode" class="do_btn tab_switcher_img" data-toggle="tooltip" title="선 이어그리기 단축키:Ctrl 누른 상태 유지"/>
           	<a href="#" class="tab_switcher_img" id="canvasDownload" class="do_btn tab_switcher_img" data-toggle="tooltip" title="평면도 이미지 다운로드">
				<input type="image" src="assets/img/icons/sidebar/Download-button.png" style="width:100px; height:50px;">
			</a>
           	<input type="text" id="status" placeholder="마우스 상태" class="form-control mouse_status" readonly="readonly" />
           	
           	<button id="save_nextStage" class="pull-right btn-u btn-block rounded insert_btn" style="width:100px"> 다음단계</button> 
          	 </div>
           	
 		</h3>
 		</div>
 			
	<div class="row">
		<div id="menuSidebar" class="col-sm-2" style="height:560px;padding:0; border-radius:5px">
			<div class="dashboardLink text-center">
				<div id="tab_switcher" class="tab_switcher pull-width" style="background:#f7be22">
					<a id="pencilTab" class="tab_switcher_img rounded"><img alt="pencilTab" src="assets/img/icons/pencilTab.png" /></a>
					<a id="furnitureTab" class="tab_switcher_img rounded" ><img alt="furnitureTab" src="assets/img/icons/furnitureTab.png" /></a>
					<a id="updownloadTab" class="tab_switcher_img rounded"><img alt="updownloadTab" src="assets/img/icons/updownloadTab.png"/></a>
				<div class="clearfix"></div>
				</div>
			</div> 
			
			
			<div id="tab" style="height:480px; padding:20px;">
				<div class="pencil" style="display:none;  overflow: auto;">
					<div class="pencilContainer">
					<div>
					
					</div>
						<select id="selectColor"class="form-control pull-left" >
							<option value="black" selected="selected">선 색상 : 검정색</option>
							<option value="grey">선 색상 : 회색</option>
						</select> 
						<select id="select" class="form-control pull-left g-mt-10">
							<option value="3" >얇은 선</option>
							<option value="5" selected="selected">굵은 선</option>
						</select>
						<div class="clearfix"></div>
						<input type="button" class="form-control g-mt-10" style="background:#f7be22;" id="line" value="선 그리기" /> 
						<br />
						<select id="fillColor" class="form-control" >
							<option value="#FFFFFF" selected="selected">방 색상: 화이트</option>
							<option value="black">내부 색상: 검정</option>
							<option value="yellow">내부 색상: 노랑</option>
							<option value="#cc9966">내부 색상: 황토색</option>
							<option value="#a6a6a6">내부 색상: 회색</option>
						</select>
						<br />
						<input type="button" class="form-control" style="background:#f7be22;" id="rectangle" value="사각형 그리기" />
						<br />
						<select id="lineStep" class="form-control">
							<option value="50" >미세</option>
							<option value="300" selected="selected">보통</option>
							<option value="700">둔감</option>
						</select>
						<input type="button" class="form-control" style="background:#f7be22;margin-top:10px;" value="민감도 조정" /> 
						<br>
						<select id="objectBox" class="form-control">
							<option value="door" selected="selected">문</option>
							<option value="window">창문</option>
						</select>
						<input type="button" class="form-control" id="object" value="생성"style="background:#f7be22;margin-top:10px;" />
						
						
					</div>
				</div>
				<div class="furniture" style="display:none;overflow: auto;">
					<div class="common">
						
						<img class="buttonImage" alt="airconditioner" src="assets/img/icons/sidebar/AirConditioner.jpg" btn-num="airconditioner"/>
						<img class="buttonImage" alt="desk" src="assets/img/icons/sidebar/Desk.jpg" btn-num="desk" />
						<img class="buttonImage" alt="bookShelve" src="assets/img/icons/sidebar/BookShelve.jpg" btn-num="bookShelve"/>
						<img class="buttonImage" alt="wardrobe" src="assets/img/icons/sidebar/Wardrobe.jpg" btn-num="wardrobe" />
					</div>
					<div class="room">
						<img class="buttonImage" alt="singleBed" src="assets/img/icons/sidebar/SingleBed.jpg" btn-num="singleBed" />
						<img class="buttonImage" alt="doubleBed" src="assets/img/icons/sidebar/DoubleBed.jpg" btn-num="doubleBed" />
						<img class="buttonImage" alt="tv" src="assets/img/icons/sidebar/TV.jpg" btn-num="tv" />
						<img class="buttonImage" alt="desk" src="assets/img/icons/sidebar/Desk.jpg" btn-num="desk" />
						<img class="buttonImage" alt="wardrobe" src="assets/img/icons/sidebar/Wardrobe.jpg" btn-num="wardrobe" />
					</div>
					<div calss="laundryRoom">
						<img class="buttonImage" alt="drum" src="assets/img/icons/sidebar/Drum.jpg" btn-num="drum" />
						<img class="buttonImage" alt="washingMachine" src="assets/img/icons/sidebar/WashingMachine.jpg" btn-num="washingMachine" />
					</div>
					<div class="livingRoom">
						<img class="buttonImage" alt="shoeCloset" src="assets/img/icons/sidebar/ShoeCloset.jpg" btn-num="shoeCloset" />
						<img class="buttonImage" alt="tv" src="assets/img/icons/sidebar/TV.jpg" btn-num="tv" />
						<img class="buttonImage" alt="sofa1" src="assets/img/icons/sidebar/Sofa1.jpg" btn-num="sofa1" />
						<img class="buttonImage" alt="sofa2" src="assets/img/icons/sidebar/Sofa2.jpg" btn-num="sofa2" />
						<img class="buttonImage" alt="sofa4" src="assets/img/icons/sidebar/Sofa4.jpg" btn-num="sofa4" />
						<img class="buttonImage" alt="diningTable" src="assets/img/icons/sidebar/DiningTable.jpg" btn-num="diningTable" />
						<img class="buttonImage" alt="floorTable" src="assets/img/icons/sidebar/FloorTable.jpg" btn-num="table1" />
						<img class="buttonImage" alt="chairTable" src="assets/img/icons/sidebar/ChairTable.jpg" btn-num="table2" />
					</div>
					<div class="kitchen">
						<img class="buttonImage" alt="microwave" src="assets/img/icons/sidebar/Microwave.jpg" btn-num="microwave" />
						<img class="buttonImage" alt="oven" src="assets/img/icons/sidebar/Oven.jpg" btn-num="oven" />
						<img class="buttonImage" alt="kitchenSink" src="assets/img/icons/sidebar/KitchenSink.jpg" btn-num="kitchenSink" />
						<img class="buttonImage" alt="singleDoorRefriger" src="assets/img/icons/sidebar/SingleDoorFridge.jpg" btn-num="singleDoorRefriger" />
						<img class="buttonImage" alt="doubleDoorRefriger" src="assets/img/icons/sidebar/DoubleDoorFridge.jpg" btn-num="doubleDoorRefriger" />
						<img class="buttonImage" alt="gasStove2" src="assets/img/icons/sidebar/GasStove2.jpg" btn-num="gasStove2" />
						<img class="buttonImage" alt="gasStove4" src="assets/img/icons/sidebar/GasStove4.jpg" btn-num="gasStove4" />
						<img class="buttonImage" alt="stoveVent" src="assets/img/icons/sidebar/StoveVent.jpg" btn-num="stoveVent" />
					</div>
					<div class="bathroom">
						<img class="buttonImage" alt="vent" src="assets/img/icons/sidebar/Vent.jpg" btn-num="vent" />
						<img class="buttonImage" alt="toilet" src="assets/img/icons/sidebar/Toilet.jpg" btn-num="toilet" />
						<img class="buttonImage" alt="triBath" src="assets/img/icons/sidebar/TriBath.jpg" btn-num="triBath" />
						<img class="buttonImage" alt="rectBath" src="assets/img/icons/sidebar/RectBath.jpg" btn-num="rectBath" />
						<img class="buttonImage" alt="shower" src="assets/img/icons/sidebar/Shower.jpg" btn-num="shower" />
						<img class="buttonImage" alt="washstand" src="assets/img/icons/sidebar/Washstand.jpg" btn-num="washstand" />
					</div>
				</div>
				<div class="updownload " style="display:none;overflow: auto;">
					<div class="ui-widget" id="datanum">
						<select id='combobox'>
						<!-- 옵션 동적 생성 부분 -->
						</select>
					</div>
					<input type="button" class="btn-u btn-u--construction trim e_img2" value="평면도 불러오기" id="loadCanvasData" />
				</div>
			</div>
  		</div>
		<div class="col-sm-10" style="position: relative">
			<canvas id="rightCanvas" width="1200" height="560">
	   	</canvas>
			<img src="" id="mirror" class="canvas__mirror" width="1200" height="560" />
		</div>
		<!-- end canvas -->
	</div>
   
   </div>
      <!-- container -->
   
   </main>
   <!-- JS Global Compulsory -->
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
		
   <!-- 평면도 기능 코드 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/javascript" src="assets/js/jquery-3.2.0.min.js"></script> -->
	<script type="text/javascript" src="assets/js/FloorplanCanvas.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src= "assets/js/autocomplete.js"></script>
	<script>
//Basic 변수 모음
	var canvas;
	var ctx;
	var backGround;
	var select; //선 두깨
	var fillColor; //채우기색
	var status; //
	var areaNames = []; //방 용도 이름 텍스트 저장
	var custid = '${loginId}';

	// Line 변수 모음 
	var object = [];
	var lines = []; //JSON type array: lines.push(line);
	var intersects = []; //직선의 교차점 기록 JSON TYPE: {x: intersectXY.x, y: intersectXY.y}
	var Rect = []; //사각형 선의 좌표값(4개),타입,색 정보
	var edge = [];
	var lineTemp = ''; //최근 수정한 값 반환
	var updateTemp = ''; //최근 수정한 값 임시 저장 공간
	var Undo = [];
	var Redo = [];
	
	var objectTemp = '';
	var UndoTemp;
	
	var px; //선 길이
	var lineColor;
	var rectPx1;
	var rectPx2;
	var LW = ''; //LineWidth 선 두깨
	var color; //채우기 색깔
	var lineEdgeStep;
	var objectSelect = '';
	var array = '';
	
	// 키보드 이벤트 
	var CtrlKey = false;
	var ShiftKey = false;
	var keyEvent = 'none';
	var KEYCODE = {Esc : '27', Shift : '16', Delete : '46', Ctrl : '17', Y : '89', Z : '90' }; 
	
	// 마우스 이벤트
	var clickE = false;
	var offsetX, offsetY; //offSet
	var mouseX, mouseY = ''; //마우스 좌표값
	var XY; //마우스 좌표의 JSON 타입
	var downXY, upXY;
	var crossXY = "";
	var nearest; //근처값 저장 공간
	var nearest1; //인근 가상의 직선의 만나는 지점 표시
	var Step = 10; //그리드 스텝
	var fixed = 5; //각 선의 설정에 따른 마우스 좌표의 위치설정 값 조절
	
	//이벤트 변수 모음
	var count = 45;
	var seta = 0;

	// 다운로드 관련
	var mirror; //캔버스 반영 이미지 태그
	var downloadBtn; //다운로드
	var isDownloaded = false; //다운로드 유무 확인
	var saved_name; //저장되는 이미지 이름 및 서버에 등록되는 이름
	var scale; //축척
	 
	//이미지 관련 선언..........................
	var buttonImage;
	var imgSource = {
			singleBed : "assets/img/icons/singleBed.PNG",
			doubleBed : "assets/img/icons/doubleBed.png",
			door : "assets/img/icons/door.png",
			toilet : "assets/img/icons/toilet.png",
			triBath : "assets/img/icons/triBath.png",
			rectBath : "assets/img/icons/rectBath.png",
			shower : "assets/img/icons/shower.PNG",
			washstand : "assets/img/icons/washstand.png",
			microwave : "assets/img/icons/microwave.PNG",
			oven : "assets/img/icons/oven.PNG",
			kitchenSink : "assets/img/icons/kitchenSink.png",
			singleDoorRefriger : "assets/img/icons/singleDoorRefriger.PNG",
			doubleDoorRefriger : "assets/img/icons/doubleDoorRefriger.PNG",
			desk : "assets/img/icons/desk.png",
			bookShelve : "assets/img/icons/bookShelve.png",
			shoeCloset : "assets/img/icons/shoeCloset.png",
			drum : "assets/img/icons/drum.png",
			washingMachine : "assets/img/icons/washingMachine.PNG",
			airconditioner : "assets/img/icons/airconditioner.png",
			gasStove2 : "assets/img/icons/gasStove2.png",
			gasStove4 : "assets/img/icons/gasStove4.png",
			stoveVent : "assets/img/icons/stoveVent.png",
			vent : "assets/img/icons/vent.png",
			wardrobe : "assets/img/icons/wardrobe.png",
			tv : "assets/img/icons/tv.png",
			sofa1 : "assets/img/icons/sofa1.png",
			sofa2 : "assets/img/icons/sofa2.png",
			sofa4 : "assets/img/icons/sofa4.png",
			diningTable : "assets/img/icons/diningTable.png",
			table1 : "assets/img/icons/table1.png",
			table2 : "assets/img/icons/table2.png"
	};
	var img;
	var iconState;
	var pi = 3.141592;
	var pi2 = Math.PI * 2;
	var resizerRadius = 8; //꼭지점 사이즈
	var rr = resizerRadius * resizerRadius;
	var draggingResizer = -1; // -1: none, 0:left-top, 1:right-top, 2:right-bottom, 3:left-bottom
	
	$(function() {
		init();
		var isNotProperlySelected = true;
		while(isNotProperlySelected) {
			var check = prompt("<선 길이 축척 설정>\n (숫자 선택) 1. 원룸 사이즈, 2. 투룸 사이즈, 3. 쓰리룸 사이즈 (숫자 선택)");
			if(check == 1 || check ==2 || check ==3) {
				scale = check;
				isNotProperlySelected = false;
			}
		}
		alert(scale);
		
		
		//offset 설정 함수
		$(window).on("scroll", function(e) { offsetReload() });
		$(window).on("resize", function(e) { offsetReload() });

		//아이콘을 그리는 기능
		Icon.prototype.draw = function() {
			ctx.save();
			ctx.translate((this.x) , (this.y));
			ctx.rotate(this.rotateTable*Math.PI/180);
			ctx.drawImage(this.img, -(this.width/2),-(this.height/2), this.width,this.height);
			ctx.restore();
		}

		//이미지 바운더리 체크 기능
		Icon.prototype.isOnIcon = function(mouseX, mouseY) {
			console.log("isOnIcon");
			console.log(this.rotateTable);
			var degree = this.rotateTable;
			var seta = pi / (180.0 / degree );
			var mx = (mouseX-this.x)*Math.cos(-seta)-(mouseY-this.y)*Math.sin(-seta)+this.x;
			var my = (mouseX-this.x)*Math.sin(-seta)+(mouseY-this.y)*Math.cos(-seta)+this.y;
			var x1 = this.x-this.width/2;
			var y1 = this.y-this.height/2;
			var x2 = this.x+this.width/2;
			var y2 = this.y+this.height/2;
			return (x1 <= mx) && (x2 >= mx) && (y1 <= my) && (y2 >= my);
		}

		//아이콘 추가 메소드 추가
		IconState.prototype.addIcon = function(icon) {
			this.icons.push(icon);
		}

		IconState.prototype.removeIcon = function(icon) {
			if (icon != null) {
				var length = iconState.icons.length
				for (var i = length - 1; i > -1; i--) {
					if (iconState.icons[i] == icon) {
						iconState.icons.splice(i, 1);
						IconState.isRemovable = false;
						iconState.draw();
						return;
					}
				}
			}
		}
		
		
		//아이콘 전체를 그리는 메소드
		IconState.prototype.draw = function() {
			var icons = this.icons;
			var degree = 0;
			var seta = '';
			
			if(icons == null) {
				iconState.icons = [];
			}
			
			// 아이콘 모두 다시 그리기
			var iconLength = icons.length;
			for (var i = 0; i < iconLength; i++) {
				var icon = icons[i];
				if (icon.x > this.width || icon.y > this.height ||
					icon.x + icon.w < 0 || icon.y + icon.h < 0) continue;
				icon.draw();
			}
			if (iconState.selection != null) {
				//외곽 라인 그리기
				ctx.save();
				ctx.strokeStyle = iconState.selectionColor;
				ctx.lineWidth = iconState.selectionWidth;
				var mySel = iconState.selection;
				ctx.translate((mySel.x), (mySel.y));
				ctx.rotate(mySel.rotateTable*Math.PI/180);
				ctx.strokeRect(-mySel.width/2, -mySel.height/2, mySel.width, mySel.height);
				degree = mySel.rotateTable;
				seta = pi / (180.0 / degree );
				var x0 = mySel.x;
				var y0 = mySel.y;
				var x1 = mySel.x-mySel.width/2;
				var y1 = mySel.y-mySel.height/2;
				var x2 = mySel.x+mySel.width/2;
				var y2 = mySel.y+mySel.height/2;
				//-(this.img.width/4),-(this.img.height/4),this.width,this.height
				ctx.restore();
				//꼭지점 표시
				drawDragAnchor(((x1-x0)*Math.cos(seta)-(y1-y0)*Math.sin(seta)+x0), ((x1-x0)*Math.sin(seta)+(y1-y0)*Math.cos(seta)+y0), "left-top");
				drawDragAnchor(((x2-x0)*Math.cos(seta)-(y1-y0)*Math.sin(seta)+x0), ((x2-x0)*Math.sin(seta)+(y1-y0)*Math.cos(seta)+y0), "left-right");
				drawDragAnchor(((x1-x0)*Math.cos(seta)-(y2-y0)*Math.sin(seta)+x0), ((x1-x0)*Math.sin(seta)+(y2-y0)*Math.cos(seta)+y0), "right-bottom");
				drawDragAnchor(((x2-x0)*Math.cos(seta)-(y2-y0)*Math.sin(seta)+x0), ((x2-x0)*Math.sin(seta)+(y2-y0)*Math.cos(seta)+y0), "left-bottom");
			}

		}
		
		IconState.prototype.rotateIcon = function(degrees) {
		    var icon = iconState.selection;
		    ctx.save();
		    ctx.translate(50, 50);
		    ctx.rotate(degrees*Math.PI/180);
		    iconState.selection.rotate(ctx);
		    ctx.restore();
		}
		
		//이미지 버튼 이벤트
		$(".buttonImage").on("click", function() {
			status = "image";
			var selectedImage = $(this).attr("btn-num");
			
			img = new Image();
			//이미지 불러오기(그려내기)
			img.onload = function() {
				var width = img.width;
				var height = img.height;
				var icon = new Icon(img, 50, 50, (width/2), (height/2), 0);
				icon.src = imgSource[selectedImage];//....................수정
				iconState.dragoffx = 50 - icon.x;
				iconState.dragoffy = 50 - icon.y;
				iconState.dragging = true;
				iconState.selection = icon; //현재 마우스로 선택한 대상을 상태에 넣기
				iconState.isRemovable = true;
				clearCanvas();
				inputUndo({data:icon,type:"icon"},"create");
				iconState.addIcon(icon);
				redrawAll();
			}
			img.src = imgSource[selectedImage];
		});

		
		
		$("button#save_nextStage").on("click", function(){
			if(isDownloaded) { //다음 페이지로 진행
				alert(scale);
				saveFloorplan(false, "insert_property2", saved_name, scale);
			} else { //다운로드 과정 자동 실행
				alert("이미지 다운로드를 먼저 진행해주세요.");
				$("#updownloadTab").trigger("click");
				//$("#canvasDownload").trigger("click");
				//$("button#save_nextStage").trigger("click");
			}
		});
		
		
		
		//이미지 다운로드
		$("#canvasDownload").click( function() {
			//저장 이름 지정
			saved_name = prompt("저장할 이름을 지정해주세요.", "BangGood");
			if(saved_name == null) {
				isDownloaded = false;
				$('#canvasDownload').attr('href', '#').removeAttr('download');
			} else {
				downloadFloorplanPng(saved_name, scale);
				isDownloaded = true;
			}
		});
		
		//데이터베이스에서 데이터 로드 하기
		$("#loadCanvasData").on("click", function() {
			clearCanvas();
			var result = loadUserData();
			console.log("loadData: "+JSON.stringify(result));
			
			//축척 scale 삽입
			scale = result.scale;
			
			//로드된 선 데이터 삽입
			lines = result.lines;
			console.log("loadData 라인 길이:"+ lines.length);
			
			//로드된 선 오브젝트(문, 창문) 삽입
			object = result.objects;
			console.log("loadData 오브젝트 길이:"+ object.length);
			
			//로드된 아이콘 데이터 삽입
			var loadedIcons = result.icons;
			console.log("loadData 아이콘 길이: "+loadedIcons.length);

			[].forEach.call(loadedIcons, function(temp) {
				var icon = new Icon();
				var img = new Image();
				img.src = temp.src;
				img.onload = function() {
					var updatedIcon = insertLoadedValueToIcon(icon, img, temp);
					iconState.addIcon(updatedIcon);
					redrawAll();
				}
			});
		});
		
		//데이터 불러오기 콤보 박스
		$( "#combobox" ).combobox();
		
		//메뉴 인터페이스 단
		//메뉴창 선 설정 
		$("#select").change(function() {
			LW = selector();
			fixed = fixLine(LW);
		});
		
		$("#selectColor").change(function() {
			lineColor = selectLineColor();
		});

		//색
		$("#fillColor").change(function() {
			color = colorSelect();
		});


		$("#lineStep").change(function() {
			lineEdgeStep = stepSelect();
		});

		//기본 status 설정
		//선 버튼
		$("#line").on("click", function() {
			status = 'line';
			canvas.style.cursor = "crosshair";
			updateTemp = null;
		//drawAllLines(lines);
		});

		//사각형 버튼
		$("#rectangle").on("click", function() {
			status = 'rect';
			canvas.style.cursor = "crosshair";
			updateTemp = null;
		//drawAllLines(lines);
		});
		
		//오브잭트 버튼
		$("#object").on("click", function() {
			status = 'object';
			count = 45;
			objectSelect = selectObject();
			canvas.style.cursor = "crosshair";
			updateTemp = null;
		//drawAllLines(lines);
		});

		$("#clearCanvas").on("click", function() { 
			ctx.clearRect(0, 0, canvas.width, canvas.height);
			init();
			lines = [];
			object = [];
			intersects = []; 
			Rect = []; //사각형 선의 좌표값(4개),타입,색 정보
			edge = [];
			lineTemp = ''; //최근 수정한 값 반환
			updateTemp = ''; //최근 수정한 값 임시 저장 공간
			Undo = [];
			Redo = [];
			
		});
		
		
		//키 이벤트
		//키보드 누를때

		$(window).keydown(function(e) {
			//Esc
			if (e.keyCode == KEYCODE.Esc) {
				updateTemp = null;
				if (status!="lineDrawing"&&status != "rectDrawing") {
					status = 'none';
					canvas.style.cursor = "Default";
					iconState.removeIcon(iconState.selection);
					iconState.selection = null;
				} else if (status == "lineDrawing") {
					clickE = false;
					status = 'line';
				} else if (status == "rectDrawing") {
					clickE = false;
					status = 'rect';
				}
				updateTemp = null;
				iconState.selection = null;
				drawAllLines(lines);
			}
			//Shift
			else if (e.keyCode == KEYCODE.Shift) {
				ShiftKey = true;
			}
			//Ctrl+Z키 Undo or Ctrl+Y키 Redo 
			else if (e.keyCode == KEYCODE.Ctrl) {
				CtrlKey = true;
				if (status == 'line') {
					e.preventDefault();
					keyEvent = 'straight';
				} else if (status == 'lineDrawing') {
					e.preventDefault();
					keyEvent = 'straight';
				}
			}
			//Undo시 임시저장 공간의 마지막 부분을 호출하여 함수에 반환
			else if (e.keyCode == KEYCODE.Z && CtrlKey) {
				if (Undo.length > 0) {
					getUndo(Undo[Undo.length - 1]);
					Redo.push(Undo.pop());
					//console.log(JSON.stringify(Redo));
					drawAllLines(lines);
				}
				updateTemp = null;
				redrawAll();
			}
			
			//Redo시 임시저장 공간의 마지막 부분을 호출하여 함수에 반환
			else if (e.keyCode == KEYCODE.Y && CtrlKey) {
				if (Redo.length > 0) {
					getRedo(Redo[Redo.length - 1]);
					Undo.push(Redo.pop());
					//console.log(JSON.stringify(Undo));
					drawAllLines(lines);
				}
				updateTemp = null;
				redrawAll();
			}
			
			//수정
			//Delete키 누를시 드로우드 객체 삭제 => Undo임시 저장 공간에 입력
			else if (e.keyCode == KEYCODE.Delete) {
				if (updateTemp) {
					if (updateTemp.type == "line") {
						var coord = { x0 : updateTemp.line.x0, y0 : updateTemp.line.y0,
							x1 : updateTemp.line.x1, y1 : updateTemp.line.y1 };
						for (var i = 0; i < lines.length; i++) {
							if (JSON.stringify(coord) == JSON.stringify(lines[i].coordinate)) {
								inputUndo(lines[i], "delete");
								lines.splice(i, 1);
							}
						}
					} else if (updateTemp.type.substr(0, 4) == "rect") {
						//console.log(JSON.stringify(updateTemp.line1));
						deleteRect(updateTemp.line1);
					} else if (updateTemp.type == "icon") {
						inputUndo({data:iconState.selection,type:"icon"},"delete");
						iconState.removeIcon(iconState.selection);
						iconState.selection = null;
					}else if (updateTemp.type == "door"||updateTemp.type == "window"){
						inputUndo(updateTemp,"delete");
						//console.log(JSON.stringify(updateTemp));
						var array = lines[updateTemp.index].object;
						//console.log(JSON.stringify(array));
						for(var i=0;i<array.length;i++){
							if(JSON.stringify(updateTemp) == JSON.stringify(array[i])){
								array.splice(i,1);
								//lines[updateTemp.index]['object'].push(array);
							}
						}
					}
				}
				updateTemp = null;
				redrawAll();
			//edge=[];
			}
		});

		//키보드 땔때
		$(window).keyup(function(e) {
			//Shift end
			if (e.keyCode == KEYCODE.Shift) {
				ShiftKey = false;
			}
			//Ctrl+Z Undo UnCheck or Ctrl+Y Redo UnCheck
			else if (e.keyCode == KEYCODE.Ctrl) {
				CtrlKey=false;
	            upXY='';
	            //status="line";
	            keyEvent = 'none';
			}
		});

		//마우스 이벤트

		//마우스 누를시
		$("#rightCanvas").on("mousedown", function(e) {
			e.preventDefault();
			//var XY;   //mouse의 좌표값을 받아오는 함수 호출
			//line//
			if (clickE) {
				return; //클릭토글의 비정상 작동 제한
			}
			updateTemp = null;
			redrawAll();
			clickE = true;
			if (status == "line") {
				//XY = mouseXY(e);
				status = "lineDrawing";
			} else if (status == "lineDrawing" && keyEvent == 'straight') {
				XY = upXY;
			} else if (status == "rect") {
				status = "rectDrawing";
			} 
			
			if ((status == 'none'||status == 'objectSelect')&&objectTemp){
				selectObjectIcon();
				status="objectSelect";
				redrawAll();
			}else if (status == "object"||status == 'objectSelect') {
				drawingObject("create");
				redrawAll();
			}
			else if (nearest && status == 'none') {
				selectLine();
				redrawAll();
			} 
			if (status == "none" || status == "image") {
				if(selectIcon(XY)){
					//status="image";
					moveTemp("image");
				}
				redrawAll();
			} 
			//선택자 행위
			/////////
			downXY = XY;
			//status 확인
			$("#status").val("마우스 상태: " + status);
		});

		//마우스를 땔시
		$("#rightCanvas").on("mouseup", function(e) {
			e.preventDefault();
			if((downXY.x+downXY.y)==(XY.x+XY.y)){
				if(status!="image"&&!objectTemp){
					status = 'none';
					clickE = false;
				}
				//return;
			}
			if (status == "image") {
				iconState.dragging = false;
				draggingResizer = -1;
			} else if (clickE && status == 'lineDrawing') {
				status = "line" //status값 원귀
				if (keyEvent == 'straight') {
					upXY = XY;
					status = "lineDrawing";
				}
				createLine(downXY, XY, 'lineCreate', px);
			} else if (clickE && status == 'rectDrawing') {
				status = "rect"; //status값 원귀
				createLine(downXY, XY, 'rectCreate');
			} 
			clickE = false;
			clickU = true;
			//status 확인
			$("#status").val("마우스 상태: " +status);
		});

		//마우스 이동시
		$("#rightCanvas").on("mousemove", function(e) {
			e.preventDefault();
			nearest = null;
			XY = mouseXY(e);
			crossXY = mouseXY(e);
			crossHair(getCrossXY(e));
			//if(!clickE) return;
			nearest = findNearestLine(XY);
			nearest1 = edgeStep(XY);
			if (nearest) {
				XY = nearest;
				drawPoint(nearest);
			} else if (nearest1) {
				XY = nearest1;
				drawPoint(nearest1);
			} else if (nearest1 && nearest) {
				XY = nearest;
				drawPoint(nearest);
			}
			if (status == "image"&& iconState.selection != null) {
				iconCtrl(XY);
				redrawAll();
			}
			else if (status == "object") {
				drawingObject("draw");
			}
			else if (clickE && status == "objectSelect") {
				updateObject(updateTemp);
			}
			//line//
			else if (clickE && status == 'lineDrawing') { //그리는 도중의 status값 lineDrawing
				//선 길이 출력 기능
				px = getLineLength(downXY, XY, scale); //....................................
				ctx.save();
				ctx.font = "15px Comic Sans MS";
				ctx.fillStyle = "blue";
				ctx.fillText(px + "Meters", XY.x, XY.y);
				createLine(downXY, XY, 'drawing');
				ctx.restore();
			}
			else if (clickE && status == 'rectDrawing') { //그리는 도중의 status값 lineDrawing
				//iconState.valid = false;
				createLine(downXY, XY, 'drawing');
			}
		////////
			//status 확인
			$("#status").val("마우스 상태: " +status);
		});
		
		//마우스 휠 이벤트
		
		$("#rightCanvas").on("mousewheel",function(e){
			e.preventDefault();
			var E = e.originalEvent.deltaY;
	    	redrawAll();
	        console.log(status);
	        if (E<0) {
	             if(status=="object"){
	            	 if(count<80) count++;
	            	 drawingObject("draw");
		     		 // ObjectIcon(XY,"drawing");
	   	         } else if(status=="image" && iconState.selection ){
		             seta +=5;
		             iconState.selection.rotateTable = seta;
		             redrawAll();
	   	      	 }else if(status=="object"||status=="objectSelect"&&(updateTemp.type=="door"||updateTemp.type=="window")){
					 objectResizer(updateTemp,"up");
	   	      		 
	             }
		    }else{
		         //wheel = "dwon";
	             if(status=="object"){
	            	 if(count>30) count--;
	            	 drawingObject("draw");
	     			 //ObjectIcon(XY,"drawing");
	             }
	             else if(status=="image" && iconState.selection ){
	            	 seta -=5;
	            	 iconState.selection.rotateTable = seta;
	            	 redrawAll();
	             }else if(status=="object"||status=="objectSelect"&&(updateTemp.type=="door"||updateTemp.type=="window")){
	            	 objectResizer(updateTemp,"down");
	             }
	        };
	    });
		
		$("#pencilTab").on("click", function(){
			$("#tab").css("overflow","auto");
			$(".furniture").hide();
			$(".updownload").hide();
			$(".pencil").show();
		});
		$("#furnitureTab").on("click", function(){
			$("#tab").css("overflow","scroll");
			$(".pencil").hide();
			$(".updownload").hide();
			$(".furniture").show();
		});
		$("#updownloadTab").on("click", function(){
			$("#tab").css("overflow","auto");
			$(".pencil").hide();
			$(".furniture").hide();
			$(".updownload").show();
		});
		$("#redo").on("click", function() {
			if (Redo.length > 0) {
				getRedo(Redo[Redo.length - 1]);
				Undo.push(Redo.pop());
				//console.log(JSON.stringify(Undo));
				drawAllLines(lines);
			}
			updateTemp = null;
			redrawAll();
		});
		$("#undo").on("click", function() {
			if (Undo.length > 0) {
				getUndo(Undo[Undo.length - 1]);
				Redo.push(Undo.pop());
				//console.log(JSON.stringify(Redo));
				drawAllLines(lines);
			}
			updateTemp = null;
			redrawAll();
		});
		
		$("#shiftMode").on("click", function(){
			if(ShiftKey == true) {
				ShiftKey = false;
				$("#shiftMode").attr("class", "do_btn tab_switcher_img");
			} else {
				ShiftKey = true;
				$("#shiftMode").removeAttr("class").attr("class", "do_btn");
			}
		});
		
		$("#ctrlMode").on("click", function(e){
			if(CtrlKey == true) {
				CtrlKey = false;
				upXY='';
	            //status="line";
	            keyEvent = 'none';
				$("#ctrlMode").attr("class", "do_btn tab_switcher_img");
			} else {
				CtrlKey = true;
				if (status == 'line') {
					e.preventDefault();
					keyEvent = 'straight';
				} else if (status == 'lineDrawing') {
					e.preventDefault();
					keyEvent = 'straight';
				}
				$("#ctrlMode").removeAttr("class").attr("class", "do_btn");
			}
			
			
		});
		
		$("#SelectorMode").on("click", function() {
			updateTemp = null;
			if (status!="lineDrawing"&&status != "rectDrawing") {
				status = 'none';
				canvas.style.cursor = "Default";
				iconState.removeIcon(iconState.selection);
				iconState.selection = null;
			} else if (status == "lineDrawing") {
				clickE = false;
				status = 'line';
			} else if (status == "rectDrawing") {
				clickE = false;
				status = 'rect';
			}
			updateTemp = null;
			iconState.selection = null;
			drawAllLines(lines);
		});
		$("#iconRotation").on("click", function(e) {
			e.preventDefault();
			var E = e.originalEvent.deltaY;
	    	redrawAll();
	        console.log(status);
	        if (E<0) {
	             if(status=="object"){
	            	 if(count<80) count++;
	            	 drawingObject("draw");
		     		 // ObjectIcon(XY,"drawing");
	   	         } else if(status=="image" && iconState.selection ){
		             seta +=5;
		             iconState.selection.rotateTable = seta;
		             redrawAll();
	   	      	 }else if(status=="object"||status=="objectSelect"&&(updateTemp.type=="door"||updateTemp.type=="window")){
					 objectResizer(updateTemp,"up");
	   	      		 
	             }
		    }else{
		         //wheel = "dwon";
	             if(status=="object"){
	            	 if(count>30) count--;
	            	 drawingObject("draw");
	     			 //ObjectIcon(XY,"drawing");
	             }
	             else if(status=="image" && iconState.selection ){
	            	 seta -=5;
	            	 iconState.selection.rotateTable = seta;
	            	 redrawAll();
	             }else if(status=="object"||status=="objectSelect"&&(updateTemp.type=="door"||updateTemp.type=="window")){
	            	 objectResizer(updateTemp,"down");
	             }
	        };
		});
		$("#deleteCanvasObject").on("click", function() {
				if (updateTemp) {
					if (updateTemp.type == "line") {
						var coord = { x0 : updateTemp.line.x0, y0 : updateTemp.line.y0,
							x1 : updateTemp.line.x1, y1 : updateTemp.line.y1 };
						for (var i = 0; i < lines.length; i++) {
							if (JSON.stringify(coord) == JSON.stringify(lines[i].coordinate)) {
								inputUndo(lines[i], "delete");
								lines.splice(i, 1);
							}
						}
					} else if (updateTemp.type.substr(0, 4) == "rect") {
						//console.log(JSON.stringify(updateTemp.line1));
						deleteRect(updateTemp.line1);
					} else if (updateTemp.type == "icon") {
						inputUndo({data:iconState.selection,type:"icon"},"delete");
						iconState.removeIcon(iconState.selection);
						iconState.selection = null;
					}else if (updateTemp.type == "door"||updateTemp.type == "window"){
						inputUndo(updateTemp,"delete");
						//console.log(JSON.stringify(updateTemp));
						var array = lines[updateTemp.index].object;
						//console.log(JSON.stringify(array));
						for(var i=0;i<array.length;i++){
							if(JSON.stringify(updateTemp) == JSON.stringify(array[i])){
								array.splice(i,1);
								//lines[updateTemp.index]['object'].push(array);
							}
						}
					}
				}
				updateTemp = null;
				redrawAll();
			//edge=[];
		});
		
	});//  ready end

</script>

</head>
<body>
	

</body>
</html>