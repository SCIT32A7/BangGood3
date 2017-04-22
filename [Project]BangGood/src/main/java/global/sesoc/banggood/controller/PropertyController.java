package global.sesoc.banggood.controller;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.banggood.repository.PropertyRepository;
import global.sesoc.banggood.util.FileService;
import global.sesoc.banggood.vo.Canvas;
import global.sesoc.banggood.vo.Maintence;
import global.sesoc.banggood.vo.Option;
import global.sesoc.banggood.vo.Picture;
import global.sesoc.banggood.vo.Position;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_map;
import global.sesoc.banggood.vo.Property_search;

@Controller
@SessionAttributes({ "property", "option", "maintence", "canvas", "picture" })
public class PropertyController {

	@Autowired
	PropertyRepository pr;

	@Autowired
	HttpSession session;
	
	final String uploadPath = "/imageFile";

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
	
	// 방등록 1차, 방 정보 및 옵션 저장
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
			Canvas canvas, Model model) {
		System.out.println("insert_property2");
		System.out.println(canvas.toString());
		//유저 데이터 저장
		System.out.println(property.getCustid());
		canvas.setCustid(property.getCustid());
		
		model.addAttribute("canvas", canvas);
		return "insert_property3";
	}

	// 방등록 3차, 평면도 및 사진 첨부하기
	@RequestMapping(value = "/insert_property3", method = RequestMethod.POST)
	public String insert_property3(@ModelAttribute("property") Property property,
			@ModelAttribute("option") Option option, @ModelAttribute("maintence") Maintence maintence,
			@ModelAttribute("canvas") Canvas canvas, 
			MultipartFile uploadFile1, MultipartFile uploadFile2, MultipartFile uploadFile3,
			MultipartFile uploadFile4, MultipartFile uploadFile5, MultipartFile uploadFile6, MultipartFile uploadFile7,
			MultipartFile uploadFile8, MultipartFile uploadFile9, MultipartFile uploadFile10,
			MultipartFile uploadFile11, MultipartFile uploadFile12, Model model) {
		System.out.println("1");
		
		ArrayList<MultipartFile> upload = new ArrayList<>();
		upload.add(uploadFile1);
		upload.add(uploadFile2);
		upload.add(uploadFile3);
		upload.add(uploadFile4);
		upload.add(uploadFile5);
		upload.add(uploadFile6);
		upload.add(uploadFile7);
		upload.add(uploadFile8);
		upload.add(uploadFile9);
		upload.add(uploadFile10);
		upload.add(uploadFile11);
		upload.add(uploadFile12);

		ArrayList<Picture> insert_pList = new ArrayList<>();
		
		for (int i = 0; i < upload.size(); i++) {
			String savedfile = null;
			Picture pic = null;
			if (!upload.get(i).isEmpty()) {
				pic = new Picture();
				savedfile = FileService.saveFile(upload.get(i), uploadPath);
				if(i == 0){
					pic.setPic_division("main"); // 메인사진
				}
				if(i == 1){
					pic.setPic_division("plan");	// 평면도
				}
				if(i == 2){
					pic.setPic_division("front");	// 입구
				}
				if(i == 3){
					pic.setPic_division("room");	// 방
				}
				if(i == 4){
					pic.setPic_division("kitchen");  // 싱크대
				}
				if(i == 5){
					pic.setPic_division("bathroom");	//화장실
				}
				if(i >=6 && i <=11){
					pic.setPic_division("normal");	//나머지 사진들
				}
				pic.setPic_name(upload.get(i).getOriginalFilename());
				pic.setPic_savename(savedfile);
				insert_pList.add(pic);
			}
		}
		System.out.println("2");
		model.addAttribute("picture", insert_pList);
		System.out.println("3");
		return "insert_property4";
	}

	// 방등록 4차, 입력 확인 후 디비에 등록하기
	@RequestMapping(value = "/insert_property4", method = RequestMethod.POST)
	public String insert_property4(@ModelAttribute("property") Property property,
			@ModelAttribute("option") Option option, @ModelAttribute("maintence") Maintence maintence,
			@ModelAttribute("canvas") Canvas canvas, @ModelAttribute("picture") ArrayList<Picture> pList,
			Model model) {
		int result = pr.insert_property(property, option, maintence, canvas, pList);
		model.addAttribute("result", result);
		return "insert_property4";
	}
	
	/*@RequestMapping(value = "/insert_property4", method = RequestMethod.GET)
	public String insert_property4(){
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
	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void fileDown(String pic_name, String pic_savename, HttpServletResponse response) {
		// 파일을 받기위해 해당 게시글을 받아온다.
		String originalfile = pic_name;
		// 사용자가 다운로드 받기 위해 response 객체의 해드를 조작한다.
		try {
			response.setHeader("Content-Disposition",
					"attachment;filename=" + URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String fullpath = uploadPath + "/" + pic_savename;
		ServletOutputStream fileout = null;
		FileInputStream filein = null;
		try {
			filein = new FileInputStream(fullpath);
			fileout = response.getOutputStream();
			// Spring에서 제공하는 유틸리티
			FileCopyUtils.copy(filein, fileout);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (filein != null) filein.close();
				if (fileout != null) fileout.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
