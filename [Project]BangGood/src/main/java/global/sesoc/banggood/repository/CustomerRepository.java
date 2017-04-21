package global.sesoc.banggood.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.banggood.dao.CustomerDAO;
import global.sesoc.banggood.vo.Customer;

@Repository
public class CustomerRepository {

	@Autowired
	SqlSession query;
	
	public int insert(Customer customer){
		CustomerDAO cd = query.getMapper(CustomerDAO.class);
		int result = 0;
		try {
			result = cd.customer_insert(customer);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;		
	}
	
	public Customer search(String custid){
		CustomerDAO cd = query.getMapper(CustomerDAO.class);
		Customer search_customer = null;
		try {
			search_customer = cd.customer_select(custid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return search_customer;
	}
	
	public int update(Customer customer){
		CustomerDAO cd = query.getMapper(CustomerDAO.class);
		int result = 0;
		try {
			result = cd.customer_update(customer);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	
}
