package global.sesoc.banggood;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.banggood.util.FileService;
import global.sesoc.banggood.vo.Picture;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	final String uploadPath = "/imageFile";

	// 첫 메인 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}

	@RequestMapping(value = "savephoto", method = RequestMethod.POST)
	public String receivePhoto(MultipartFile uploadFile1, MultipartFile uploadFile2, MultipartFile uploadFile3,
			MultipartFile uploadFile4, MultipartFile uploadFile5, MultipartFile uploadFile6, MultipartFile uploadFile7,
			MultipartFile uploadFile8, MultipartFile uploadFile9, MultipartFile uploadFile10,
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
					pic.setPic_division("flan");	// 평면도
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
		model.addAttribute("picList", insert_pList);
		return "photoTest";
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
