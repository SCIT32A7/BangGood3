package global.sesoc.banggood.dao;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.banggood.vo.Canvas;

public interface CanvasDAO {
	public int save(Canvas canvas) throws Exception;
	public Canvas select(int datanum) throws Exception;
	public ArrayList<Map<String, Object>> selectUserDataList(String custid) throws Exception;
}
