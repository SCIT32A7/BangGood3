/*
 * Canvas Floorplan 
 */

function init() {
	canvas = $("#rightCanvas")[0];
	ctx = canvas.getContext("2d");
	mirror = $("#mirror");
	select = $("#select");
	fillColor = $("#fillColor");
	status = 'none';
	LW = selector();
	fixed = fixLine(LW);
	offsetReload();
	lineEdgeStep = 300;
	lineColor="black";
	iconState = new IconState();
	drawGrid(ctx, 'gray', Step); //그리드(캔버스객체값,색상,스텝)
	color = colorSelect();
	img = new Image();
	//이미지 불러오기(그려내기)
	img.onload = function() {
		var width = img.width;
		var height = img.height;
		var icon = new Icon(img,1150, 44.7, (width/1.5), (height/1.5), 0);
		icon.src = "assets/img/icons/direction.png";
		iconState.addIcon(icon);
		iconState.draw();
	}
	img.src = "assets/img/icons/direction.png";
}

//클리어 캔버스
function clearCanvas() {
	ctx.clearRect(0, 0, canvas.width, canvas.height);
}

function drawGrid(ctx, gridColor, gridStep) {
	ctx.save(); //context의 이전 설정값을 저장
	ctx.fillStyle = '#ffffff'; //채우기 색
	ctx.lineWidth = 0.5; //선두깨
	ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height); //채우기 위치값
	ctx.strokeStyle = gridColor; //선색
	ctx.globalAlpha = 0.4; //투명도

	//x축!!
	ctx.beginPath();
	for (var i = gridStep + 0.5; i < ctx.canvas.height; i += gridStep) {
		ctx.moveTo(0, i);
		ctx.lineTo(ctx.canvas.width, i);
	}
	ctx.closePath();
	ctx.stroke();

	//y축!!
	ctx.beginPath();
	for (var i = gridStep + 0.5; i < ctx.canvas.width; i += gridStep) {
		ctx.moveTo(i, 0);
		ctx.lineTo(i, ctx.canvas.height);
	}
	ctx.closePath();
	ctx.stroke();

	ctx.restore(); //저장된 설장값으로 복귀 : 그리드에 사용된 설정의 재사용 제한
}

function redrawAll() {
	clearCanvas();
	drawGrid(ctx, 'gray', Step); //그리드(캔버스객체값,색상,스텝)
	drawAllLines(lines);
	iconState.draw();
}

//selector value값 받아오기
function selector() {
	var result = $("#select option:selected").val();
	return result;
}

//축적 받아오기
function getScale() {
	var result = $("#canvasScale option:selected").val();
	console.log(result);
	return result;
}


//선의 두깨에 따른 마우스 좌표의 위치설정값 조절
function fixLine(LW) {
	var result = 0;
	if (LW == '3') {
		result = 0.3;
	} else if (LW == '5') {
		result = 0.5;
	} else if (LW == '10') {
		result = 0.5;
	}
	return result;
}

//선 색 반환
function selectLineColor() {
	var result = $("#selectColor option:selected").val();
	return result;
}

//채우기 색 반환
function colorSelect() {
	var result = $("#fillColor option:selected").val();
	return result;
}

//채우기 색 반환
function stepSelect() {
	var result = $("#lineStep option:selected").val();
	return result;
}

function selectObject() {
	var result = $("#objectBox option:selected").val();
	return result;
}

//캔버스 객체 좌표 영점조절
function offsetReload() {
	var offset = canvas.getBoundingClientRect();
	offsetX = offset.left;
	offsetY = offset.top;
}

//Draw드로잉 기능 모음
//draw 화면상에 저장된 그래픽객체 reDrawing
function drawAllLines(lines) {
	ctx.strokeStyle = "black";
	edge = []; //엣지 초기화 (삭제,수정시 재입력을 위한)
	//사각형 그리기 라인배열에서 사각형 타입의 선 발견시 4칸을 건너띈다
	for (var i = 0; i < lines.length; i++) {
		if (lines[i].type) {
			if (lines[i].type.substr(0, 4) == "rect") {
				var rectdate = ({ line1 : lines[i], line2 : lines[i + 3] });
				drawRect(rectdate);
				i += 3;
			} else if (lines[i].type == "line") {
				drawLine(lines[i]);
			}
		}
	}
	for (var i = 0; i < lines.length; i++) {
		if (lines[i].object) {
			var array = lines[i].object;
			for (var j = 0; j < array.length; j++) {
				ObjectIcon(array[j]);
			}
		}
	}
	//교차점 생성
	findIntersect();
	if(updateTemp){
		drawSelector(updateTemp);
		if(updateTemp.type=="door"||updateTemp.type=="window"){
			ObjectIcon(updateTemp,"select");
		}
	}
//꼭지점,교차점 확인용
/*for(var i=0; i<edge.length; i++){
		        	//drawPoint(intersects[i]);
		        	drawPoint(edge[i]);
} */
	//console.log(JSON.stringify(lines));
	
}

//라인 페인트 메소드
function linePaint(beginXY, endXY) {
	ctx.beginPath();
	ctx.moveTo(beginXY.x, beginXY.y);
	ctx.lineTo(endXY.x, endXY.y);
	ctx.closePath();
	ctx.lineJoin = "round";
	ctx.strokeStyle = lineColor;
	ctx.lineWidth = LW;
	ctx.stroke();
}

//사각형 페인트 메소드
function rectPaint(beginXY, endXY) {
	var tempXY1 = {x:endXY.x, y:beginXY.y};
	rectPx1 = getLineLength(beginXY, tempXY1, scale);
	var tempXY2 = {x:endXY.x, y:beginXY.y};
	rectPx2 = getLineLength(tempXY2, endXY, scale);
	
	ctx.save();
	ctx.beginPath();
	ctx.moveTo(beginXY.x, beginXY.y);
	ctx.lineTo(endXY.x, beginXY.y);
	ctx.lineTo(endXY.x, endXY.y);
	ctx.lineTo(beginXY.x, endXY.y);
	ctx.lineTo(beginXY.x, beginXY.y);
	ctx.font = "15px Comic Sans MS";
	ctx.fillStyle = "blue";
	ctx.fillText(rectPx1 + "Meters", (beginXY.x+endXY.x)/2, beginXY.y);
	ctx.fillText(rectPx2 + "Meters", endXY.x, (beginXY.y+endXY.y)/2);
	ctx.fillStyle = color;
	ctx.fill();
	ctx.closePath();
	ctx.lineJoin = "round";
	ctx.lineWidth = LW;
	ctx.stroke();
	ctx.restore();
}

