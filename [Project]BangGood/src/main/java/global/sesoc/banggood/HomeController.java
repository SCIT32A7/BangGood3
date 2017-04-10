package global.sesoc.banggood;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.banggood.dao.PropertyDAO;
import global.sesoc.banggood.repository.CustomerRepository;
import global.sesoc.banggood.repository.MessageRepository;
import global.sesoc.banggood.repository.SearchBoardRepository;
import global.sesoc.banggood.util.PageNavigator;
import global.sesoc.banggood.vo.Customer;
import global.sesoc.banggood.vo.Message;
import global.sesoc.banggood.vo.Position;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_map;
import global.sesoc.banggood.vo.SearchBoard;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	SqlSession query;

	@Autowired
	SearchBoardRepository sbr;

	@Autowired
	CustomerRepository cr;

	@Autowired
	MessageRepository mr;

	@Autowired
	HttpSession session;

	// 첫 메인 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}

	// 매물맵으로 으동
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "search";
	}

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

	@RequestMapping(value = "/insert_property", method = RequestMethod.GET)
	public String insert_property(Model model) {
		return "insert_property";
	}

	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(int msg_no, @RequestParam(value = "mine", defaultValue = "no") String mine, Model model) {
		Message message = mr.read_message(msg_no, mine);
		model.addAttribute("msg", message);
		model.addAttribute("mine", mine);
		return "message";
	}

	@RequestMapping(value = "/message_send", method = RequestMethod.GET)
	public String message_send(String sender, Model model) {
		model.addAttribute("sender", sender);
		return "message_send";
	}

	@RequestMapping(value = "/message_write", method = RequestMethod.GET)
	public String message_write(Model model) {
		return "message_write";
	}

	@RequestMapping(value = "/search_point", method = RequestMethod.GET)
	public @ResponseBody ArrayList<String> search_point(String searchText) {
		ArrayList<String> adList = null;
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		if (searchText.length() > 1) {
			adList = new ArrayList<>();
			adList = pd.getPosition(searchText);
		}
		return adList;
	}
	
	
	@RequestMapping(value = "/search_town", method = RequestMethod.GET)
	public @ResponseBody Position search_town(String searchaddress) {
		Position position = new Position();
		PropertyDAO pd = query.getMapper(PropertyDAO.class);		
		String town = pd.get_town(searchaddress);
		position.setPosition_address(town);
		return position;
	}

	@RequestMapping(value = "/intoMap", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Property> intoMap
	(@RequestParam(value = "searchaddress", defaultValue = "서울 종로") String searchaddress,
			Model model) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		ArrayList<Property> pList = pd.searchProperty(searchaddress);
		return pList;
	}

	@RequestMapping(value = "/read_property_map", method = RequestMethod.POST)
	public @ResponseBody Property_map property_map(String address) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		Property_map pm = null;
		pm = pd.readProperty_map(address);
		return pm;
	}
}
