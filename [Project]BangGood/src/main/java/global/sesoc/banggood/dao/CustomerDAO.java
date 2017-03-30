package global.sesoc.banggood.dao;

import global.sesoc.banggood.vo.Customer;

public interface CustomerDAO {
	
	// 회원가입
	public int customer_insert(Customer customer) throws Exception; 
	
	// 로그인 및 메시지 보내기
	public Customer customer_select(String custid) throws Exception; 
	
	// 회원정보 수정
	public int customer_update(Customer customer) throws Exception;
	
	// 회원 탈퇴
	public int customer_delete(String custid, String password) throws Exception; 

}
