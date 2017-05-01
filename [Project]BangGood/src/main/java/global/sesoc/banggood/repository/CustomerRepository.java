package global.sesoc.banggood.repository;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.banggood.dao.CustomerDAO;
import global.sesoc.banggood.vo.Customer;
import global.sesoc.banggood.vo.Property_list;

@Repository
public class CustomerRepository {

	@Autowired
	SqlSession query;

	public int insert(Customer customer) {
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

	public Customer search(String custid) {
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

	public int update(Customer customer) {
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

	// 등록한 매물 목록 보기
	public ArrayList<Property_list> see_myinsert(String custid) {
		CustomerDAO cd = query.getMapper(CustomerDAO.class);
		ArrayList<Property_list> pro_in_list = new ArrayList<>();
		try {
			pro_in_list = cd.see_myinsert(custid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pro_in_list;
	}

	// 장바구니 등록
	public int insert_cart(Map<String, Object> cartMap) {
		CustomerDAO cd = query.getMapper(CustomerDAO.class);
		int result = 0;
		try {
			result = cd.insert_cart(cartMap);
			cd.add_property_like((int) cartMap.get("property_no"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 장바구니 내용 삭제
	public void delete_cart(int property_no) {
		CustomerDAO cd = query.getMapper(CustomerDAO.class);
		try {
			cd.delete_cart(property_no);
			cd.sub_property_like(property_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 장바구니 보기
	public ArrayList<Property_list> see_myCart(String custid) {
		CustomerDAO cd = query.getMapper(CustomerDAO.class);
		ArrayList<Property_list> mycart = new ArrayList<>();
		try {
			mycart = cd.see_myCart(custid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mycart;
	}

	// 오늘 읽은 매물 보기
	public ArrayList<Property_list> see_myclick(ArrayList<Integer> cList) {
		CustomerDAO cd = query.getMapper(CustomerDAO.class);
		ArrayList<Property_list> myClick = new ArrayList<>();
		for (int property_no : cList) {
			try {
				myClick.add(cd.see_myclick(property_no));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return myClick;
	}

}
