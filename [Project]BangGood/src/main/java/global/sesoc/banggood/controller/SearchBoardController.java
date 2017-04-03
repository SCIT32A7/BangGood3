package global.sesoc.banggood.controller;


import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.banggood.repository.SearchBoardRepository;
import global.sesoc.banggood.vo.Customer;
import global.sesoc.banggood.vo.SearchBoard;

@Controller
public class SearchBoardController {

	private static final Logger log = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Autowired
	HttpSession session;
	
	@Autowired
	SearchBoardRepository sbr;
	
	@RequestMapping(value ="/writeboard", method = RequestMethod.GET)
	public String writeboardform(){
		return "writeboard";
	}
	
	@RequestMapping(value ="/write_searchboard", method = RequestMethod.POST)
	public String write_searchboard(SearchBoard searchboard, Model model){
		SearchBoard br = new SearchBoard();
		
		Customer customer = (Customer) session.getAttribute("loginCustomer");
		String custid = customer.getCustid();
		String email = customer.getEmail();
		br.setCustid(custid);
		br.setEmail(email);		
		
		String searchBoard_title = searchboard.getSearchBoard_title();
		String  searchBoard_text = searchboard.getSearchBoard_text();
		br.setSearchBoard_title(searchBoard_title);
		br.setSearchBoard_text(searchBoard_text);
		
		int result = sbr.insert(br);
		System.out.println(result);
		return "searchboard";
	}
	
}
