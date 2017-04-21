<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

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
<!-- 평면도 CSS -->
<style type="text/css">
body { background: #b3ecff; }
.box { display: inline-flex; }
 
#rightCanvas {
	background: #f0f0f5;
	border: thin solid gray;
	box-shadow: rgba(0, 0, 0, 0.5) 2px 2px 4px;
	border-radius: 8px;
}

#leftCanvas {
	background: #66ffff;
	border: thin solid gray;
	cursor: pointer;
	box-shadow: rgba(0, 0, 0, 0.5) 2px 2px 4px;
	border-radius: 8px;
}

.canvas__mirror {
	height: 100%;
	left: 0;
	position: absolute;
	top: 0;
	z-index: -1;
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
            <h2 style="font-size: 28px;">도면도 그리기</h2>
            <div class="pull-right">
               <h1>Step2</h1>
            </div>
         </div>
      </div><!-- 중간 맞추기col -->
      <div class="col-md-2"></div>
         <!-- 전체 col2 -->
      </div><!-- end row -->
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
   
   <!-- 평면도 기능 코드 -->

<!-- <script type="text/javascript" src="assets/js/jquery-3.2.0.min.js"></script> -->
<script type="text/javascript" src="assets/js/FloorplanCanvas.js"></script>
<script>
//Basic 변수 모음
	var canvas;
	var menu;
	var ctx;
	var menuCtx;
	var backGround;
	var select; //선 두깨
	var fillColor; //채우기색
	var status; //
	var areaNames = []; //방 용도 이름 텍스트 저장

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
	
	var px; //선 길이
	var scale; //축척
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
		scale = prompt("<선 길이 축척 설정>\n어떤 방을 그리시나요?(숫자선택) 1:원룸, 2:투룸, 3:아파트");
		
		//offset 설정 함수
		$(window).on("scroll", function(e) { offsetReload() });
		$(window).on("resize", function(e) { offsetReload() });

		//아이콘을 그리는 기능
		Icon.prototype.draw = function() {
			ctx.save();
			ctx.translate((this.x) , (this.y));
			ctx.rotate(this.rotateTable*Math.PI/180);
			ctx.drawImage(this.img, -(this.width/2),-(this.height/2),this.width,this.height);
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
				iconState.draw();
			}
			img.src = imgSource[selectedImage];
		});

		$("#btn-download").on("click", function(e) {
			//다운로드 직전 최신화
			redrawAll();

			//파일 다운로드 기능
			var dataURL = canvas.toDataURL("image/png");
			var newdata = dataURL.replace(/^data:image\/png/, 'data:application/octet-stream');
			$('a.button').attr('download', 'floorplan.png').attr('href', newdata);

			//세이브 기능
			var iconArray = iconState.icons;
			var lineArray = lines;
			var data = { lines : JSON.stringify(lineArray),
						 icons : JSON.stringify(iconArray) }
			console.log(data);
			$.ajax({
				method : "POST",
				url : "saveCanvas",
				dataType : "JSON",
				data : data,
				success : function(result) {
					if (result) {
						alert("succeeded to save canvas");
					}
				},
				error : function() {
					alert("error");
				}
			});
		});
		
		
		//데이터베이스에서 데이터 로드 하기
		$("#loadCanvasData").on("click", function() {
			var result = loadUserData();
			console.log("loadData 0414: "+result);
			
			//로드된 선 데이터 삽입
			lines = result.lines;
			console.log("loadData 라인 길이:"+ lines.length);
			
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
					console.log("img onload => "+ JSON.stringify(iconState.icons));
				}
			});
		});
	
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
				updateTemp = null;												//변경!!!
				if (status == "line" || status == "rect" || status == "fill" || status == "image") {
					status = 'none';
					canvas.style.cursor = "Default";
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
			}
			//Redo시 임시저장 공간의 마지막 부분을 호출하여 함수에 반환
			else if (e.keyCode == KEYCODE.Y && CtrlKey) {
				if (Redo.length > 0) {
					getRedo(Redo[Redo.length - 1]);
					Undo.push(Redo.pop());
					//console.log(JSON.stringify(Undo));
					drawAllLines(lines);
				}
			}
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
			clickE = true;
			if (status == "line") {
				//XY = mouseXY(e);
				status = "lineDrawing";
			} else if (status == "lineDrawing" && keyEvent == 'straight') {
				XY = upXY;
			} else if (status == "rect") {
				status = "rectDrawing";
			} else if (status == "object") {
				ObjectIcon(XY,"drawing");
			} else if (nearest ||  status == 'none' ) {
				console.log("none nearest");
				selectLine();
			}
			if (status == "none" || status == "image") {
				console.log("none image");
				//status = "image"; 
				selectIcon(XY);
				
			} 
			//선택자 행위
			/* if(updateTemp){
			} */
			/////////
			downXY = XY;
			//status 확인
			$("#status").val("mousedown => " + status);
		});

		//마우스를 땔시
		$("#rightCanvas").on("mouseup", function(e) {
			e.preventDefault();
			//XY = mouseXY(e);
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
			} else if (clickE && status == 'filling') {
				status = "fill"; //status값 원귀
			//createLine(downXY,XY,'rectCreate');
			}
			//drawAllLines(lines);
			////////
			//edge=[];
			clickE = false;
			//status 확인
			$("#status").val("mouseup => "+status);
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
			if (status == "object") {
				ObjectIcon(XY, "drawing");
			}
			//line//
			if (clickE && status == 'lineDrawing') { //그리는 도중의 status값 lineDrawing
				//선 길이 출력 기능
				px = getLineLength(downXY, XY, scale); //....................................
				ctx.save();
				ctx.font = "15px Comic Sans MS";
				ctx.fillStyle = "blue";
				ctx.fillText(px + "Meters", XY.x, XY.y);
				createLine(downXY, XY, 'drawing');
				ctx.restore();
			}
			if (clickE && status == 'rectDrawing') { //그리는 도중의 status값 lineDrawing
				//iconState.valid = false;
				createLine(downXY, XY, 'drawing');
			}
		////////
			//status 확인
			$("#status").val("mousemove =>" +status);
		});
		
		//마우스 휠 이벤트
		
		$("#rightCanvas").on("mousewheel",function(e){
			e.preventDefault();
			var E = e.originalEvent.deltaY;
	    	 redrawAll();
	         if (E<0) {
	             if(status=="object"){
	            	 if(count<80) count++;
		     		 ObjectIcon(XY,"drawing");
	   	         } else if(status=="image" && iconState.selection ){
			           seta +=5;
			           iconState.selection.rotateTable = seta;
			           redrawAll();
		         }
		     }else{
		         //wheel = "dwon";
			             if(status=="object"){
			            	 if(count>30){
			            		 count--;
			            		 console.log(count);
			            	 }
			     			 ObjectIcon(XY,"drawing");
			             }
			             else if(status=="image" && iconState.selection ){
			            	 seta -=5;
			            	 iconState.selection.rotateTable = seta;
			            	 redrawAll();
			             }
			         };
			         console.log(seta);
			         
			    });
	}); // 첫번째 ready end
