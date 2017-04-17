package global.sesoc.banggood;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.banggood.util.FileService;

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
	public String receivePhoto(ArrayList<MultipartFile> upload, Model model) {

		System.out.println(upload.size());

/*		for (int i = 0; i < upload.size(); i++) {
			if (!upload.get(i).isEmpty()) {
				String savedfile = FileService.saveFile(upload.get(i), uploadPath);
			}
		}*/

		return "photoTest";
	}

}
