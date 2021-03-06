package global.sesoc.banggood.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.banggood.dao.CanvasDAO;
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
		int result = 0;
		logger.info("서버 전송 내용: "+ canvas.toString());
		String custid = (String) session.getAttribute("loginId");
		if(custid == null) {
			logger.info("로그인 후 캔버스 저장 가능");
			result = -1;
		} else {
			//아이디 세팅
			canvas.setCustid(custid);
			//디비 저장
			result = repository.save(canvas);
			if(result == 1) {
				logger.info("저장 성공");
			} else {
				logger.info("저장 실패");
			}
		}
		return result;
	}
	
	@RequestMapping(value="/loadCanvas", method = RequestMethod.POST)
	public @ResponseBody Canvas loadCanvas(int datanum) {
		Canvas result = repository.select(datanum);
		logger.info("데이터 로드 결과: "+result.toString());
		if(result != null) {
			logger.info("로드 성공");
		} else {
			logger.info("로드 실패");
		}
		return result;
	}
	
	@RequestMapping(value="/practiceFloorplan", method = RequestMethod.GET)
	public String practiceCanvas() {
		return "practiceFloorplan";
	}
	
	@RequestMapping(value = "/loadCanvasForUpdate", method = RequestMethod.GET)
	public String updateCanvas(String property_no) {
		Canvas result = repository.loadCanvasForUpdate(property_no);
		session.setAttribute("canvasForUpdate", result);
		System.out.println("updateCanvas "+result.toString());
		session.setAttribute("updateCanvas", result);
		return "updateFloorplan";
	}
	
	@RequestMapping(value = "/updateCanvas", method = RequestMethod.POST)
	public @ResponseBody int updateCanvas(Canvas canvas) {
		int result = 0;
		session.getAttribute("canvas");
		Canvas canvasForUpdate = (Canvas) session.getAttribute("canvasForUpdate");
		canvas.setDatanum(canvasForUpdate.getDatanum());
		System.out.println("업데이트 캔버스: "+canvas.toString());
		
		result = repository.updateCanvas(canvas);
		if(result == 1) {
			logger.info("업데이트 성공");
		}else {
			logger.info("업데이트 실패");
		}
		return result;
	}
	
	@RequestMapping(value="/loadUserDataList", method = RequestMethod.POST)
	public @ResponseBody ArrayList<Map<String, Object>> selectUserDataList(String custid) {
		ArrayList<Map<String, Object>> list = null;
		try {
			list = repository.selectUserDataList(custid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@RequestMapping(value = "/insert_property2", method = RequestMethod.GET)
	public String canvasHome() {
		return "insert_property2";
	}
}