//라인 그리기
//화면에 보여지는 이미지와 이미지의 정보
	function createLine(beginXY, endXY, stat) {
		//화면상에 마우스를 따라다니는 라인
		if (stat == 'drawing') {
			if (status == 'lineDrawing') {
				linePaint(beginXY, endXY, lineColor);
				var coordinate = {"x0" : beginXY.x, "y0" : beginXY.y, "x1" : endXY.x, "y1" : endXY.y};
				var slope = getSlope(beginXY, endXY);
				var line = { "coordinate" : coordinate, "slope" : slope };
				findIntersectWithMouse(line);
			} else if (status == 'rectDrawing') {
				rectPaint(beginXY, endXY);
				rect = rectDefined(beginXY, endXY);
				findIntersectWithMouse(rect.line1);
				findIntersectWithMouse(rect.line2);
				findIntersectWithMouse(rect.line3);
				findIntersectWithMouse(rect.line4);
			} 
		}
		//화면상에서 보이는 라인을 lines에 저장
		else if (stat == 'lineCreate') {
			linePaint(beginXY, endXY);
			var coordinate = {"x0" : beginXY.x,"y0" : beginXY.y,"x1" : endXY.x,"y1" : endXY.y};
			var slope = getSlope(beginXY, endXY);
			var line = {"coordinate" : coordinate, "slope" : slope, "lineWidth" : ctx.lineWidth, "type" : "line", length : px+"m", lineColor:lineColor};
			lines.push(line);
			inputUndo(line, "create");
		
		} else if (stat == 'rectCreate') {
			//사각형 저장
			rectPaint(beginXY, endXY);
			var rect = rectDefined(beginXY, endXY);
			lines.push({"coordinate" : rect.line1.coordinate,"slope" : rect.line1.slope,"lineWidth" : LW,"type" : "rect1","color" : color, "length":rectPx1+"m"});
			lines.push({"coordinate" : rect.line2.coordinate,"slope" : rect.line2.slope,"lineWidth" : LW,"type" : "rect2","color" : color, "length":rectPx2+"m"});
			lines.push({"coordinate" : rect.line3.coordinate,"slope" : rect.line3.slope,"lineWidth" : LW,"type" : "rect3","color" : color, "length":rectPx1+"m"});
			lines.push({"coordinate" : rect.line4.coordinate,"slope" : rect.line4.slope,"lineWidth" : LW,"type" : "rect4","color" : color, "length":rectPx2+"m"});
			inputUndo(rect, "create");
		}
	}

//사각형에 속한 선의 좌표값과 기울기값을 라인 형식으로 반환
//top, right, left, bottom
	function rectDefined(beginXY, endXY) {
		var cd1 = {"x0" : beginXY.x,"y0" : beginXY.y,"x1" : endXY.x,"y1" : beginXY.y};
		var beginXY1 = {x : cd1.x0,y : cd1.y0},
			endXY1 = {x : cd1.x1,y : cd1.y1};
		var slope1 = getSlope(beginXY1, endXY1);
		var line1 = {"coordinate" : cd1,"slope" : slope1,"lineWidth" : LW,type : "rect1","color" : color, "length":rectPx1+"m"};

		var cd2 = {"x0" : endXY.x,"y0" : beginXY.y,"x1" : endXY.x,"y1" : endXY.y};
		var beginXY2 = {x : cd2.x0,y : cd2.y0},
			endXY2 = {x : cd2.x1,y : cd2.y1};
		var slope2 = getSlope(beginXY2, endXY2);
		var line2 = {"coordinate" : cd2,"slope" : slope2,"lineWidth" : LW,type : "rect2","color" : color, "length":rectPx2+"m"};

		var cd3 = {"x0" : beginXY.x,"y0" : beginXY.y,"x1" : beginXY.x,"y1" : endXY.y};
		var beginXY3 = {x : cd3.x0,y : cd3.y0},
			endXY3 = {x : cd3.x1,y : cd3.y1};
		var slope3 = getSlope(beginXY3, endXY3);
		var line3 = {"coordinate" : cd3,"slope" : slope3,"lineWidth" : LW,type : "rect3","color" : color, "length":rectPx1+"m"};

		var cd4 = {"x0" : beginXY.x,"y0" : endXY.y,"x1" : endXY.x,"y1" : endXY.y};
		var beginXY4 = {x : cd4.x0,y : cd4.y0},
			endXY4 = {x : cd4.x1,y : cd4.y1};
		var slope4 = getSlope(beginXY4, endXY4);
		var line4 = {"coordinate" : cd4,"slope" : slope4,"lineWidth" : LW,type : "rect4","color" : color, "length":rectPx2+"m"};

		return {line1 : line1, line2 : line2, line3 : line3, line4 : line4, type : "rect"};
	}

function fillRect(beginXY, endXY) {
	ctx.save();
	ctx.beginPath();
	ctx.closePath();
	ctx.stroke();
	ctx.restore();
}

//저장된 라인업 그리기 실질적인 뷰단
function drawLine(line) {
	ctx.beginPath();
	ctx.moveTo(line.coordinate.x0, line.coordinate.y0);
	ctx.lineTo(line.coordinate.x1, line.coordinate.y1);
	ctx.closePath();
	ctx.lineWidth = line.lineWidth;
	if(line.type == "line") {
		ctx.save();
		ctx.strokeStyle = line.lineColor;
		ctx.stroke();
		ctx.restore();
	} else {
		ctx.stroke();
	}
	//길이 텍스트 위치 선정
	var x = (line.coordinate.x0 + line.coordinate.x1) / 2;
	var y = (line.coordinate.y0 + line.coordinate.y1) / 2;
	ctx.save();
	ctx.font = "15px Comic Sans MS";
	ctx.fillStyle = "green";
	if (line.slope == 0) {
		ctx.fillText(line.length, x, y - 10);
	} else if (Number.isFinite(line.slope)) {
		ctx.fillText(line.length, x + 10, y);
	} else {
		ctx.fillText(line.length, x + 10, y - 10);
	}
	ctx.restore();
	edge.push({
		x : line.coordinate.x0,
		y : line.coordinate.y0
	});
	edge.push({
		x : line.coordinate.x1,
		y : line.coordinate.y1
	});
}

function drawRect(rect) {
	ctx.save();
	ctx.beginPath();
	ctx.moveTo(rect.line1.coordinate.x0, rect.line1.coordinate.y0);
	ctx.lineTo(rect.line1.coordinate.x1, rect.line1.coordinate.y0);
	ctx.lineTo(rect.line2.coordinate.x1, rect.line2.coordinate.y1);
	ctx.lineTo(rect.line2.coordinate.x0, rect.line2.coordinate.y0);
	ctx.lineTo(rect.line1.coordinate.x0, rect.line1.coordinate.y0);
	
	ctx.fillStyle = rect.line1.color;
	ctx.fill();
	ctx.closePath();
	ctx.lineJoin = "round";
	ctx.lineWidth = rect.line1.lineWidth;
	ctx.stroke();
	
	ctx.font = "15px Comic Sans MS";
	ctx.fillStyle = "green";
	ctx.fillText(rect.line1.length, (rect.line1.coordinate.x0+rect.line1.coordinate.x1)/2, rect.line1.coordinate.y0);
	ctx.fillText(rect.line2.length, rect.line1.coordinate.x1, (rect.line1.coordinate.y1 +rect.line2.coordinate.y1)/2 );
	ctx.fillText(rect.line1.length, (rect.line2.coordinate.x0 + rect.line2.coordinate.x1)/2, (rect.line2.coordinate.y0));
	ctx.textAlign = "end";
	ctx.fillText(rect.line2.length, rect.line1.coordinate.x0,  (rect.line2.coordinate.y0 +rect.line1.coordinate.y0)/2 );
	ctx.restore();
	edge.push({
		x : rect.line1.coordinate.x0,
		y : rect.line1.coordinate.y0
	});
	edge.push({
		x : rect.line2.coordinate.x1,
		y : rect.line1.coordinate.y0
	});
	edge.push({
		x : rect.line2.coordinate.x1,
		y : rect.line2.coordinate.y1
	});
	edge.push({
		x : rect.line1.coordinate.x0,
		y : rect.line2.coordinate.y1
	});
}


