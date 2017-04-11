
package global.sesoc.banggood.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.banggood.repository.SearchBoardRepository;
import global.sesoc.banggood.util.PageNavigator;
import global.sesoc.banggood.vo.Customer;
import global.sesoc.banggood.vo.SearchBoard;
import global.sesoc.banggood.vo.SearchReply;

@Controller
public class SearchBoardController {

	private static final Logger log = LoggerFactory.getLogger(SearchBoardController.class);
	
	@Autowired
	HttpSession session;
	
	@Autowired
	SearchBoardRepository sbr;
	
	// 문의게시판 리스트로 이동
	@RequestMapping(value = "/searchboard", method = RequestMethod.GET)
	public String listBoard(@RequestParam(value = "searchTitle", defaultValue = "") String searchTitle,
			@RequestParam(value = "searchText", defaultValue = "") String searchText,
			@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		int countPerPage = 10; // 페이지 당 글 수
		int pagePerGroup = 5; // 페이지 그룹에 표시되는 그룹 수

		int total = sbr.getCount(searchTitle, searchText); // 전체 글 갯수 가져오기

		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);

		Map<String, Object> search = new HashMap<>();
		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);
		search.put("firstText", navi.getStartRecord() + 1);
		search.put("lastText", countPerPage + (navi.getCurrentPage() - 1) * countPerPage);

		ArrayList<SearchBoard> bList = sbr.listBoard(search);

		model.addAttribute("list", bList);
		model.addAttribute("title", searchTitle);
		model.addAttribute("text", searchText);
		model.addAttribute("navi", navi);

		return "searchboard";
	}
	
	
	// 문의게시판 글쓰기 화면으로 이동
	@RequestMapping(value ="/writeboard", method = RequestMethod.GET)
	public String writeboardform(){
		return "writeboard";
	}
	
	
	// 문의 게시글 쓴 후 리스트로 이동
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
		
		sbr.insert(br);
		return "redirect:searchboard";
	}
	
	// 문의 게시글 내용 읽기
	@RequestMapping(value ="/read_searchboard", method = RequestMethod.GET)
	public String read_searchboard(int searchBoard_no, Model model){
		SearchBoard sb = sbr.getBoard(searchBoard_no);
		ArrayList <SearchReply> srList = sbr.getList_searchReply(searchBoard_no);		
		model.addAttribute("searchBoard", sb);
		model.addAttribute("replylist", srList);
		return "searchboard_read";
	}	
	
	// 문의 게시글 삭제
	@RequestMapping(value ="/delete_searchboard", method = RequestMethod.GET)
	public String delete_searchboard(int searchBoard_no, Model model){
		sbr.delete(searchBoard_no);
		return "redirect:searchboard";
	}
	
	// 문의 게시글 수정 전 불러오기
	@RequestMapping(value ="/update_searchboardform", method = RequestMethod.GET)
	public String update_searchboardform(int searchBoard_no, Model model){
		SearchBoard sb = sbr.selectBoard(searchBoard_no);
		model.addAttribute("searchBoard", sb);
		return "updateboard";
	}
	
	// 문의 게시글 수정하기
	@RequestMapping(value ="/update_searchboard", method = RequestMethod.POST)
	public String update_searchboard(SearchBoard sb, Model model){
		sbr.update(sb);		
		return "redirect:read_searchboard?searchBoard_no="+sb.getSearchBoard_no();
	}
	
	// 문의 게시글 댓글 리스트 불러오기
	@ResponseBody
	@RequestMapping(value ="/get_searchreply", method = RequestMethod.POST)
	public ArrayList<SearchReply> get_replyList(int searchBoard_no){	
		ArrayList<SearchReply> srList = sbr.getList_searchReply(searchBoard_no);
		return srList;		
	}
	
	// 문의 게시글 댓글 입력
	@ResponseBody
	@RequestMapping(value ="/insert_searchreply", method = RequestMethod.POST)
	public int insert_reply(String searchreply, int searchBoard_no){
		SearchReply searchReply = new SearchReply();
		searchReply.setCustid((String)session.getAttribute("loginId"));
		searchReply.setSearchBoard_no(searchBoard_no);
		searchReply.setSearchReply_text(searchreply);
		int result = sbr.insert_searchReply(searchReply);		
		return result;		
	}
	
	// 문의 게시글 댓글 삭제
	@ResponseBody
	@RequestMapping(value ="/delete_searchreply", method = RequestMethod.POST)
	public int delete_reply(int searchReply_no, int searchBoard_no){
		int result = sbr.delete_searchReply(searchReply_no, searchBoard_no);		
		return 2;		
	}

}
