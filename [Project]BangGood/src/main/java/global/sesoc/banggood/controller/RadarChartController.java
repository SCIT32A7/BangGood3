package global.sesoc.banggood.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.banggood.repository.RadarChartRepository;
import global.sesoc.banggood.vo.RadarChart;


@Controller
public class RadarChartController {

	private static final Logger logger = LoggerFactory.getLogger(RadarChartController.class);

	@Autowired
	RadarChartRepository repository;

	@RequestMapping(value = "/radarChart", method = RequestMethod.GET)
	public String listhome() {
		return "radarChart";
	}

	@ResponseBody
	@RequestMapping(value = "/loadChart", method = RequestMethod.GET)
	public Map<String, Object> singleRadarChart(int property_no) {
		System.out.println(property_no);
		Map<String, Object> resultMap = new HashMap<>();
		int index = 0;
		RadarChart selected = repository.selectSingleRadarData(property_no);
		if(selected == null) {
			logger.info("선택 데이터 로드 실패");
		} else {
			logger.info("선택 데이터 로드 성공");
			logger.info(selected.toString());
			resultMap.put("selectedRadar", selected);
			
			//주소 동, 읍, 리 단위로 끊어내기
			String address = selected.getAddress();
			String searchArea = getSearchedArea(address);
			
			resultMap.put("searchArea", searchArea);
			Map<String, String> condition = new HashMap<>();
			condition.put("address", searchArea);
			condition.put("rent_type", selected.getRent_type());
			condition.put("property_type", selected.getProperty_type());
			

			Map<String, Object> average = repository.selectAverageRadartData(condition);
			if(average == null) {
				logger.info("평균 데이터 로드 실패");
			} else {
				logger.info("평균 데이터 로드 성공");
				Map<String, RadarChart> dataMap = getAnalysisData(selected, average);
				int roomNoTotal = Integer.parseInt(String.valueOf(average.get("ROOMNOTOTAL")));
				resultMap.put("percentRadar", dataMap.get("percentRadar"));
				resultMap.put("avgRadar", dataMap.get("avgRadar"));
				resultMap.put("maxRadar", dataMap.get("maxRadar"));
				resultMap.put("minRadar", dataMap.get("minRadar"));
				resultMap.put("roomNoTotal", roomNoTotal);
				
			}
		}
		return resultMap;
	}
	
	public String getSearchedArea(String address) {
		String result = "";
		String[] temp1 = address.split("-");
		String[] temp2 = temp1[0].split(" ");
		
		for(String a: temp2) {
			System.out.println(a);
		}
		System.out.println("temp2사이즈 "+temp2.length);
		int index = 0;
		for(int i=1; i<temp2.length; i++){
			if(isNumeric(temp2[i])) {
				System.out.println("index "+i);
				index = i;
				break;
			}
		}
		System.out.println("index "+index);
		for(int i=1; i<index; i++) {
			result += temp2[i]+" ";
		}
		System.out.println("111111=>"+result);
		return result;
	}
	
	public static boolean isNumeric(String sample) {
		try{
			Double.parseDouble(sample);
		} catch(NumberFormatException e) {
			return false;
		}
		return true;
	}
	
	public Map<String, RadarChart> getAnalysisData(RadarChart radar, Map<String, Object> avg) {
		Map<String, RadarChart> map = new HashMap<>();
		System.out.println("aasdf=>"+avg.get("MAXMAINTENCE"));
		//관리비가 입력이 안됀 데이터에 대한 default = 0으로 초기화
		if(avg.get("MAXMAINTENCE") == null) {
			avg.replace("MAXMAINTENCE", 0);
		}
		if(avg.get("MINMAINTENCE") == null) {
			avg.replace("MINMAINTENCE", 0);
		}
		//통계를 위한 지역 최대값과 최소값
		Double maxdeposit = Double.parseDouble(String.valueOf(avg.get("MAXDEPOSIT")));
		Double mindeposit = Double.parseDouble(String.valueOf(avg.get("MINDEPOSIT")));
		Double maxmonth = Double.parseDouble(String.valueOf(avg.get("MAXMONTH")));
		Double minmonth = Double.parseDouble(String.valueOf(avg.get("MINMONTH")));
		Double maxmaintence = Double.parseDouble(String.valueOf(avg.get("MAXMAINTENCE")));
		Double minmaintence = Double.parseDouble(String.valueOf(avg.get("MINMAINTENCE")));
		Double maxroomsize = Double.parseDouble(String.valueOf(avg.get("MAXROOMSIZE")));
		Double minroomsize = Double.parseDouble(String.valueOf(avg.get("MINROOMSIZE")));
		Double maxoption = 16.0;
		Double minoption = 0.0;
		
		map.put("maxRadar", new RadarChart(maxdeposit, maxmonth, maxmaintence, maxroomsize, maxoption));
		map.put("minRadar", new RadarChart(mindeposit, minmonth, minmaintence, minroomsize, minoption));
		
		//같은 지역 같은 타입의 매물 대비 100점 만점 대비 점수
		Double r_deposit = Math.round((100 - (Math.round(((radar.getDeposit()/(maxdeposit+mindeposit)) * 100)*100)/100.0))*100)/100.0;
		Double r_month = Math.round((100 - (Math.round(((radar.getMonth_fee()/(maxmonth+minmonth)) * 100)*100)/100.0))*100)/100.0;
		Double r_maintence = Math.round((100 - (Math.round(((radar.getMaintence_fee()/(maxmaintence+minmaintence)) * 100)*100)/100.0))*100)/100.0;
		Double r_roomsize = Math.round(((radar.getRoomsize()/(maxroomsize+minroomsize)) * 100)*100)/100.0;
		Double r_option = Math.round(((radar.getTotal()/(maxoption+minoption)) * 100)*100)/100.0;
		map.put("percentRadar", new RadarChart(r_deposit, r_month, r_maintence, r_roomsize, r_option));
		
		//지역 평균 데이터 실제 평균값
		Double avgdeposit = Double.parseDouble(String.valueOf(avg.get("AVGDEPOSIT")));
		Double avgmonth = Double.parseDouble(String.valueOf(avg.get("AVGMONTH")));
		Double avgmaintence = Double.parseDouble(String.valueOf(avg.get("AVGMAINTENCE")));
		Double avgroomsize = Double.parseDouble(String.valueOf(avg.get("AVGROOMSIZE")));
		Double avgoption = Double.parseDouble(String.valueOf(avg.get("AVGOPTION")));
		map.put("avgRadar", new RadarChart(avgdeposit, avgmonth, avgmaintence, avgroomsize, avgoption));
		
		return map;
	}
}