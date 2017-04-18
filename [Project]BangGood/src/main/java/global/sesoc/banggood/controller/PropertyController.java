package global.sesoc.banggood.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import global.sesoc.banggood.repository.PropertyRepository;
import global.sesoc.banggood.vo.Floorplan;
import global.sesoc.banggood.vo.Maintence;
import global.sesoc.banggood.vo.Option;
import global.sesoc.banggood.vo.Picture;
import global.sesoc.banggood.vo.Position;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_map;
import global.sesoc.banggood.vo.Property_search;

@Controller
@SessionAttributes({ "property", "option", "maintence", "floorplan", "picture" })
public class PropertyController {

	@Autowired
	PropertyRepository pr;

	@Autowired
	HttpSession session;

	// 매물맵으로 이동
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "search";
	}

	// 방등록 페이지로 이동
	@RequestMapping(value = "/insert_property", method = RequestMethod.GET)
	public String insert_propertyform(Model model) {
		return "insert_property";
	}
	
	@RequestMapping(value = "/insert_property", method = RequestMethod.POST)
	public String insert_property(Property property, Option option, Maintence maintence){
		String custid = (String) session.getAttribute("loginId");
		property.setCustid(custid);
		String [] addressArray = property.getAddress().split(" :");
		property.setAddress(addressArray[1]);
		if (property.getRent_type().equals("year_rent")) {
			property.setRent_type("전세");
		} else {
			property.setRent_type("월세");
		}
		
		if (property.getProperty_type().equals("oneroom")){
			property.setProperty_type("원룸");
		} else if (property.getProperty_type().equals("tworoom")){
			property.setProperty_type("투룸");
		} else if (property.getProperty_type().equals("officetel")){
			property.setProperty_type("오피스텔");
		} else {
			property.setProperty_type("아파트");
		}
		System.out.println("지도에서 받은 주소 : " + property.getAddress() + " " + property.getAddress_detail());
		int result = pr.insert_property(property, option, maintence);
		System.out.println("DB에서 받은 넘버 : " + result);
		return "insert_property";
	}

/*	// 방등록 1차, 방 정보 및 옵션 저장
	@RequestMapping(value = "/insert_property", method = RequestMethod.POST)
	public String insert_property(Property property, Option option, Maintence maintence, Model model) {
		String custid = (String) session.getAttribute("loginId");
		property.setCustid(custid);
		String [] addressArray = property.getAddress().split(" :");
		property.setAddress(addressArray[1]);
		if (property.getRent_type().equals("year_rent")) {
			property.setRent_type("전세");
		} else {
			property.setRent_type("월세");
		}
		
		if (property.getProperty_type().equals("oneroom")){
			property.setProperty_type("원룸");
		} else if (property.getProperty_type().equals("tworoom")){
			property.setProperty_type("투룸");
		} else if (property.getProperty_type().equals("officetel")){
			property.setProperty_type("오피스텔");
		} else {
			property.setProperty_type("아파트");
		}
		model.addAttribute("property", property);
		model.addAttribute("option", option);
		model.addAttribute("maintence", maintence);
		return "insert_property2";
	}

	// 방등록 2차, 평면도 그리기 페이지로 이동
	@RequestMapping(value = "/insert_property2", method = RequestMethod.POST)
	public String insert_property2(@ModelAttribute("property") Property property,
			@ModelAttribute("option") Option option, @ModelAttribute("maintence") Maintence maintence,
			Floorplan floorplan, Model model) {
		model.addAttribute("floorplan", floorplan);
		return "insert_property3";
	}

	// 방등록 3차, 평면도 및 사진 첨부하기
	@RequestMapping(value = "/insert_property3", method = RequestMethod.POST)
	public String insert_property3(@ModelAttribute("property") Property property,
			@ModelAttribute("option") Option option, @ModelAttribute("maintence") Maintence maintence,
			@ModelAttribute("floorplan") Floorplan floorplan, ArrayList<Picture> pList, Model model) {
		model.addAttribute("picture", pList);
		model.addAttribute("property", property);
		model.addAttribute("option", option);
		model.addAttribute("maintence", maintence);
		model.addAttribute("floorplan", floorplan);
		return "insert_property4";
	}

	// 방등록 4차, 입력 확인 후 디비에 등록하기
	@RequestMapping(value = "/insert_property4", method = RequestMethod.POST)
	public String insert_property4(@ModelAttribute("property") Property property,
			@ModelAttribute("option") Option option, @ModelAttribute("maintence") Maintence maintence,
			@ModelAttribute("floorplan") Floorplan floorplan, @ModelAttribute("picture") ArrayList<Picture> pList,
			Model model) {
		int result = pr.insert_property(property, option, maintence, floorplan, pList);
		model.addAttribute("result", result);
		return "insert_property4";
	}*/

	// 검색 범위 자동완성을 위한 메소드
	@RequestMapping(value = "/search_point", method = RequestMethod.GET)
	public @ResponseBody ArrayList<String> search_point(String searchText) {
		ArrayList<String> adList = null;
		if (searchText.length() > 1) {
			adList = pr.search_point(searchText);
		}
		return adList;
	}

	// 검색 범위 중심 좌표를 구하기 위해, 해당 범위의 주소를 가져오는 메소드
	@RequestMapping(value = "/search_town", method = RequestMethod.GET)
	public @ResponseBody Position search_town(String searchaddress) {
		Position position = pr.search_town(searchaddress);
		return position;
	}

	// 범위 안에 등록된 매물을 표시하기 위한 메소드
	@RequestMapping(value = "/intoMap", method = RequestMethod.POST)
	public @ResponseBody ArrayList<String> intoMap(Property_search search) {
		ArrayList<String> pList = pr.intoMap(search);
		return pList;
	}

	// 맵 상의 매물의 간단 정보를 읽어오기 위한 메소드
	@RequestMapping(value = "/read_property_map", method = RequestMethod.POST)
	public @ResponseBody Property_map property_map(String address) {
		Property_map pm = null;
		pm = pr.property_map(address);
		return pm;
	}

}