//선상의 위치 표시용 원점
function drawPoint(intersect) {
	ctx.save();
	ctx.beginPath();
	ctx.arc(intersect.x, intersect.y, 3, 0, Math.PI * 2);
	ctx.strokeStyle = 'red';
	ctx.lineWidth = 1.5;
	ctx.stroke();
	ctx.restore();
}


//선택된 객체의 꼭지점을 드로우 하는 메소드
function drawSelector(point) {
	ctx.save();
	ctx.beginPath();
	console.log("drawSelector => "+ JSON.stringify(point));
	if (point.type == "line") {
		ctx.moveTo(point.line.x0, point.line.y0);
		ctx.arc(point.line.x0, point.line.y0, 4, 0, Math.PI * 2);
		ctx.fill();
		ctx.fillStyle = "white";

		ctx.moveTo(point.line.x1, point.line.y1);
		ctx.arc(point.line.x1, point.line.y1, 4, 0, Math.PI * 2);
		ctx.fill();
		ctx.fillStyle = "white";
	} else if (point.type.substr(0, 4) == "rect") {
		var line1 = point.line1.coordinate,
			line2 = point.line2.coordinate,
			line3 = point.line3.coordinate,
			line4 = point.line4.coordinate;
		//11
		ctx.moveTo(line1.x0, line1.y0);
		ctx.arc(line1.x0, line1.y0, 4, 0, Math.PI * 2);
		ctx.fill();
		ctx.fillStyle = "white";
		//2
		ctx.moveTo(line2.x0, line2.y0);
		ctx.arc(line2.x0, line2.y0, 4, 0, Math.PI * 2);
		ctx.fill();
		ctx.fillStyle = "white";
		//5
		ctx.moveTo(line3.x1, line3.y1);
		ctx.arc(line3.x1, line3.y1, 4, 0, Math.PI * 2);
		ctx.fill();
		ctx.fillStyle = "white";
		//7
		ctx.moveTo(line4.x1, line4.y1);
		ctx.arc(line4.x1, line4.y1, 4, 0, Math.PI * 2);
		ctx.fill();
		ctx.fillStyle = "white";
	}
	ctx.strokeStyle = 'black';
	ctx.lineWidth = 1;
	ctx.stroke();
	ctx.restore();
}

/*
* 이미지 기능............................................................................................................
*/
//아이콘 생성자
function Icon(img, x, y, width, height, rotateTable) {
	this.img = img;
	this.src;
	this.x = x;
	this.y = y;
	this.width = width;
	this.height = height;
	this.right = this.x + this.width;
	this.bottom = this.y + this.height;
	this.rotateTable = rotateTable; 
}

function insertLoadedValueToIcon(icon, img, value) {
	icon.img = img;
	icon.src = value.src;
	icon.x = value.x;
	icon.y = value.y;
	icon.width = value.width;
	icon.height = value.height;
	icon.right = value.right;
	icon.bottom = value.bottom;
	icon.rotateTable = value.rotateTable;
	
	return icon;
}

/*
* 아이콘 상태 컬랙션....................................
*/
//캔버스에 그려진 이미지를 가지고 있는 부모 생성자
function IconState() {
	//상태 추적
	this.isRemovable = false;
	this.icons = [];
	this.dragging = false;
	this.selection = null;
	this.dragOffX = 0; //이동 추적을 위한 위치 좌표 X
	this.dragOffY = 0; //이동 추적을 위한 위치 좌표 Y
	//var myState = this; //지금 IconState 객체를 의미
	// **** Options ****
	this.selectionColor = 'green';
	this.selectionWidth = 2;
}

//icon 선택
function selectIcon(){
	var icons = iconState.icons;
	var l = icons.length;
	console.log("selectIcon Length => "+ l);	
	for (var i = l - 1; i >= 0; i--) {
		console.log("마우스 좌표 :" + XY.x + "/"+ XY.y);
		if (icons[i].isOnIcon(XY.x, XY.y)) { //바운더리 체크 기능 수행 true/false
			var mySel = icons[i]; //현재 선택된 아이콘 객체  (mySel.y -mySel.img.height/4)
			iconState.dragoffx = XY.x - mySel.x;
			iconState.dragoffy = XY.y - mySel.y;
			iconState.dragging = true;
			iconState.selection = mySel; //현재 마우스로 선택한 대상을 상태에 넣기
			iconState.isRemovable = true;
			updateTemp = {type : "icon"};
			status = "image";//........................................추가
			return;
		}
	}
		
		//아이콘이 아닌 대상을 클릭할 때
	if (iconState.selection) {
		draggingResizer = anchorHitTest(XY.x, XY.y, iconState.selection);
		//꼭지점 앵커를 건드리지 않은 경우
		if(draggingResizer == -1) {
			iconState.selection = null;
			iconState.isRemovable = false;
			updateTemp = null;
			status = "none";//................................................추가
		}
	}
};
function iconCtrl(XY){
	if (draggingResizer > -1) {
		//console.log("Resizer");
		var icon = iconState.selection;
		var degree = icon.rotateTable;
		var seta = pi / (180.0 / degree );
		var mouse = XY;
		//x((x1-x0)*Math.cos(seta)-(y1-y0)*Math.sin(seta)+x0), 
		//y((x1-x0)*Math.sin(seta)+(y1-y0)*Math.cos(seta)+y0);
		var mx = (mouse.x-icon.x)*Math.cos(-seta)-(mouse.y-icon.y)*Math.sin(-seta)+icon.x;
		var my = (mouse.x-icon.x)*Math.sin(-seta)+(mouse.y-icon.y)*Math.cos(-seta)+icon.y;
		// resize the image
		switch (draggingResizer) { //(icon.x -icon.img.width/4) 
		case 0: //top-left
			icon.width = ((icon.x-icon.width/2)-mx) + icon.width;
			icon.height = ((icon.y-icon.height/2)-my) + icon.height;
			var tempX = (mx+icon.width/2-icon.x)*Math.cos(seta)-(my+icon.height/2-icon.y)*Math.sin(seta)+icon.x;
		    var tempY = (mx+icon.width/2-icon.x)*Math.sin(seta)+(my+icon.height/2-icon.y)*Math.cos(seta)+icon.y;
		    icon.x = tempX;
		    icon.y = tempY;
			break;
		case 1: //top-right
			icon.width = (mx-(icon.x+icon.width/2)) + icon.width;
			icon.height = ((icon.y-icon.height/2)-my) + icon.height;
			var tempX = (mx-icon.width/2-icon.x)*Math.cos(seta)-(my+icon.height/2-icon.y)*Math.sin(seta)+icon.x;
		    var tempY = (mx-icon.width/2-icon.x)*Math.sin(seta)+(my+icon.height/2-icon.y)*Math.cos(seta)+icon.y;
		    icon.x = tempX;
		    icon.y = tempY;
			break;
		case 2: //bottom-right
			icon.width = (mx-(icon.x+icon.width/2)) + icon.width;
			icon.height = (my-(icon.y+icon.height/2)) + icon.height;
			var tempX = (mx-icon.width/2-icon.x)*Math.cos(seta)-(my-icon.height/2-icon.y)*Math.sin(seta)+icon.x;
		    var tempY = (mx-icon.width/2-icon.x)*Math.sin(seta)+(my-icon.height/2-icon.y)*Math.cos(seta)+icon.y;
		    icon.x = tempX;
		    icon.y = tempY;
			break;
		case 3: //bottom-left
			icon.width = ((icon.x-icon.width/2)-mx) + icon.width;
			icon.height = (my-(icon.y+icon.height/2)) + icon.height;
			var tempX = (mx+icon.width/2-icon.x)*Math.cos(seta)-(my-icon.height/2-icon.y)*Math.sin(seta)+icon.x;
		    var tempY = (mx+icon.width/2-icon.x)*Math.sin(seta)+(my-icon.height/2-icon.y)*Math.cos(seta)+icon.y;
		    icon.x = tempX;
		    icon.y = tempY;
			break;
		}

		// 사용자의 역방향 사용 시도 제어
		if (icon.width < 25) {
			icon.width = 25;
		}
		if (icon.height < 25) {
			icon.height = 25;
		}

		// 아이콘 우상단과 우하단 세팅
		icon.right = icon.x + icon.width;
		icon.bottom = icon.y + icon.height;
	} else if (iconState.dragging) {
		var mouse = XY;
		iconState.selection.x = mouse.x - iconState.dragoffx;
		iconState.selection.y = mouse.y - iconState.dragoffy;
	}
	redrawAll();
	
	};

