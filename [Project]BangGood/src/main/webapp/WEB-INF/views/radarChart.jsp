<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/Nwagon.css" type="text/css">
	<script type="text/javascript" src="resources/Nwagon.js"></script>
	<script type="text/javascript" src="resources/jquery-3.2.0.min.js"></script>
	<script>
	$(function(){
		$.ajax({
			method:"get",
			url:"radarChart",
			async: false,
			data: {property_no: property_no},
			success: function(map) {
				getRadarChartData(map, "${read_property.rent_type}", "${read_property.property_type}");
			},
			error: function() {
				alert("조회 실패");
			}
		});
	});
	
	var property_no = 160088;
	var selectedRadar;
	var avgRadar;
	var percentRadar;
	var maxRadar;
	var minRadar;
	
	function getRadarChartData(map) {
		console.log("map => "+ JSON.stringify(map));
		selectedRadar = map.selectedRadar;
		avgRadar = map.avgRadar;
		percentRadar = map.percentRadar;
		maxRadar = map.maxRadar;
		minRadar = map.minRadar;
		
		var percentArray = Object.keys(percentRadar).map(function(k) { return percentRadar[k] });
		createRadarObject(percentArray.slice(3));
		//var avgArray = Object.keys(avgRadar).map(function(k) { return avgRadar[k] });
		var tempArray = [];
		tempArray.push(avgRadar);
		var table = "<table>";
		$.each(tempArray, function(index, item) { 
			table += "<tr>"
			table += "<td>보증금: "+item.deposit+"만원,</td>"
			table += "<td>월세: "+item.month_fee+"만원,</td>"
			table += "<td>관리비: "+item.maintence_fee+"만원,</td>"
			table += "<td>방면적: "+item.roomsize+"평,</td>"
			table += "<td>방옵션수: "+item.total+"개</td>"
			table += "</tr>"
		});
		table +="</table>";
		$("#avgData").html(table);
	}
	
	function getDetails(category) {
		var array = [];
		var avg;
		var sel;
		var max;
		var min;
		switch(category) {
		case "보증금":
			$("#field").html(category + " 세부 데이터(**만원 단위)");
			avg = avgRadar.deposit;
			sel = selectedRadar.deposit;
			max = maxRadar.deposit;
			min = minRadar.deposit;
			break;
		case "월세":
			$("#field").html(category + " 세부 데이터(**만원 단위)");
			avg = avgRadar.month_fee;
			sel = selectedRadar.month_fee;
			max = maxRadar.month_fee;
			min = minRadar.month_fee;
			break;
		case "관리비":
			$("#field").html(category + " 세부 데이터(**만원 단위)");
			avg = avgRadar.maintence_fee;
			sel = selectedRadar.maintence_fee;
			max = maxRadar.maintence_fee;
			min = minRadar.maintence_fee;
			break;
		case "방면적":
			$("#field").html(category + " 세부 데이터(**평 단위)");
			avg = avgRadar.roomsize;
			sel = selectedRadar.roomsize;
			max = maxRadar.roomsize;
			min = minRadar.roomsize;
			break;
		case "방옵션수":
			$("#field").html(category + " 세부 데이터(**개수 단위)");
			avg = avgRadar.total;
			sel = selectedRadar.total;
			max = maxRadar.total;
			min = minRadar.total;
			break;
		}
		var json = {max:max, min:min, avg:avg, sel:sel};
		array.push(json);
		var table = "<table>";
		$.each(array, function(index, item) { 
			table += "<tr>"
			table += "<td>지역 최대: "+item.max+", </td>"
			table += "<td>지역 최소: "+item.min+", </td>"
			table += "<td>지역 평균: "+item.avg+", </td>"
			table += "<td>현재 선택된 방: "+item.sel+"</td>"
			table += "</tr>"
		});
		table +="</table>";
		$("#field_data").html(table);
	}
	
	function createRadarObject(roomData) {
		var option1 = {
				'legend':{
					names: ['보증금', '월세', '관리비', '방면적', '방옵션수'],
					funcs: [ "getDetails('보증금')", "getDetails('월세')", 
						     "getDetails('관리비')", "getDetails('방면적')", 
						     "getDetails('방옵션수')"	]
				},
				'dataset': {
					title: 'Room property analysis',
					values: [roomData],
					bgColor: '#f9f9f9',
					fgColor: '#30a1ce',
				},
				'chartDiv': 'Nwagon',
				'chartType': 'radar',
				'chartSize': { width: 500, height: 300 }
			};
			Nwagon.chart(option1);
	}
	
	</script>
</head>
<body>
	<h1>지역별 상대적 방 분석 평점 데이터</h1>
	<div id="Nwagon"></div>
	<pre>** 같은 지역(동, 면, 리)내 비교 분석 데이터 100점 만점 대비</pre>
	<h2 id="field"></h2>
	<span id="field_data"></span>
	<h2>지역 실제 평균 데이터</h2>
	<span id="avgData"></span>
	
</body>
</html>