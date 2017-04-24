package global.sesoc.banggood.dao;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.banggood.vo.Canvas;
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
	
	//게시 중단
	public int stop_showing(int property_no) throws Exception;
	
	//재게시
	public int restart_showing(int property_no) throws Exception;

	//매물 정보 읽어오기(상세읽기)
	public Property select_property_property(int property_no) throws Exception; 
	public Option select_property_option(int property_no) throws Exception;
	public Maintence select_property_maintence(int property_no) throws Exception;
	public ArrayList<Picture> select_property_picture(int property_no) throws Exception;
	
	// 읽기 실행 시 조회수 증가
	public int add_property_hits(int property_no) throws Exception;
	
	// 댓글 등록시 댓글 수 증가
	public int add_reply_count(int property_no) throws Exception;
	
	// 댓글 삭제시 댓글 수 감소
	public int sub_reply_count(int property_no) throws Exception;
	
	//매물정보 수정
	public int update_property(Property property) throws Exception;  // 매물 수정
	public int update_option(Option option) throws Exception;  // 옵션 수정
	public int update_maintence(Maintence maintence) throws Exception;  // 관리비 수정
	
	public int update_picture(Picture picture) throws Exception;  // 사진 삭제 후 재등록

	//조건조회
	public ArrayList<String> searchProperty(Property_search search) throws Exception;
	
	// 지도 상에서 매물 정보 띄우기
	public Property_map readProperty_map(String address) throws Exception;
	
	// 주소 자동완성을 위한 메소드
	public ArrayList<String> getPosition(String searchText) throws Exception;
	
	// 마을의 중심 좌표를 위한 메소드
	public String get_town(String searchaddress) throws Exception;

}