//이미지 꼭지점 앵커 그리기........................................수정
	function drawDragAnchor(x, y, edgeName) {
		ctx.save();
		ctx.beginPath();
		ctx.arc(x, y, resizerRadius, 0, pi2, false);
		ctx.closePath();
		ctx.stroke();
		ctx.restore();
	}


//4개의 각 꼭지점을 선택했을 때
		function anchorHitTest(mouseX, mouseY, mySel) {
			var dx,dy;
			var degree = mySel.rotateTable;
			var seta = pi / (180.0 / degree );
			var x0 = mySel.x;
			var y0 = mySel.y;
			var x1 = mySel.x-mySel.width/2;
			var y1 = mySel.y-mySel.height/2;
			var x2 = mySel.x+mySel.width/2;
			var y2 = mySel.y+mySel.height/2;
			var mx = (mouseX-x0)*Math.cos(-seta)-(mouseY-y0)*Math.sin(-seta)+x0;
			var my = (mouseX-x0)*Math.sin(-seta)+(mouseY-y0)*Math.cos(-seta)+y0;
		// top-left
			dx = x1 - mx;
			dy = y1 - my;
			if (dx * dx + dy * dy <= rr) {
				return (0);
			}
		// top-right
			dx = x2 - mx;
			dy = y1 - my;
			if (dx * dx + dy * dy <= rr) {
				return (1);
			}
		// bottom-right
			dx = x2 - mx;
			dy = y2 - my;
			if (dx * dx + dy * dy <= rr) {
				return (2);
			}
		// bottom-left
			dx = x1 - mx;
			dy = y2 - my;
			if (dx * dx + dy * dy <= rr) {
				return (3);
			}
			return (-1);
		}


/*
* 구체적 직선의 방정식을 사용한 기능 모음...........................................
*/
//그려진 선의 교차점의 좌표
function findIntersect() {
	var intersectXY = 0;
	for (var i = 0; i < lines.length; i++) {
		for (var j = i + 1; j < lines.length; j++) {
			intersectXY = getLineIntersect(lines[i].coordinate, lines[i].slope, lines[j].coordinate, lines[j].slope);
			if (intersectXY != 0) {
				edge.push(intersectXY);
			}
		}
	}
}

//마우스 좌표에서 가까운 선상의 좌표
//getCloseXYToMouse사용
function findNearestLine(mouseXY) {
	//var intersectXY = 0;
	var dist = lineEdgeStep;
	var Temp = '';
	var index = 0;
	var beginXY, endXY, pt = 0;
	objectTemp = null;
	for (var i = 0; i < lines.length; i++) {
		beginXY = { x : lines[i].coordinate.x0, y : lines[i].coordinate.y0 };
		endXY = { x : lines[i].coordinate.x1, y : lines[i].coordinate.y1 };
		if(lines[i].object){
			for(var j=0;j<lines[i].object.length;j++){
				var result = isObjectIcon(lines[i].object[j]);
				if(result)objectTemp=lines[i].object[j];
				//else objectTemp = null;
			}
		}
		var xy = getCloseXYToMouse(beginXY, endXY, mouseXY);
		var dx = mouseXY.x - xy.x;
		var dy = mouseXY.y - xy.y;
		var thisDist = dx * dx + dy * dy;
		//반복문을 통해 거리가 가장 가까운 객체 검색
		if (thisDist < dist) {
			dist = thisDist;
			pt = xy;
			Temp = { x0 : beginXY.x, y0 : beginXY.y, x1 : endXY.x, y1 : endXY.y, type : lines[i].type };
			index = i;
		}
	}

	if (Temp.type == "rect1" || Temp.type == "rect2" || Temp.type == "rect3" || Temp.type == "rect4") selectRect(Temp, index);
	else  lineTemp = { line : Temp, type : "line" }; 
	return pt;
}

//꼭지점 라인 엣지
function edgeStep(mouseXY) {
	var dist = lineEdgeStep;
	//var Temp='';
	var index;
	var beginXY, endXY, pt = 0;
	for (var i = 0; i < edge.length; i++) {
		var thisDist, xy = '';
		var lineX = { x0 : 0, y0 : edge[i].y, x1 : ctx.canvas.width, y1 : edge[i].y };
		var lineY = { x0 : edge[i].x, y0 : 0, x1 : edge[i].x, y1 : ctx.canvas.height };
		var x = getCloseXYToMouse({ x : lineX.x0, y : lineX.y0}, { x : lineX.x1, y : lineX.y1 }, mouseXY);
		var xx = mouseXY.x - x.x;
		var xy = mouseXY.y - x.y;
		var DistX = xx * xx + xy * xy;
		var y = getCloseXYToMouse({ x : lineY.x0, y : lineY.y0 }, { x : lineY.x1, y : lineY.y1}, mouseXY);
		var yx = mouseXY.x - y.x;
		var yy = mouseXY.y - y.y;
		var DistY = yx * yx + yy * yy;
		//반복문을 통해 거리가 가장 가까운 객체 검색
		if (DistX > DistY) {
			thisDist = DistY;
			xy = y;
		} else if (DistX < DistY) {
			thisDist = DistX;
			xy = x;
		}
		if (thisDist < dist) {
			dist = thisDist;
			pt = xy;
			//Temp = {x0:beginXY.x,y0:beginXY.y,x1:endXY.x,y1:endXY.y,type:lines[i].type};
			index = i;
			ctx.save();
			ctx.setLineDash([ 5, 3 ]);
			ctx.strokeStyle = "red";
			ctx.lineWidth = 0.5;
			ctx.moveTo(edge[i].x, edge[i].y);
			ctx.lineTo(xy.x, xy.y);
			ctx.stroke();
			ctx.restore();
		}
	}
	return pt;
}

