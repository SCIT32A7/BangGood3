package global.sesoc.banggood.dao;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.banggood.vo.Maintence;
import global.sesoc.banggood.vo.Option;
import global.sesoc.banggood.vo.Picture;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_map;
import global.sesoc.banggood.vo.Property_search;

public interface PropertyDAO {	
	//등록
	public int insert_property(Property property) throws Exception;  // 매물 등록
	public int insert_option(Option option) throws Exception;  // 옵션 등록
	public int insert_maintence(Maintence maintence) throws Exception;  // 관리비 등록
	public int insert_picture(Picture picture) throws Exception;  // 사진 등록

	public int select_recently_property() throws Exception;  // 옵션과 관리비 내역 등록위해 최근 값 뽑아오기
	
	//삭제
	// public int delete_property(int property_no) throws Exception; // 매물 삭제

	//매물 정보 읽어오기(상세읽기)
	//public Property select_property_property(int property_no) throws Exception;  // 매물 상세내용 가져오기
	//public Option select_property_option(int property_no) throws Exception;
	//public Maintence select_property_maintence(int property_no) throws Exception;
	
	//매물정보 수정
	//public int update_property(Property property) throws Exception;  // 매물 수정
	//public int update_option(Option option) throws Exception;  // 옵션 수정
	//public int update_maintence(Maintence maintence) throws Exception;  // 관리비 수정
	//public int delete_picture(Picture picture) throws Exception;  // 사진 삭제 후 재등록
	//public int delete_floorplan(Floorplan floorplan) throws Exception;  // 평면도 삭제 후 재등록

	//조건조회
	public ArrayList<String> searchProperty(Property_search search);
	
	// 지도 상에서 매물 정보 띄우기
	public Property_map readProperty_map(String address);
	
	// 주소 자동완성을 위한 메소드
	public ArrayList<String> getPosition(String searchText);
	
	// 마을의 중심 좌표를 위한 메소드
	public String get_town(String searchaddress);

}
