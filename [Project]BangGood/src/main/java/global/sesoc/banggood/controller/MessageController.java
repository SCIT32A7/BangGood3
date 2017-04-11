package global.sesoc.banggood.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import global.sesoc.banggood.repository.MessageRepository;
import global.sesoc.banggood.util.PageNavigator;
import global.sesoc.banggood.vo.Customer;
import global.sesoc.banggood.vo.Message;
import global.sesoc.banggood.vo.SearchBoard;

@Controller
public class MessageController {

	@Autowired
	HttpSession session;

	@Autowired
	MessageRepository mr;
	
	// 메시지 읽기
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(int msg_no, @RequestParam(value = "mine", defaultValue = "no") String mine, Model model) {
		Message message = mr.read_message(msg_no, mine);
		model.addAttribute("msg", message);
		model.addAttribute("mine", mine);
		return "message";
	}
	
	// 메시지 전송
	@RequestMapping(value = "/message_send", method = RequestMethod.GET)
	public String message_send(String sender, Model model) {
		model.addAttribute("sender", sender);
		return "message_send";
	}

	// 메시지 쓰기  창 열기
	@RequestMapping(value = "/message_write", method = RequestMethod.GET)
	public String message_write(Model model) {
		return "message_write";
	}
	
	// 메시지 전송 메소드
	@RequestMapping(value = "send_message", method = RequestMethod.POST)
	public String send_message(Message message, Model model) {		
		String custid = (String) session.getAttribute("loginId");
		message.setSender(custid);
		Customer result = mr.send_message(message);
		String m = null;
		if (result == null) {
			m = "fail";
		} else {
			m = "success";
		}
		model.addAttribute("result", m);
		return "message_write";
	}
	
	// 자기 쪽지함 리스트 출력
	@RequestMapping(value = "get_messageList", method = RequestMethod.GET)
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
		return "mypage3";
	}	
	
	// 자기가 쓴 쪽지함 출력
	@RequestMapping(value = "get_iwriteList", method = RequestMethod.GET)
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
		
		return "message_writed";
	}
}