//사각형 용 선택자 함수
//JSON 객체 top, right, left, bottom 순서
function selectRect(Temp,index){
	  if(Temp.type=="rect1"){
		  lineTemp = {line1:lines[index],line2:lines[index+1],line3:lines[index+2],line4:lines[index+3],type:"rect1"};
	  }
	  else if(Temp.type=="rect2"){
		  lineTemp = {line1:lines[index-1],line2:lines[index],line3:lines[index+1],line4:lines[index+2],type:"rect2"};
	  }
	  else if(Temp.type=="rect3"){
		  lineTemp = {line1:lines[index-2],line2:lines[index-1],line3:lines[index],line4:lines[index+1],type:"rect3"};
	  }
	  else if(Temp.type=="rect4"){
		  lineTemp = {line1:lines[index-3],line2:lines[index-2],line3:lines[index-1],line4:lines[index],type:"rect4"};
	  }
};

//마우스로 드로우잉 중인 라인에 겹쳐지는 점
function findIntersectWithMouse(line) {
	var intersectXY = 0;
	for (var i = 0; i < lines.length; i++) {
		intersectXY = getLineIntersect(line.coordinate, line.slope, lines[i].coordinate, lines[i].slope);
		if (intersectXY != 0) {
			drawPoint(intersectXY);
		}
	}
}


//직선 기울기 계산
//주의: 캔버스 상에서 y축은 기본 방정식과 상하 반전이 되어 있기 때문에 begin - end이어야 함! (end - begin)
function getSlope(beginXY, endXY) {
	var numerator = 0;
	var denominator = 0;
	var nud = getNumAndDenominatior(beginXY, endXY);
	var slope = nud.n / nud.d;
	return slope;
}

function getNumAndDenominatior(beginXY, endXY) {
	var numerator = 0;
	var denominator = 0;
	denominator = beginXY.x - endXY.x;
	numerator = beginXY.y - endXY.y;
	return { n : numerator, d : denominator };
}

//마우스 좌표 근처에 있는 선상의 좌표값
//findNearestLine으로부터 요청
function lerp(a, b, x) {
	return (a + x * (b - a));
}

function getCloseXYToMouse(beginXY, endXY, mouseXY) {
	var x0 = beginXY.x;
	var y0 = beginXY.y;
	var x1 = endXY.x;
	var y1 = endXY.y;
	var dx = x1 - x0;
	var dy = y1 - y0;
	var t = ((mouseXY.x - x0) * dx + (mouseXY.y - y0) * dy) / (dx * dx + dy * dy);
	t = Math.max(0, Math.min(1, t));
	var x = lerp(x0, x1, t);
	var y = lerp(y0, y1, t);
	return ({x : x,y : y});
}

function getIntersectXY(intersectX, intersectY) {
	var result = {};
	result.x = intersectX;
	result.y = intersectY;
	return result;
}

function check_and_reverseCoordinate(point1, point2) {
	//두번째 XY좌표가 첫번째 좌표보다 좌측에 위치에 있을때
	var tempXY = {};
	if (point2.y0 > point2.y1) {
		tempXY.x = point2.x0;
		tempXY.y = point2.y0;
		point2.x0 = point2.x1;
		point2.y0 = point2.y1;
		point2.x1 = tempXY.x;
		point2.y1 = tempXY.y;

	}
	if (point1.y0 > point1.y1) {
		tempXY.x = point1.x0;
		tempXY.y = point1.y0;
		point1.x0 = point1.x1;
		point1.y0 = point1.y1;
		point1.x1 = tempXY.x;
		point1.y1 = tempXY.y;
	}
	return [ point1, point2 ];
}

//두 직선 중 기울기가 세로 직선(Infinity)이 있는 경우
function calculateIntersectPoint(intersectX, intersectY, point1, point2) {
	var result = {};
	if ((intersectY >= point2.y0) && (intersectY <= point2.y1)) {
		if ((intersectY >= point1.y0) && (intersectY <= point1.y1)) {
			result = getIntersectXY(intersectX, intersectY);
		}
	}
	return result;
}

//두 직선의 곱이 -1인 경우(한 점에서 마주치는 경우)
function calculateIntersectPoint2(intersectX, intersectY, point1, point2) {
	var result = {};
	var tempXY = {};
	//두번째 XY좌표가 첫번째 좌표보다 좌측에 위치에 있을때
	if (point2.x0 > point2.x1) {
		tempXY.x = point2.x0;
		tempXY.y = point2.y0;
		point2.x0 = point2.x1;
		point2.y0 = point2.y1;
		point2.x1 = tempXY.x;
		point2.y1 = tempXY.y;

	}
	if (point1.x0 > point1.x1) {
		tempXY.x = point1.x0;
		tempXY.y = point1.y0;
		point1.x0 = point1.x1;
		point1.y0 = point1.y1;
		point1.x1 = tempXY.x;
		point1.y1 = tempXY.y;
	}
	//화면 상에서 나타는 선의 범위 내에서 충돌 지점만 출력
	if ((intersectX >= point1.x0) && (intersectX <= point1.x1)) {
		if ((intersectX >= point2.x0) && (intersectX <= point2.x1)) {
			result = getIntersectXY(intersectX, intersectY);
		}
	}
	return result;
}

