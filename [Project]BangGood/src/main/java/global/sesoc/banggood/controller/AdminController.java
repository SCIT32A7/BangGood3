package global.sesoc.banggood.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.banggood.repository.AdminRepository;
import global.sesoc.banggood.repository.MessageRepository;
import global.sesoc.banggood.util.PageNavigator;
import global.sesoc.banggood.vo.Message;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.SearchBoard;

@Controller
public class AdminController {
	
	private static final Logger log = LoggerFactory.getLogger(CustomerController.class);

	@Autowired
	HttpSession session;
	
	@Autowired
	AdminRepository ar;
	
	@Autowired
	MessageRepository mr;
	
	// 전체 매물을 산출하기 위한 메소드
	@RequestMapping(value = "admin_property", method = RequestMethod.GET)
	public String admin_property(
			@RequestParam(value = "searchid", defaultValue = "") String searchid, 
			@RequestParam(value = "page", defaultValue = "1") int page, 
			Model model){

		int countPerPage = 20; // 페이지 당 글 수
		int pagePerGroup = 10; // 페이지 그룹에 표시되는 그룹 수
		
		Map<String, Object> countMap = new HashMap<>();
		countMap.put("searchid", searchid);
		
		int total = ar.count_property(countMap);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchid", searchid);
		searchMap.put("firstText", navi.getStartRecord() + 1);
		searchMap.put("lastText", countPerPage + (navi.getCurrentPage() - 1) * countPerPage);		

		ArrayList<Property> pList = ar.select_property(searchMap);
		model.addAttribute("list", pList);
		model.addAttribute("searchid", searchid);
		model.addAttribute("navi", navi);
		model.addAttribute("page", page);
		model.addAttribute("status", "all");
		return "admin_property";
	}
	
	// 게시 허가를 기다리는 매물을 산출하기 위한 메소드
	@RequestMapping(value = "admin_waiting_property", method = RequestMethod.GET)
	public String admin_waiting_property(
			@RequestParam(value = "searchid", defaultValue = "") String searchid, 
			@RequestParam(value = "page", defaultValue = "1") int page, 
			Model model){
		
		int countPerPage = 20; // 페이지 당 글 수
		int pagePerGroup = 10; // 페이지 그룹에 표시되는 그룹 수
		
		Map<String, Object> countwMap = new HashMap<>();
		countwMap.put("searchid", searchid);
		
		int total = ar.count_waiting_property(countwMap);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		Map<String, Object> searchwMap = new HashMap<>();
		searchwMap.put("searchid", searchid);
		searchwMap.put("firstText", navi.getStartRecord() + 1);
		searchwMap.put("lastText", countPerPage + (navi.getCurrentPage() - 1) * countPerPage);		

		ArrayList<Property> pList = ar.select_waiting_property(searchwMap);
		model.addAttribute("list", pList);
		model.addAttribute("searchid", searchid);
		model.addAttribute("navi", navi);
		model.addAttribute("page", page);
		model.addAttribute("status", "waiting");
		
		return "admin_waiting_property";
	}
	
	//매물 게시 복수개 중단
	@RequestMapping(value = "stop_showing_propertys", method = RequestMethod.GET)
	public String stop_showing_propertys
	(@RequestParam(value="stopList")ArrayList<Integer> stopList){
		ar.stop_showing(stopList);
		return "redirect:admin_property";
	}
	
	//매물 게시 복수개 재시작
	@RequestMapping(value = "restart_showing_propertys", method = RequestMethod.GET)
	public String restart_propertys
	(@RequestParam(value="restartList")ArrayList<Integer> restartList){
		System.out.println("전송받은 길이 : "+restartList.size());
		ar.restart_showing(restartList);
		return "redirect:admin_waiting_property";
	}
	
	//매물 게시 한개 중단
	@RequestMapping(value = "stop_showing_property", method = RequestMethod.GET)
	public String stop_showing_property(int property_no){
		ArrayList<Integer> stopList = new ArrayList<>();
		stopList.add(property_no);
		ar.stop_showing(stopList);
		return "redirect:read_property?property_no="+property_no;
	}
	
	//매물 게시 한개 재시작
	@RequestMapping(value = "restart_showing_property", method = RequestMethod.GET)
	public String restart_property(int property_no){
		ArrayList<Integer> restartList = new ArrayList<>();
		restartList.add(property_no);
		ar.restart_showing(restartList);
		return "redirect:read_property?property_no="+property_no;
	}
	
	//관리지 메시지함 열기
	@RequestMapping(value = "admin_messageList", method = RequestMethod.GET)
	public String get_messageList( 
			@RequestParam(value = "page", defaultValue = "1") int page, 
			Model model) {
		int countPerPage = 15; // 페이지 당 글 수
		int pagePerGroup = 10; // 페이지 그룹에 표시되는 그룹 수	
		
		String custid = (String) session.getAttribute("loginId");
		
		int total = mr.getCount(custid); // 전체 글 갯수 가져오기
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		Map<String, Object> search = new HashMap<>();
		search.put("custid", custid);
		search.put("firstText", navi.getStartRecord() + 1);
		search.put("lastText", countPerPage + (navi.getCurrentPage() - 1) * countPerPage);
				
		
		ArrayList <Message> mList = mr.getMessage(search);
		model.addAttribute("navi", navi);
		model.addAttribute("messageList", mList);
		return "admin_message";
	}	
	
	// 관리자 답변함 열기
	@RequestMapping(value = "admin_writeList", method = RequestMethod.GET)
	public String get_iwirteList(@RequestParam(value = "page", defaultValue = "1") int page, 
			Model model) {
		
		int countPerPage = 15; // 페이지 당 글 수
		int pagePerGroup = 10; // 페이지 그룹에 표시되는 그룹 수	
		
		String custid = (String) session.getAttribute("loginId");
		
		int total = mr.get_iwriteCount(custid); // 전체 글 갯수 가져오기
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		Map<String, Object> search = new HashMap<>();
		search.put("custid", custid);
		search.put("firstText", navi.getStartRecord() + 1);
		search.put("lastText", countPerPage + (navi.getCurrentPage() - 1) * countPerPage);
				
		
		ArrayList <Message> mList = mr.get_iwriteList(search);
		model.addAttribute("navi", navi);
		model.addAttribute("iwriteList", mList);
		
		return "admin_writeList";
	}
	
	// 받은 요청 복수개 삭제
	@RequestMapping(value = "delete_admin_messages", method = RequestMethod.POST)
	public String delete_messages
	(@RequestParam(value="deleteList")ArrayList<Integer> deleteList){
		System.out.println(deleteList.size());
		int result = mr.delete_message(deleteList);
		System.out.println(result);
		return "redirect:admin_messageList";
	}
	
	
	// 쓴 답변 복수개 삭제
	@RequestMapping(value = "delete_admin_re_messages", method = RequestMethod.POST)
	public String delete_re_messages
	(@RequestParam(value="deleteList")ArrayList<Integer> deleteList){
		mr.delete_re_message(deleteList);
		return "redirect:admin_writeList";
	}
}
