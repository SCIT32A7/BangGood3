package global.sesoc.banggood.repository;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.banggood.dao.CanvasDAO;
import global.sesoc.banggood.vo.Canvas;


@Repository
public class CanvasRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	public int save(Canvas canvas) {
		int result = 0;
		CanvasDAO dao = sqlSession.getMapper(CanvasDAO.class);
		try {
			result = dao.save(canvas);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public Canvas select(int datanum) {
		Canvas canvas = null;
		CanvasDAO dao = sqlSession.getMapper(CanvasDAO.class);
		try {
			canvas = dao.select(datanum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return canvas;
	}
	
	public ArrayList<Map<String, Object>> selectUserDataList(String custid) {
		ArrayList<Map<String, Object>> list = new ArrayList<>();
		CanvasDAO dao = sqlSession.getMapper(CanvasDAO.class);
		try {
			list = dao.selectUserDataList(custid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Canvas loadCanvasForUpdate(String property_no) {
		Canvas update = null;
		CanvasDAO dao = sqlSession.getMapper(CanvasDAO.class);
		try {
			update = dao.loadCanvasForUpdate(property_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return update;
	}
}
