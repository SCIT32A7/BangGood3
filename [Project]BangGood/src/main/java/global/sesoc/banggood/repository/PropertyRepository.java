package global.sesoc.banggood.repository;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import global.sesoc.banggood.dao.PropertyDAO;
import global.sesoc.banggood.vo.Canvas;
import global.sesoc.banggood.vo.Maintence;
import global.sesoc.banggood.vo.Option;
import global.sesoc.banggood.vo.Picture;
import global.sesoc.banggood.vo.Position;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_map;
import global.sesoc.banggood.vo.Property_search;

@Repository
public class PropertyRepository {

	@Autowired
	SqlSession query;
	

	
	// 매물 정보 디비에 삽입하는 메소드
	public int insert_property(Property property, Option option, Maintence maintence,
			Canvas canvas, ArrayList<Picture> pList){
		int result = 0;
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		try {
			result += pd.insert_property(property);  // 매물 정보 삽입
			int property_no = pd.select_recently_property();
			option.setProperty_no(property_no);
			maintence.setProperty_no(property_no);
			canvas.setProperty_no(property_no);
			for(int i=0;i<pList.size();i++){
				pList.get(i).setProperty_no(property_no);
			}
			result += pd.insert_option(option);	// 옵션 내용 삽입
			result += pd.insert_maintence(maintence);	// 관리비 포함내역 삽입
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return result;		
	}

	// 검색 범위 자동완성을 위한 메소드
	public ArrayList<String> search_point(String searchText) {
		ArrayList<String> adList = new ArrayList<>();
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		adList = pd.getPosition(searchText);
		return adList;
	}

	// 검색 범위 중심 좌표를 구하기 위해, 해당 범위의 주소를 가져오는 메소드
	public Position search_town(String searchaddress) {
		Position position = new Position();
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		String town = pd.get_town(searchaddress);
		position.setPosition_address(town);
		return position;
	}

	// 범위 안에 등록된 매물을 표시하기 위한 메소드
	public ArrayList<String> intoMap(Property_search search) {
		ArrayList<String> pList = new ArrayList<>();
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		pList = pd.searchProperty(search);
		return pList;
	}

	// 맵 상의 매물의 간단 정보를 읽어오기 위한 메소드
	public Property_map property_map(String address) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		Property_map pm = null;
		pm = pd.readProperty_map(address);
		return pm;
	}

}
