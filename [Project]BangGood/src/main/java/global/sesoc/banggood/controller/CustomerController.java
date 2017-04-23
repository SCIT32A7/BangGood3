package global.sesoc.banggood.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.banggood.repository.CustomerRepository;
import global.sesoc.banggood.vo.Customer;
import global.sesoc.banggood.vo.Property_list;

@Controller
public class CustomerController {

	private static final Logger log = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	HttpSession session;

	@Autowired
	CustomerRepository cr;

	// ajax
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public @ResponseBody String join(Customer customer) {
		System.out.println(customer);
		int result = cr.insert(customer);
		String message = null;
		if (result == 1) {
			message = "success";
		} else {
			message = "fail";
		}
		return message;
	}

	// ajax로 시행
	@ResponseBody
	@RequestMapping(value = "checkid", method = RequestMethod.POST)
	public String searchId(String custid) {
		System.out.println(custid);
		Customer customer = cr.search(custid);
		String message = null;
		if (customer != null) {
			message = "exist";
		} else {
			message = "none";
		}
		return message;
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String custid, String password, Model model) {
		Customer customer = cr.search(custid);
		String message = null;
		if (customer == null || !password.equals(customer.getPassword())) {
			message = "fail";
		} else if (password.equals(customer.getPassword())){
			message = "success";
			session.setAttribute("loginId", custid);
			session.setAttribute("loginCustomer", customer);
		}
		model.addAttribute("result", message);
		return "index";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout() {
		session.invalidate();
		return "redirect:/";
	}

	// 개인정보 수정
	@RequestMapping(value = "customer_update", method = RequestMethod.POST)
	public String update(Customer customer, Model model) {
		String custid = (String) session.getAttribute("loginId");
		
		customer.setCustid(custid);
		int result = cr.update(customer);
		String message = null;
		if (result > 0) {
			message = "success";
		} else {
			message = "fail";
		}
		model.addAttribute("result", message);
		return "mypage4";
	}
	
	// 마이페이지로 이동, 등록매물로 이동됨
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String see_myinsert(Model model) {
		ArrayList<Property_list> pro_in_list 
		= cr.see_myinsert((String)session.getAttribute("loginId"));
		System.out.println(pro_in_list.get(0).toString());
		model.addAttribute("pro_in_list", pro_in_list);
		return "mypage";
	}

	// 장바구니로 이동
	@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
	public String see_myCart(Model model) {
		ArrayList<Property_list> myCart
		= cr.see_myCart((String)session.getAttribute("loginId"));
		model.addAttribute("myCart", myCart);
		return "mypage2";
	}
	
	// 장바구니 등록은 나중에 읽기 하면서 하자

	
	// 장바구니 내역 삭제
	@RequestMapping(value = "/delete_cart", method = RequestMethod.POST)
	public String delete_cart(int cart_no){
		cr.delete_cart(cart_no);
		return "redirect:mypage2";
	}

	// 개인정보 수정으로 이동
	@RequestMapping(value = "/mypage4", method = RequestMethod.GET)
	public String modify_customer(Model model) {
		String custid = (String) session.getAttribute("loginId");
		Customer loginCustomer = cr.search(custid);
		model.addAttribute("modify_customer", loginCustomer);
		return "mypage4";
	}

}
