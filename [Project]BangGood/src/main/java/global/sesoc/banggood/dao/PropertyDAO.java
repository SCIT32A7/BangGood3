package global.sesoc.banggood.dao;

import java.util.ArrayList;

import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_map;

public interface PropertyDAO {	
	//등록
	//public int insert_property(Property property) throws Exception;  // 매물 등록
	//public int insert_option(Option option) throws Exception;  // 옵션 등록
	//public int insert_maintence(Maintence maintence) throws Exception;  // 관리비 등록
	//public int insert_picture(Picture picture) throws Exception;  // 사진 등록
	//public int insert_floorplan(Floorplan floorplan) throws Exception;  // 평면도 등록

	//삭제
	// public int delete_property(int property_no) throws Exception; // 매물 삭제

	//매물 정보 읽어오기(상세읽기)
	//public Property select_property(int property_no) throws Exception;  // 매물 상세내용 가져오기

	//매물정보 수정
	//public int update_property(Property property) throws Exception;  // 매물 수정
	//public int update_option(Option option) throws Exception;  // 옵션 수정
	//public int update_maintence(Maintence maintence) throws Exception;  // 관리비 수정
	//public int delete_picture(Picture picture) throws Exception;  // 사진 삭제 후 재등록
	//public int delete_floorplan(Floorplan floorplan) throws Exception;  // 평면도 삭제 후 재등록

	//조건조회
	public ArrayList<Property> searchProperty();
	// 매물 조건 검색, 지도에 표시, 기본 조건은 서울시, 나머지는 전체 검색
	// 조건내용 : rent_type, address(area), floor, property_type, deposit, month_fee, built_year,
	// RoomOption(1 or 2) – pet, car, elevator
	
	public Property_map readProperty_map(String address);

}
