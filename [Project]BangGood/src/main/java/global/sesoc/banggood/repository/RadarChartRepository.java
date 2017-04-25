package global.sesoc.banggood.repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.banggood.dao.radarChartDAO;
import global.sesoc.banggood.vo.RadarChart;


@Repository
public class RadarChartRepository {
	
	
	@Autowired
	SqlSession session;
	
	public RadarChart selectSingleRadarData(int property_no) {
		RadarChart result = null;
		radarChartDAO dao = session.getMapper(radarChartDAO.class);
		try {
			result = dao.selectSingleRadarData(property_no);
			System.out.println("result "+ result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Map<String, Object> selectAverageRadartData(Map<String, String> condition) {
		Map<String, Object> result = null;
		radarChartDAO dao = session.getMapper(radarChartDAO.class);
		try {
			result = dao.selectAverageRadarData(condition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