//두 직선의 충돌 지점 알아내기
function getLineIntersect(point1, slope1, point2, slope2) {
	//console.log("finding intersect...");
	var intersectX,
		intersectY,
		y_intercept = 0;
	var result = {};
	//기울기가 무제한인 경우(세로 직선 x=a)
	if (!Number.isFinite(slope1)) {
		//console.log("첫번째 직선 무제한");
		var points = check_and_reverseCoordinate(point1, point2);
		point1 = points[0];
		point2 = points[1];
		y_intercept = point2.y0 - slope2 * point2.x0;
		intersectX = point1.x0;
		intersectY = slope2 * intersectX + y_intercept;
		if (slope2 == 0) {
			if ((intersectY >= point1.y0) && (intersectY <= point1.y1)) {
				if ((intersectX >= point2.x0) && (intersectX <= point2.x1)) {
					result = getIntersectXY(intersectX, intersectY);
				}
			}
		} else {
			result = calculateIntersectPoint(intersectX, intersectY, point1, point2);
		}
	} else if (!Number.isFinite(slope2)) {
		//console.log("두번째 직선 무제한");
		var points = check_and_reverseCoordinate(point1, point2);
		point1 = points[0];
		point2 = points[1];
		y_intercept = point1.y0 - slope1 * point1.x0;
		intersectX = point2.x0;
		intersectY = slope1 * intersectX + y_intercept;
		if (slope1 == 0) {
			if ((intersectY >= point2.y0) && (intersectY <= point2.y1)) {
				if ((intersectX >= point1.x0) && (intersectX <= point1.x1)) {
					result = getIntersectXY(intersectX, intersectY);
				}
			}
		} else {
			result = calculateIntersectPoint(intersectX, intersectY, point1, point2);
		}
	} else if (slope1 != slope2) { //기울기가 서로 다른 직선은 충돌 지점 발생
		//console.log("서로 다른 기울기");
		intersectX = ((slope1 * point1.x0) - (slope2 * point2.x0) + point2.y0 - point1.y0) / (slope1 - slope2);
		intersectY = slope1 * (intersectX - point1.x0) + point1.y0;
		result = calculateIntersectPoint2(intersectX, intersectY, point1, point2);
	}
	//그 외 일치하는 직선(무제한 충돌)과 서로 평행하는 직선은 고려하지 않음
	return result;
}

//크로스헤어...............................//
function crossHair(XY) {
	redrawAll();

	ctx.save();
	//x축
	ctx.beginPath();
	ctx.moveTo(0, XY.y);
	ctx.lineTo(ctx.canvas.width, XY.y);
	//y축
	ctx.moveTo(XY.x, 0);
	ctx.lineTo(XY.x, ctx.canvas.height);
	ctx.setLineDash([ 2, 1 ]);
	ctx.lineWidth = 0.75;
	ctx.strokeStyle = "#ff8000";
	ctx.stroke();
	ctx.beginPath();
	ctx.restore();

	return;
}

/*
* System...............................................................
*/
//길이 계산
function getLineLength (startXY, endXY, scale) {
	//그리드 한칸 10px
	var length = 0;
	var lengthRound= 0;
	var px = Math.sqrt(Math.pow(endXY.x * 1 - startXY.x * 1, 2) + Math.pow(endXY.y * 1 - startXY.y * 1, 2));
	switch(scale) {
	case "1": //원룸용 사이즈
		length = px/9/10;
		lengthRound = length.toFixed(2);
		break;
	case "2": //투룸용 사이즈
		length = px/5/10;
		lengthRound = length.toFixed(2);
		break;
	case "3": //아파트용 사이즈
		length = px/2/10;
		lengthRound = length.toFixed(2);
		break;
	}
	return lengthRound;
}

//Redo & Undo
//Undo임시 저장 공간
function inputUndo(temp, req) {
	var temp = JSON.stringify(temp);
	if (Undo.length < 15) {
		Undo.push({data : JSON.parse(temp),req : req});
	} else if (Undo.length >= 15) {
		Undo.splice(0, 1);
		Undo.push({data : temp,req : req});
	}
	//console.log(JSON.stringify(Undo));
}

//Undo임시 저장 공간에서 호출
function getUndo(data) {
	if (data.req == "create") {
		removeData(data.data);
	} else if (data.req == "delete") {
		recreateData(data.data);
	} else if (data.req == "move"){
		moveData(data.data);
	}
}

//Redo임시 저장 공간에서 호출
function getRedo(data) {
	if (data.req == "create") {
		recreateData(data.data);
	} else if (data.req == "delete") {
		removeData(data.data);
	} else if (data.req == "move"){
		moveData(data.data);
	}
}

function moveData(data){
	var Temp = '';
	var index = 0;
	if(data.data.type=="door"||data.data.type=="window"){
		Temp = (lines[data.data.index].object[data.index]);
		lines[data.data.index].object[data.index]=data.data;
		data.data = Temp;
	}
}

//화면 상에서 드로우 된 객체를 지울때
function removeData(data) {
	if (data.type == "line") {
		for (var i = 0; i < lines.length; i++) {
			if (JSON.stringify(lines[i].coordinate) == JSON.stringify(data.coordinate)) lines.splice(i, 1);
		}
	} else if (data.type == "rect") {
		for (var i = 0; i < lines.length; i++) {
			//console.log(JSON.stringify(data));
			if (JSON.stringify(lines[i].coordinate) == JSON.stringify(data.line1.coordinate)) lines.splice(i, 4);
		}
	} else if(data.type == "icon"){
		iconState.removeIcon(data.data);
		iconState.selection = null;
	} else if(data.type=="door"||data.type=="window"){
		var array = lines[data.index].object;
		for(var i=0;i<array.length;i++){
			//console.log(JSON.stringify(array[i]));
			//console.log(JSON.stringify(data));
			if(JSON.stringify(array[i])==JSON.stringify(data)){
			  array.splice(i,1);
			  //lines[data.index].object = array;
			}
		}
	}
}

//화면상에 객체를 리드로우 할때
function recreateData(data) {
	if (data.type == "line") {
		lines.push(data);
	} else if (data.type == "rect") {
		lines.push(data.line1);
		lines.push(data.line2);
		lines.push(data.line3);
		lines.push(data.line4);
	} else if(data.type == "icon"){
		iconState.addIcon(data.data);
		iconState.selection = data.data;
	} else if(data.type=="door"||data.type=="window"){
		if(lines[data.index].object){
    		lines[data.index]['object'].push(data);
		}else {
			lines[data.index] = [];
		}
	} 
}

//라인 선택...........................
function selectLine() {
	if(!objectTemp){
		updateTemp = lineTemp;
	}
}

//아이콘 선택
function selectObjectIcon() {
	updateTemp = objectTemp;
}

function deleteRect(line) {
	for (var i = 0; i < lines.length; i++) {
		if (JSON.stringify(line.coordinate) == JSON.stringify(lines[i].coordinate)) {
			rect = {line1 : lines[i],line2 : lines[i + 1],line3 : lines[i + 2],line4 : lines[i + 3],type : "rect"};
			inputUndo(rect, "delete");
			lines.splice(i, 4);
		}
	}
}

//수정
function isObjectIcon(object){
	var degree = object.degree;
	var amp = 1;
	if(object.a=='down'){
		amp = -1;
	}
	var seta = pi / (180.0 / degree )
	var x0 = object.x;
	var y0 = object.y;
	//console.log("x0 : "+x0);
	var x1 = x0-(object.dist/2);
	var y1 = y0-10;
	var x2 = x0+(object.dist/2);
	var y2 = y0+10;
	if(object.type=='door'){
		y1 = y0+object.dist-amp*(object.dist+5);
		y2 = y0+object.dist+amp*(object.dist+5);
	}
	if(y1>y2){
		var temp = y2;
		y2=y1;
		y1=temp;
	}
	if(x1>x2){
		var temp = x2;
		x2=x1;
		x1=temp;
	}
	var mx = (crossXY.x-x0)*Math.cos(-seta)-(crossXY.y-y0)*Math.sin(-seta)+x0;
	var my = (crossXY.x-x0)*Math.sin(-seta)+(crossXY.y-y0)*Math.cos(-seta)+y0;	
	//console.log("mXY : "+mx+", "+my);
	return (x1 <= mx) && (x2 >= mx) && (y1 <= my) && (y2 >= my);
}

