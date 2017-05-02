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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.banggood.repository.PropertyRepository;
import global.sesoc.banggood.util.FileService;
import global.sesoc.banggood.vo.Canvas;
import global.sesoc.banggood.vo.Maintence;
import global.sesoc.banggood.vo.Option;
import global.sesoc.banggood.vo.Picture;
import global.sesoc.banggood.vo.Position;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_list;
import global.sesoc.banggood.vo.Property_map;
import global.sesoc.banggood.vo.Property_search;
import global.sesoc.banggood.vo.propertyReply;

@Controller
@SessionAttributes({ "property", "option", "maintence", "canvas", "up_picture" })
public class PropertyController {

	@Autowired
	PropertyRepository pr;

	@Autowired
	HttpSession session;

	private ArrayList<Integer> seeList = new ArrayList<>();

	// 매물맵으로 이동
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "search";
	}

	// 테마검색
	@RequestMapping(value = "/themeSearch", method = RequestMethod.GET)
	public String search(String keyword, Model model) {
		model.addAttribute("keyword", keyword);
		return "themeSearch";
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
		String[] addressArray = property.getAddress().split(" :");
		property.setAddress(addressArray[1]);
		if (property.getRent_type().equals("year_rent")) {
			property.setRent_type("전세");
		} else {
			property.setRent_type("월세");
		}

		if (property.getProperty_type().equals("oneroom")) {
			property.setProperty_type("원룸");
		} else if (property.getProperty_type().equals("tworoom")) {
			property.setProperty_type("투룸");
		}
		model.addAttribute("property", property);
		int total = this.getTotal(option);
		option.setTotal(total);
		model.addAttribute("option", option);
		model.addAttribute("maintence", maintence);
		return "insert_property2";
	}

	public int getTotal(Option option) {
		int total = 0;
		if (option.getAir_conditioner() == 1) {
			total += 1;
		}
		if (option.getBed() == 1) {
			total += 1;
		}
		if (option.getCar() == 1) {
			total += 1;
		}
		if (option.getCloset() == 1) {
			total += 1;
		}
		if (option.getDesk() == 1) {
			total += 1;
		}
		if (option.getDoorlock() == 1) {
			total += 1;
		}
		if (option.getElevator() == 1) {
			total += 1;
		}
		if (option.getElectric_stove() == 1) {
			total += 1;
		}
		if (option.getFridge() == 1) {
			total += 1;
		}
		if (option.getGas_stove() == 1) {
			total += 1;
		}
		if (option.getMicrowave() == 1) {
			total += 1;
		}
		if (option.getPet() == 1) {
			total += 1;
		}
		if (option.getRack() == 1) {
			total += 1;
		}
		if (option.getShoecabinet() == 1) {
			total += 1;
		}
		if (option.getWashing_machine() == 1) {
			total += 1;
		}
		if (option.getGas_stove() == 1) {
			total += 1;
		}
		return total;
	}

	// 방등록 2차, 평면도 그리기 페이지로 이동
	@RequestMapping(value = "/insert_property2", method = RequestMethod.POST)
	public String insert_property2(@ModelAttribute("property") Property property,
			@ModelAttribute("option") Option option, @ModelAttribute("maintence") Maintence maintence, Canvas canvas,
			Model model) {

		canvas.setCustid(property.getCustid());
		model.addAttribute("canvas", canvas);
		return "insert_property3";
	}
	
	@RequestMapping(value = "/back_property2", method = RequestMethod.GET)
	public String back_property2(){
		return "insert_property2";
	}

	// 방등록 3차, 평면도 및 사진 첨부하기
	@RequestMapping(value = "/insert_property3", method = RequestMethod.POST)
	public String insert_property3(@ModelAttribute("property") Property property,
			@ModelAttribute("option") Option option, @ModelAttribute("maintence") Maintence maintence,
			@ModelAttribute("canvas") Canvas canvas, MultipartFile uploadFile1, MultipartFile uploadFile2,
			MultipartFile uploadFile3, MultipartFile uploadFile4, MultipartFile uploadFile5, MultipartFile uploadFile6,
			MultipartFile uploadFile7, MultipartFile uploadFile8, MultipartFile uploadFile9, MultipartFile uploadFile10,
			MultipartFile uploadFile11, MultipartFile uploadFile12, Model model) {

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

		String uploadPath = "/imageFile";

		ArrayList<Picture> insert_pList = new ArrayList<>();

		for (int i = 0; i < upload.size(); i++) {
			if (!upload.get(i).isEmpty()) {
				Picture pic = new Picture();
				String savedfile = FileService.saveFile(upload.get(i), uploadPath);
				if (i == 0) {
					pic.setPic_division("main"); // 메인사진
				}
				if (i == 1) {
					pic.setPic_division("plan"); // 평면도
				}
				if (i == 2) {
					pic.setPic_division("front"); // 입구
				}
				if (i == 3) {
					pic.setPic_division("room"); // 방
				}
				if (i == 4) {
					pic.setPic_division("kitchen"); // 싱크대
				}
				if (i == 5) {
					pic.setPic_division("bathroom"); // 화장실
				}
				if (i >= 6 && i <= 11) {
					pic.setPic_division("normal"); // 나머지 사진들
				}
				pic.setPic_name(upload.get(i).getOriginalFilename());
				pic.setPic_savename(savedfile);
				insert_pList.add(pic);
			}
		}
		model.addAttribute("up_picture", insert_pList);
		return "insert_property4";
	}

	// 방등록 4차, 입력 확인 후 디비에 등록하기
	@RequestMapping(value = "/insert_property4", method = RequestMethod.POST)
	public String insert_property4(@ModelAttribute("property") Property property,
			@ModelAttribute("option") Option option, @ModelAttribute("maintence") Maintence maintence,
			@ModelAttribute("canvas") Canvas canvas, @ModelAttribute("up_picture") ArrayList<Picture> insert_pList,
			Model model, SessionStatus status) {
		int result = pr.insert_property(property, option, maintence, canvas, insert_pList);
		model.addAttribute("result", result);
		status.setComplete();
		return "redirect:mypage";
	}

	// 계약서 출력 위한 매물 기본정보 받아오기
	@RequestMapping(value = "/contract_property", method = RequestMethod.GET)
	public String contract_property(int property_no, Model model) {
		Property property = pr.select_Property(property_no);
		model.addAttribute("property", property);
		return "contract";
	}

	// 매물 내용 상세읽기, 장바구니에서 클릭, 등록매물에서 클릭, 아무튼 리스트에서 클릭
	@RequestMapping(value = "/read_property", method = RequestMethod.GET)
	public String read_property(int property_no, Model model) {
		pr.add_hits(property_no);
		Property property = pr.select_Property(property_no);
		Option option = pr.select_Option(property_no);
		Maintence maintence = pr.select_Maintence(property_no);
		ArrayList<Picture> dbList = pr.select_Picture(property_no);
		ArrayList<Picture> pList = new ArrayList<>();
		for (int i = 0; i < dbList.size(); i++) {
			if (dbList.get(i).getPic_division().equals("main")) {
				pList.add(0, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("plan")) {
				pList.add(1, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("front")) {
				pList.add(2, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("room")) {
				pList.add(3, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("kitchen")) {
				pList.add(4, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("bathroom")) {
				pList.add(5, dbList.get(i));
			} else {
				pList.add(6, dbList.get(i));
			}
		}
		model.addAttribute("read_property", property);
		model.addAttribute("read_option", option);
		model.addAttribute("read_maintence", maintence);
		model.addAttribute("read_picture", pList);
		return "read_property";
	}

	// 지도에서 클릭해서 상세읽기
	@RequestMapping(value = "/read_propertymap", method = RequestMethod.GET)
	public String read_propertyMap(int property_no, Model model) {
		String notSession = "false";
		pr.add_hits(property_no);
		ArrayList<Integer> sessionList = (ArrayList<Integer>) session.getAttribute("clickList");
		if (sessionList.size() > 0) {
			for (int i = 0; i < sessionList.size(); i++) {
				if (sessionList.get(i) == property_no) {
					notSession = "true";
				}
			}
		}
		if (notSession.equals("false")) {
			seeList.add(property_no);
			session.setAttribute("clickList", seeList);
		}
		Property property = pr.select_Property(property_no);
		Option option = pr.select_Option(property_no);
		Maintence maintence = pr.select_Maintence(property_no);
		ArrayList<Picture> dbList = pr.select_Picture(property_no);
		ArrayList<Picture> pList = new ArrayList<>();
		for (int i = 0; i < dbList.size(); i++) {
			if (dbList.get(i).getPic_division().equals("main")) {
				pList.add(0, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("plan")) {
				pList.add(1, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("front")) {
				pList.add(2, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("room")) {
				pList.add(3, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("kitchen")) {
				pList.add(4, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("bathroom")) {
				pList.add(5, dbList.get(i));
			} else {
				pList.add(6, dbList.get(i));
			}
		}
		model.addAttribute("read_property", property);
		model.addAttribute("read_option", option);
		model.addAttribute("read_maintence", maintence);
		model.addAttribute("read_picture", pList);
		return "read_property";
	}

	// 매물 기본정보 수정을 위해 정보 물러오기
	@RequestMapping(value = "/select_property_data", method = RequestMethod.GET)
	public String select_property1(int property_no, Model model) {
		Property property = pr.select_Property(property_no);
		Option option = pr.select_Option(property_no);
		Maintence maintence = pr.select_Maintence(property_no);
		model.addAttribute("select_property", property);
		model.addAttribute("select_option", option);
		model.addAttribute("select_maintence", maintence);
		return "update_property";
	}

	// 매물 기본정보 수정
	@RequestMapping(value = "/update_property_data", method = RequestMethod.POST)
	public String update_property1(int property_no, Property property, Option option, Maintence maintence,
			Model model) {
		property.setProperty_no(property_no);
		option.setProperty_no(property_no);
		maintence.setProperty_no(property_no);
		pr.update_Property(property);
		pr.update_Option(option);
		pr.update_Maintence(maintence);
		return "redirect:read_property?property_no=" + property_no;
	}

	// 이미지 파일 수정을 위해 사진 불러오기
	@RequestMapping(value = "/select_property_file", method = RequestMethod.GET)
	public String select_property3(int property_no, Model model) {
		ArrayList<Picture> dbList = pr.select_Picture(property_no);
		ArrayList<Picture> pList = new ArrayList<>();
		for (int i = 0; i < dbList.size(); i++) {
			if (dbList.get(i).getPic_division().equals("main")) {
				pList.add(0, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("plan")) {
				pList.add(1, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("front")) {
				pList.add(2, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("room")) {
				pList.add(3, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("kitchen")) {
				pList.add(4, dbList.get(i));
			} else if (dbList.get(i).getPic_division().equals("bathroom")) {
				pList.add(5, dbList.get(i));
			} else {
				pList.add(6, dbList.get(i));
			}

		}
		model.addAttribute("picture", pList);
		model.addAttribute("property_no", property_no);
		return "update_picture";
	}

	// 사진 파일 업데이트
	@RequestMapping(value = "/update_property_file", method = RequestMethod.POST)
	public String update_property3(MultipartFile uploadFile1, MultipartFile uploadFile2, MultipartFile uploadFile3,
			MultipartFile uploadFile4, MultipartFile uploadFile5, MultipartFile uploadFile6, MultipartFile uploadFile7,
			MultipartFile uploadFile8, MultipartFile uploadFile9, MultipartFile uploadFile10,
			MultipartFile uploadFile11, MultipartFile uploadFile12, int property_no, Model model) {

		ArrayList<MultipartFile> upload = new ArrayList<>();
		upload.add(0, uploadFile1);
		upload.add(1, uploadFile2);
		upload.add(2, uploadFile3);
		upload.add(3, uploadFile4);
		upload.add(4, uploadFile5);
		upload.add(5, uploadFile6);
		upload.add(6, uploadFile7);
		upload.add(7, uploadFile8);
		upload.add(8, uploadFile9);
		upload.add(9, uploadFile10);
		upload.add(10, uploadFile11);
		upload.add(11, uploadFile12);

		System.out.println("abc : " + upload);

		ArrayList<Picture> sel_pList = pr.select_Picture(property_no);
		pr.delete_Picture(sel_pList);

		String uploadPath = "/imageFile";
		for (int i = 0; i < upload.size(); i++) {
			if (!upload.get(i).isEmpty()) {
				String savedfile = FileService.saveFile(upload.get(i), uploadPath);
				if (i < sel_pList.size()) {

					String fullpath = uploadPath + "/" + sel_pList.get(i).getPic_savename();
					FileService.deleteFile(fullpath);

					sel_pList.get(i).setPic_name(upload.get(i).getOriginalFilename());
					sel_pList.get(i).setPic_savename(savedfile);

				} else {

					Picture pic = new Picture();
					pic.setPic_name(upload.get(i).getOriginalFilename());
					pic.setProperty_no(property_no);
					pic.setPic_savename(savedfile);
					if (i == 0) {
						pic.setPic_division("main"); // 메인사진
					}
					if (i == 1) {
						pic.setPic_division("plan"); // 평면도
					}
					if (i == 2) {
						pic.setPic_division("front"); // 입구
					}
					if (i == 3) {
						pic.setPic_division("room"); // 방
					}
					if (i == 4) {
						pic.setPic_division("kitchen"); // 싱크대
					}
					if (i == 5) {
						pic.setPic_division("bathroom"); // 화장실
					}
					if (i >= 6 && i <= 11) {
						pic.setPic_division("normal"); // 나머지 사진들

					}
					sel_pList.add(pic);
				}
			}
		}
		int result = pr.insert_picture(sel_pList);
		return "redirect:read_property?property_no=" + property_no;
	}

	// 게시매물 광고 중단
	@RequestMapping(value = "/stop_showing", method = RequestMethod.GET)
	public String stop_showing(int property_no) {
		pr.stop_showing(property_no);
		return "redirect:mypage";
	}

	// 중단 중 매물 광고 개시
	@RequestMapping(value = "/restart_showing", method = RequestMethod.GET)
	public String restart_showing(int property_no) {
		pr.restart_showing(property_no);
		return "redirect:mypage";
	}

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
		System.out.println(pList.size());
		return pList;
	}

	// 맵 상의 매물의 간단 정보를 읽어오기 위한 메소드
	@RequestMapping(value = "/read_property_map", method = RequestMethod.POST)
	public @ResponseBody Property_map property_map(String address) {
		Property_map pm = null;
		pm = pr.property_map(address);
		return pm;
	}

	// 매물 사진을 불러오기 위한 메소드
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void fileDown(String pic_name, String pic_savename, HttpServletResponse response) {

		String uploadPath = "/imageFile";

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
				if (filein != null)
					filein.close();
				if (fileout != null)
					fileout.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	// 매물댓글 입력
	@ResponseBody
	@RequestMapping(value = "/insert_propertyReply", method = RequestMethod.POST)
	public int insert_propertyReply(int property_no, String propertyreply_text,
			@RequestParam(value = "replyFile", defaultValue = "") MultipartFile replyFile) {

		String uploadPath = "/replyFile";
		propertyReply prRe = new propertyReply();
		String custid = (String) session.getAttribute("loginId");
		prRe.setCustid(custid);
		prRe.setProperty_no(property_no);
		prRe.setPropertyreply_text(propertyreply_text);
		if (!replyFile.isEmpty()) {
			String savedfile = FileService.saveFile(replyFile, uploadPath);
			prRe.setPic_name(replyFile.getOriginalFilename());
			prRe.setPic_savename(savedfile);
		}
		int result = pr.insert_propertyReply(prRe);
		return result;
	}
	
	// 사진 없는 댓글입력
	@ResponseBody
	@RequestMapping(value = "/insert_propertyReply_notphoto", method = RequestMethod.POST)
	public int insert_propertyReply_notphoto(int property_no, String propertyreply_text) {
		propertyReply prRe = new propertyReply();
		String custid = (String) session.getAttribute("loginId");
		prRe.setCustid(custid);
		prRe.setProperty_no(property_no);
		prRe.setPropertyreply_text(propertyreply_text);
		int result = pr.insert_propertyReply(prRe);
		return result;
	}

	// 댓글 출력을 위한 메소드
	@ResponseBody
	@RequestMapping(value = "/get_propertyReply", method = RequestMethod.POST)
	public ArrayList<propertyReply> get_propertyReply(int property_no) {
		ArrayList<propertyReply> prList = new ArrayList<>();
		prList = pr.get_propertyReply(property_no);
		return prList;
	}

	// 댓글 삭제를 위한 메소드
	@ResponseBody
	@RequestMapping(value = "/delete_propertyReply", method = RequestMethod.POST)
	public int delete_propertyReply(int property_reply_no, int property_no) {
		int result = 0;
		propertyReply dpr = pr.select_propertyReply(property_reply_no); // 오늘입력
		result = pr.delete_propertyReply(property_reply_no, property_no);
		String uploadPath = "/replyFile";

		if (result == 1) { // 오늘 입력
			String fullpath = uploadPath + "/" + dpr.getPic_savename();
			FileService.deleteFile(fullpath);
		}
		return result;
	}

	// 댓글 사진을 불러오기 위한 메소드
	@RequestMapping(value = "reply_download", method = RequestMethod.GET)
	public void reply_download(String pic_name, String pic_savename, HttpServletResponse response) {

		String uploadPath = "/replyFile";

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
				if (filein != null)
					filein.close();
				if (fileout != null)
					fileout.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
