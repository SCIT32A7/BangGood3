package global.sesoc.banggood.repository;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.banggood.dao.AdminDAO;
import global.sesoc.banggood.dao.SearchBoardDAO;
import global.sesoc.banggood.vo.Property;

@Repository
public class AdminRepository {
	
	@Autowired
	SqlSession session;
	
	// 전체 매물 갯수 구하기
	public int count_property(Map<String, Object> countMap){
		AdminDAO dao = session.getMapper(AdminDAO.class);
		int total = 0;
		try {
			total = dao.count_property(countMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}
	
	// 전체 매물 구하기
	public ArrayList<Property> select_property(Map<String, Object> searchMap){
		AdminDAO dao = session.getMapper(AdminDAO.class);
		ArrayList<Property> pList = new ArrayList<>();
		try {
			pList = dao.select_property(searchMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pList;
	}
	
	// 대기 매물 갯수 구하기
	public int count_waiting_property(Map<String, Object> countwMap){
		AdminDAO dao = session.getMapper(AdminDAO.class);
		int total = 0;
		try {
			total = dao.count_waiting_property(countwMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return total;
	}
	
	// 대기 매물 구하기
	public ArrayList<Property> select_waiting_property(Map<String, Object> searchwMap){
		AdminDAO dao = session.getMapper(AdminDAO.class);
		ArrayList<Property> pList = new ArrayList<>();
		try {
			pList = dao.select_waiting_property(searchwMap);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pList;
	}
	
	// 게시 중지 시키기
	public int stop_showing(ArrayList<Integer> list){
		AdminDAO dao = session.getMapper(AdminDAO.class);
		int result = 0;
		for(int property_no : list){
			try {
				result += dao.stop_showing(property_no);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("변경결과 : "+result);
		return result;
	}
	
	// 게시 다시 하기
	public int restart_showing(ArrayList<Integer> list){
		AdminDAO dao = session.getMapper(AdminDAO.class);
		int result = 0;
		for(int property_no : list){
			try {
				result += dao.restart_showing(property_no);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("변경결과 : "+result);
		return result;
	}

}
