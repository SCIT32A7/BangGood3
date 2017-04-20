package global.sesoc.banggood.dao;

import global.sesoc.banggood.vo.Canvas;

public interface CanvasDAO {
	public int save(Canvas canvas) throws Exception;
	public Canvas select(int datanum) throws Exception;
}