//선택한 오브젝트가 속한 라인의 각도(기울기)값 구하기
function findDegree(){
	var temp = '',a = '';
	var degree = 0;
	if(lineTemp){
		if(lineTemp.type=='line'){
			
			temp = lineTemp.line;
			degree = Math.atan2(temp.y1-temp.y0,temp.x1-temp.x0) * 180 / 3.1415;
			//console.log(degree);
			var mx1 = (crossXY.x-temp.x0)*Math.cos(90)-(crossXY.y-temp.y0)*Math.sin(90)+temp.x0;
			var my1 = (crossXY.x-temp.x0)*Math.sin(0)+(crossXY.y-temp.y0)*Math.cos(0)+temp.y0;
			var mx2 = (XY.x-temp.x0)*Math.cos(90)-(XY.y-temp.y0)*Math.sin(90)+temp.x0;
			var my2 = (XY.x-temp.x0)*Math.sin(0)+(XY.y-temp.y0)*Math.cos(0)+temp.y0;
			//마우스와 선의 위상차
			//선의 회전값을 마우스에 대입하여 선과 마우스의 좌표선상의 영점을 일치시킨후 비교
			if(my1<my2)a="down";
			else if(my1>my2)a="up";
			else if(my1=my2){
				if(mx1<mx2)a="down";
				else if(mx1>mx2)a="up";
			}
			if(a == "down"){
				degree = degree-180;
			}
			delete temp.type;
		}else if(lineTemp.type.substr(0,4)=="rect"){
				if((XY.x+XY.y)>(crossXY.x+crossXY.y)){
					a="up";
				}else{
					a="down";
				}
				//console.log(lineTemp.type);
  			if(lineTemp.type=='rect1'){
  				degree = 0; 
  				temp=lineTemp.line1.coordinate;
  				if(a == "up"){
					degree = degree-180;
				}
  			}
  			if(lineTemp.type=='rect4'){
  				degree = 0; temp=lineTemp.line4.coordinate;
  				if(a == "up"){
					degree = degree-180;
				}
  			}
  			if(lineTemp.type=='rect2'){
  				degree = 90; 
  				temp=lineTemp.line2.coordinate;
  				if(a == "down"){
					degree = degree-180;
				}
  			}
  			if(lineTemp.type=='rect3'){
  				degree = 90; 
  				temp=lineTemp.line3.coordinate;
  				if(a == "down"){
					degree = degree-180;
				}
  			}
		}
	}
	return {degree:degree,a:a};
}
//수정2
function drawingObject(order){
	//status = "objectDraw";
	var table = findDegree();
	var object = {x:XY.x,y:XY.y,a:table.a,type:objectSelect,dist:count,degree:table.degree,alpha:0.0};
	if(order == "draw"){
		object.alpha = 1.0;
		ObjectIcon(object);
	}
	else if(order == "create"){
		var temp = lineTemp;
		object.alpha = 0.0;
		if(lineTemp.type.substr(0,4)=="rect")temp = findRectLine(temp);
		delete temp.type;
		for(var i=0;i<lines.length;i++){
			/*console.log(JSON.stringify(lines[i].coordinate));
			console.log(JSON.stringify(temp));*/
			if(JSON.stringify(lines[i].coordinate)==JSON.stringify(temp.line)){
				if(!lines[i].object){
					lines[i].object = [];
				}
				if(nearest){
					object.index = i;
					lines[i]['object'].push(object);
					inputUndo(object,"create");
				}
			}
		}
		//status = 'none';
	}
	
}
//수정2
function findRectLine(rect){
	var temp;
	if(rect.type=='rect1'){
		temp=rect.line1.coordinate;
	}
	if(rect.type=='rect4'){
		temp=rect.line4.coordinate;
	}
	if(rect.type=='rect2'){
		temp=rect.line2.coordinate;
	}
	if(rect.type=='rect3'){
		temp=rect.line3.coordinate;
	}
	return {line:temp};
}
//수정2
//오브젝트 수정 objectTemp&&clickE
function updateObject(object){
	var index = '';
	for(var i=0;i<lines[object.index].object.length;i++){
		if(JSON.stringify(object)==JSON.stringify(lines[object.index].object[i])){
			index = i;
			console.log("Ds");
		}
	}
	var temp = {x:object.x,y:object.y,a:object.a,type:object.type,dist:object.dist,degree:object.degree,alpha:0.0};
	temp.x = XY.x;
	temp.y = XY.y;
	var table = findDegree();
	temp.degree = table.degree;
	temp.a = table.a;
	temp.alpha = 1.0;
	ObjectIcon(temp);
	//tamp
	if(nearest){
		//console.log(nearest);
		lines[object.index].object[index].x = temp.x;
		lines[object.index].object[index].y = temp.y;
		lines[object.index].object[index].degree = temp.degree;
		lines[object.index].object[index].a = temp.a;
		lines[object.index].object[index].alpha = 0.0;
	}
	
}
//수정2
//오브젝트 아이콘 크기수정
function objectResizer(object,key){
	var index = '';
	for(var i=0;i<lines[object.index].object.length;i++){
		if(JSON.stringify(object)==JSON.stringify(lines[object.index].object[i])){
			index = i;
		}
	}
	if(key=="up" && object.dist<80){
		object.dist++;
	}else if(key=="down" && object.dist>30){
		object.dist--;
	}
	lines[object.index].object[i]=object;
} 

