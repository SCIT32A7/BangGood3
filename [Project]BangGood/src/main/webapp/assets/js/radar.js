/**
 * 
 */
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
		var table = "<table style='width:300px' class='table'>";
		$.each(tempArray, function(index, item) { 
			table += "<tr>"
			table += "<td style='width:100px; font-size:18px'>보증금: </td>"
			table += "<td>"+item.deposit+"만원</td>"	
			table += "</tr>"
			table += "<tr>"
			table += "<td style='width:100px; font-size:18px'>월세: </td>"
			table += "<td>"+item.month_fee+"만원</td>"	
			table += "</tr>"	
			table += "<tr>"
			table += "<td style='width:100px; font-size:18px'>관리비: </td>"
			table += "<td>"+item.maintence_fee+"만원</td>"	
			table += "</tr>"		
			table += "<tr>"
			table += "<td style='width:100px; font-size:18px'>방면적: </td>"
			table += "<td>"+item.roomsize+"평</td>"	
			table += "</tr>"
			table += "<tr>"
			table += "<td style='width:60px; font-size:18px'>방옵션: </td>"
			table += "<td>"+item.total+"개</td>"	
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
		var table = "<table class='g-mb-10'>";
		$.each(array, function(index, item) { 
			table += "<tr>"
			table += "<td>지역 최대: <span class='view_span'>"+item.max+"</span></td>"
			table += "<td>지역 최소: <span class='view_span'>"+item.min+"</span> </td>"
			table += "<td>지역 평균: <span class='view_span'>"+item.avg+"</span> </td>"
			table += "<td>현재 선택된 방: <span class='view_span'>"+item.sel+"</span></td>"
			table += "</tr>"
			table += "<hr>"
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
					fgColor: '#f7be22',
				},
				'chartDiv': 'Nwagon',
				'chartType': 'radar',
				'chartSize': { width: 300, height: 300 }
			};
			Nwagon.chart(option1);
	}