</script>
</head>
<body>
	<div>
		<input type="button" id="line" value="선그리기" /> 
		<select id="select">
			<option value="3" selected="selected">3</option>
			<option value="5">5</option>
		</select>
		<select id="selectColor">
			<option value="black" selected="selected">검정색</option>
			<option value="grey">회색</option>
		</select> 
		<input type="button" id="rectangle" value="사각형" />
		<select id="fillColor">
			<option value="#FFFFFF" selected="selected">White</option>
			<option value="black">Black</option>
			<option value="yellow">Yellow</option>
			<option value="#cc9966">whiteBrown</option>
			<option value="#a6a6a6">Gray</option>
		</select> <input type="button" value="라인스텝" /> <select id="lineStep">
			<option value="70">미세</option>
			<option value="300" selected="selected">보통</option>
			<option value="700">확대</option>
		</select> <input type="button" id="object" value="생성" /> 
		<select id="objectBox">
			<option value="door">문</option>
			<option value="window" selected="selected">창문</option>
		</select>
		<!-- Scale
		<select id="canvasScale">
			<option value="원룸" selected="selected">원룸</option>
			<option value="투룸" >투룸</option>
			<option value="아파트" >아파트</option>
		</select> -->
		<input type="button" value="clear" id="clearCanvas" />
		<span>
			<form action="loadCanvas" method="post" name="loadDataForm">
				<input type="text" name="datanum" id="datanum" />
				<input type="button" value="불러오기" id="loadCanvasData"/>
			</form>
		</span>
		<span>status<input type="text" id="status" /></span>
		<div id="btn">
			<input type="button" class="buttonImage" btn-num="singleBed" value="singleBed" />
			<input type="button" class="buttonImage" btn-num="doubleBed" value="doubleBed" />
			<input type="button" class="buttonImage" btn-num="toilet" value="toilet" /> 
			<input type="button" class="buttonImage" btn-num="triBath" value="triBath" />
			<input type="button" class="buttonImage" btn-num="rectBath" value="rectBath" />
			<input type="button" class="buttonImage" btn-num="shower" value="shower" />
			<input type="button" class="buttonImage" btn-num="washstand" value="washstand" />
			<input type="button" class="buttonImage" btn-num="microwave" value="microwave" />
			<input type="button" class="buttonImage" btn-num="oven" value="oven" />
			<input type="button" class="buttonImage" btn-num="kitchenSink" value="kitchenSink" />
			<input type="button" class="buttonImage" btn-num="singleDoorRefriger" value="singleDoorRefriger" />
			<input type="button" class="buttonImage" btn-num="doubleDoorRefriger" value="doubleDoorRefriger" />
			<input type="button" class="buttonImage" btn-num="desk" value="desk" />
			<input type="button" class="buttonImage" btn-num="bookShelve" value="bookShelve" />
			<input type="button" class="buttonImage" btn-num="shoeCloset" value="shoeCloset" />
			<input type="button" class="buttonImage" btn-num="drum" value="drum" />
			<input type="button" class="buttonImage" btn-num="door" value="door" />
			<input type="button" class="buttonImage" btn-num="washingMachine" value="washingMachine" />
			<input type="button" class="buttonImage" btn-num="airconditioner" value="airconditioner" />
			<input type="button" class="buttonImage" btn-num="gasStove2" value="gasStove2" />
			<input type="button" class="buttonImage" btn-num="gasStove4" value="gasStove4" />
			<input type="button" class="buttonImage" btn-num="stoveVent" value="stoveVent" />
			<input type="button" class="buttonImage" btn-num="vent" value="vent" />
			<input type="button" class="buttonImage" btn-num="wardrobe" value="wardrobe" />
			<input type="button" class="buttonImage" btn-num="tv" value="tv" />
			<input type="button" class="buttonImage" btn-num="sofa1" value="sofa1" />
			<input type="button" class="buttonImage" btn-num="sofa2" value="sofa2" />
			<input type="button" class="buttonImage" btn-num="sofa4" value="sofa4" />
			<input type="button" class="buttonImage" btn-num="diningTable" value="diningTable" />
			<input type="button" class="buttonImage" btn-num="table1" value="table1" />
			<input type="button" class="buttonImage" btn-num="table2" value="table2" />
		</div>
		<a href="#" class="button" id="btn-download" download="Floorplan.png">데이터 저장 및 이미지 다운로드</a>
	</div>
	<!-- 동서남북 아이콘 -->
	<div class="box">
		<!-- <div class="img"></div> -->
		<canvas id="leftCanvas" width="250" height="650">
    		Menu InterFacs
  		</canvas>
		<div style="position: relative">
			<canvas id="rightCanvas" width="1000" height="650">
      		FloorPlan Canvas
	   	</canvas>
			<img src="" id="mirror" class="canvas__mirror" width="1000"
				height="650" />
		</div>
	</div>

</body>
</html>