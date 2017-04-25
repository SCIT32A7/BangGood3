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
	public Map<String, RadarChart> singleRadarChart(int property_no) {
		System.out.println(property_no);
		Map<String, RadarChart> resultMap = new HashMap<>();
		int index = 0;
		RadarChart selected = repository.selectSingleRadarData(property_no);
		if(selected == null) {
			logger.info("선택 데이터 로드 실패");
		} else {
			logger.info("선택 데이터 로드 성공");
			logger.info(selected.toString());
			resultMap.put("selectedRadar", selected);

			String address = selected.getAddress();
			for(int i = 0; i<10; i++) {
				String num = i+"";
				index = address.indexOf(num);
				if(index != -1) {
					break;
				}
			}
			//주소 동, 읍, 리 단위로 끊어내기
			String searchArea = address.substring(0, index);
			System.out.println("검색 지역"+searchArea);
			Map<String, String> condition = new HashMap<>();
			condition.put("address", searchArea);
			condition.put("rent_type", selected.getRent_type());
			condition.put("property_type", selected.getProperty_type());

			Map<String, Object> average = repository.selectAverageRadartData(condition);
			if(average == null) {
				logger.info("평균 데이터 로드 실패");
			} else {
				logger.info("평균 데이터 로드 성공");
				for (Object b : average.values()) {
					System.out.println("평균 sQL"+b.toString());
				}
				Map<String, RadarChart> dataMap = getAnalysisData(selected, average);
				resultMap.put("percentRadar", dataMap.get("percentRadar"));
				resultMap.put("avgRadar", dataMap.get("avgRadar"));
				resultMap.put("maxRadar", dataMap.get("maxRadar"));
				resultMap.put("minRadar", dataMap.get("minRadar"));
				
			}
		}
		return resultMap;
	}
	
	public Map<String, RadarChart> getAnalysisData(RadarChart radar, Map<String, Object> avg) {
		Map<String, RadarChart> map = new HashMap<>();
		
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