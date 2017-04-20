package global.sesoc.banggood.dao;

import java.util.Map;

import global.sesoc.banggood.vo.RadarChart;


public interface radarChartDAO {
	public RadarChart selectSingleRadarData(int property_no) throws Exception;
	public Map<String, Object> selectAverageRadarData(Map<String, String> condition) throws Exception;
}
