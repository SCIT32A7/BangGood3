package global.sesoc.banggood.dao;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.banggood.vo.Customer;
import global.sesoc.banggood.vo.Property_list;

public interface CustomerDAO {
	
	// 회원가입
	public int customer_insert(Customer customer) throws Exception; 
	
	// 로그인 및 메시지 보내기
	public Customer customer_select(String custid) throws Exception; 
	
	// 회원정보 수정
	public int customer_update(Customer customer) throws Exception;
	
	// 등록목록 보기
	public ArrayList<Property_list> see_myinsert(String custid) throws Exception;
	
	// 장바구니 등록
	public int insert_cart(Map<String, Object> cartMap) throws Exception;
	
	// 장바구니 내용 삭제
	public int delete_cart(int cart_no) throws Exception;
	
	
	// 장바구니 등록 시 좋아요 수 증가
	public int add_property_like(int property_no) throws Exception;
		
	// 장바구니 삭제 시 좋아요 수 감소
	public int sub_property_like(int property_no) throws Exception;
	
	//장바구니 보기
	public ArrayList<Property_list> see_myCart(String custid) throws Exception;
}