//수정2
function ObjectIcon(object,select){
	//var nearest = findNearestLine(XY);
	//if(nearest)XY = nearest;
	//var slope = '';
	//var xy,dx,dy = '';
	var dist = object.dist;
	var locationX = object.x, 
		locationY = object.y;
	var a = object.a;
	//var set = 1;
	var type = object.type;
	var alpha = object.alpha;
	if(select=="select")alpha = 1.0;
	var degree = object.degree;
	/*Layer 0 - Code Starts Here*/
	if(type=="window"){
		ctx.save();
		ctx.beginPath();
		ctx.strokeStyle="#f0f0f0";
		ctx.lineWidth=1;
		ctx.translate(locationX, locationY);
		ctx.rotate(degree*Math.PI/180);
		ctx.rect(-dist/2,-5,dist,10);
		ctx.fillStyle = "#f0f0f0";
		ctx.fill();
		ctx.stroke();
		ctx.restore();
		//objects selectline
		ctx.save();
		ctx.translate(locationX, locationY);
		ctx.rotate(degree*Math.PI/180);
		ctx.rect(-dist/2-5,-10,dist+10,20);
		ctx.setLineDash([ 5, 3 ]);
		ctx.strokeStyle="#333333";
		ctx.lineWidth=0.5;
		ctx.globalAlpha = alpha;
		ctx.stroke();
		ctx.restore();
	}
	/*Layer 1 - Code Starts Here*/
	if(type=="door"){
		ctx.save();
		ctx.beginPath();
		ctx.strokeStyle="#333333";
		ctx.lineWidth=1;
		ctx.translate(locationX, locationY);
		ctx.rotate(degree*Math.PI/180);
		ctx.moveTo(-dist/2,0);
		ctx.lineTo(-dist/2,(dist+5));
		ctx.stroke();
		/*Layer 2 - Code Starts Here*/
		ctx.beginPath();
		ctx.strokeStyle="#333333";
		ctx.lineWidth=1;
		ctx.moveTo(-dist/2,(dist+5));
		ctx.quadraticCurveTo(dist/2,(dist+5),dist/2,0);
		ctx.stroke();
		ctx.restore();
		//Layer 3
		ctx.save();
		ctx.beginPath();
		ctx.strokeStyle="#f0f0f0";
		ctx.lineWidth=1;
		ctx.translate(locationX, locationY);
		ctx.rotate(degree*Math.PI/180);
		ctx.rect(-dist/2,-5,dist,10);
		ctx.fillStyle = "#f0f0f0";
		ctx.fill();
		ctx.stroke();
		ctx.restore();
		//objects selectline
		ctx.save();
		ctx.translate(locationX, locationY);
		ctx.rotate(degree*Math.PI/180);
		ctx.rect(-dist/2-5,-10,dist+10,(dist+20));
		ctx.setLineDash([ 5, 3 ]);
		ctx.strokeStyle="#333333";
		ctx.lineWidth=0.5;
		ctx.globalAlpha = alpha;
		ctx.stroke();
		ctx.restore();
	}
};

//수정
function moveTemp(req){
	if(req=="object"){
		var array = lines[updateTemp.index].object;
		for(var i=0;i<array.length;i++){
			if(JSON.stringify(updateTemp)==JSON.stringify(array[i])){
				UndoTemp = {data : JSON.stringify(array[i]), index : i};
			}
		}
	}else if(req=="objectUndo"){
		var data = JSON.parse(UndoTemp.data);
		var index = JSON.parse(UndoTemp.index);
		inputUndo({data:data,index:index},"move");
	}
	if(req=="image"){
		//console.log("imageSelect");
	}
}

	function mouseXY(e) {
		//client는 마우스의 좌표 - offset은 canvas의 좌표 즉 canvas안에서의 마우스의 좌표
		var tempX = parseInt(e.clientX - offsetX); 
		var tempY = parseInt(e.clientY - offsetY);
	
		if (status == "image") return { x : tempX, y : tempY };
	
		//ShiftKey입력후 선을 그릴시 직석으로 
		//일정 좌표 이상으로 벗어나면 해당 방향으로 직선
		if (ShiftKey && status == "lineDrawing") {
			var Dx = Math.abs(downXY.x - tempX);
			var Dy = Math.abs(downXY.y - tempY);
			if (Dx > Dy) {
				//               return{x:tempX-fixed,y:downXY.y}
				return { x : tempX, y : downXY.y }
			} else {
				//               return{x:downXY.x,y:tempY-fixed}
				return { x : downXY.x, y : tempY }
			}
		}
		if ((tempX % 5) == 0) mouseX = tempX;
		if ((tempY % 5) == 0) mouseY = tempY;
		return { x : mouseX - fixed, y : mouseY - fixed }
	}

	//미우스 좌표값 반환 (객체의 위치 계산)
	function getCrossXY(e) {
		var mouseX = parseInt(e.clientX - offsetX); //client는 마우스의 좌표 - offset은 canvas의 좌표 즉 canvas안에서의 마우스의 좌표
		var mouseY = parseInt(e.clientY - offsetY);
		return { x : mouseX - fixed, y : mouseY - fixed }
	}

	//다운로드 이미지
	function downloadFloorplanPng(saved_name) {
		//다운로드 직전 최신화
		redrawAll();
		
		//파일 다운로드 기능
		var dataURL = canvas.toDataURL("image/png");
		var newdata = dataURL.replace(/^data:image\/png/, 'data:application/octet-stream');
		$('a.downloadBtn').attr('download', saved_name+'.png').attr('href', newdata);
	}
	
	//DB에 데이터 저장
	function saveFloorplan (on, url, saved_name) {
		//다운로드 직전 최신화
		redrawAll();
		
		//데이터 collect
		var iconArray = iconState.icons;
		var lineArray = lines;
		var data = { lines : JSON.stringify(lineArray),
					 icons : JSON.stringify(iconArray),
					 saved_name : saved_name };
		if(on) {
			//서버 저장
			$.ajax({
				method : "POST",
				url : url,
				dataType : "JSON",
				async : false,
				data : data,
				success : function(result) {
					if (result == 1) {
						alert("평면도 등록에 성공하셨습니다.");
					} else if(result == -1) {
						alert("로그인 후 저장 가능합니다.");
					} else {
						alert("저장 실패");
					}
				},
				error : function() {
					alert("서버 등록 실패. 다시 시도하여 주세요.");
				}
			});
		} else {
			//방 등록과정 중 캔버스 서버 임시 저장
			var $form = $('<form></form>');
			$form.attr('action', url);
			$form.attr('method', "POST");
			$form.appendTo('body');
			for(var key in data) {
				var value = data[key];
				$form.append($('<input type="hidden" value='+value+' name="'+key+'">'));
			}
			$form.submit();
		} 
	}	
	
	//DB에서 유저 평면도 이미지 데이터 로드
	function loadUserDataFloorplanImageList() {
		$.ajax({
			url: "images.json",
			type: "GET",
			dataType:"json",
			success : function(data) {
				createImages(data);
			}
		})
	}
	
	// JSON 포멧 데이터 처리
	function createImages(objImageInfo) {
		var images = objImageInfo.images;
		var strDOM = "";
		for(var i=0; i<images.length; i++) {
			//n번째 이미지 정보 구하기
			var image = images[i];
			
			//n번째 이미지 패널을 생성
			strDOM += '<div class="image_panel">';
			strDOM += '		'<img src="'+image.url+'">';
			strDOM += '		'<p class="title">'+image.title+''</p>';
			strDOM += ''</div>';
		}
		//이미지 컨테이너에 생성한 이미지 패널들을 추가하기
		var $imageContainer = $('#image_container');
			$imageContainer.append(strDOM);
	}
	
	//DB에서 데이터 로드
	function loadUserData() {
		var linesArray = [];
		var iconsArray = [];
		var datanum = $("#datanum").val();
			
		$.ajax({
			method : "POST",
			url : "loadCanvas",
			data : { datanum : datanum },
			async: false,
			success : function(data) {
				var lines = JSON.parse(data.lines);
				var icons = JSON.parse(data.icons);
				if(Object.keys(lines).length !== 0) {
					linesArray = lines;
				} 
				if(Object.keys(icons).length !== 0) {
					iconsArray = icons;
				}
			},
			error : function() {
				console.log("loadCanvas error occured");
				init();
			}
		});
		return {lines: linesArray, icons: iconsArray};
	}