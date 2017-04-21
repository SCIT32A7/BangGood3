package global.sesoc.banggood.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.banggood.repository.CanvasRepository;
import global.sesoc.banggood.vo.Canvas;



@Controller
public class CanvasController {
	
	private static final Logger logger = LoggerFactory.getLogger(CanvasController.class);
	
	@Autowired
	CanvasRepository repository;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping(value="/saveCanvas", method = RequestMethod.POST)
	public @ResponseBody int saveCanvas(Canvas canvas) {
		logger.info("서버 전송 내용: "+ canvas.toString());
		int result = repository.save(canvas);
		if(result == 1) {
			logger.info("저장 성공");
		} else {
			logger.info("저장 실패");
		}
		return 0;
	}
	
	@RequestMapping(value="/loadCanvas", method = RequestMethod.POST)
	public @ResponseBody Canvas loadCanvas(int datanum) {
		logger.info(datanum+"");
		Canvas result = repository.select(datanum);
		logger.info("데이터 로드 결과: "+result.toString());
		if(result != null) {
			logger.info("로드 성공");
		} else {
			logger.info("로드 실패");
		}
		return result;
	}
	
	@RequestMapping(value = "/insert_property2", method = RequestMethod.GET)
	public String canvasHome() {
		return "insert_property2";
	}
}
