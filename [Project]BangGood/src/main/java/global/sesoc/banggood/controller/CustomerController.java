package global.sesoc.banggood.controller;

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

	@RequestMapping(value = "customer_delete", method = RequestMethod.POST)
	public String delete(String custid, String password, Model model) {
		int result = cr.delete(custid, password);
		String message = null;
		if (result > 0) {
			message = "success";
		} else {
			message = "fail";
		}
		model.addAttribute("result", message);
		return "index";
	}

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
	public String mypage(Model model) {
		return "mypage";
	}

	// 관심매물로 이동
	@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
	public String mypage2(Model model) {
		return "mypage2";
	}

	// 개인정보 수정으로 이동
	@RequestMapping(value = "/mypage4", method = RequestMethod.GET)
	public String mypage4(Model model) {
		String custid = (String) session.getAttribute("loginId");
		Customer loginCustomer = cr.search(custid);
		model.addAttribute("modify_customer", loginCustomer);
		return "mypage4";
	}

}
