package global.sesoc.banggood.dao;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.banggood.vo.Property;

public interface AdminDAO {

	// 관리자용 전체 매물 보기 메소드
	public ArrayList<Property> select_property(Map<String, Object> searchMap)
			throws Exception;
	
	// 전체 매물 갯수 구하기
	public int count_property(Map<String, Object> countMap) throws Exception;
	
	// 관리자용 게시 허가 요청 중인 메소드 보기
	public ArrayList<Property> select_waiting_property(Map<String, Object> searchwMap)
			throws Exception;
	
	// 관리자용 게시 허가 요청 매물 갯수 구하기
	public int count_waiting_property(Map<String, Object> countwMap) throws Exception;

	//매물 개시 중지
	public int stop_showing(int property_no) throws Exception;
	
	//매물 개시 재시작
	public int restart_showing(int property_no) throws Exception;

}
