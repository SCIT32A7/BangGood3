package global.sesoc.banggood.repository;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import global.sesoc.banggood.dao.PropertyDAO;
import global.sesoc.banggood.vo.Position;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_map;

@Repository
public class PropertyRepository {

	@Autowired
	SqlSession query;

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
	public ArrayList<Property> intoMap(String searchaddress) {
		ArrayList<Property> pList = new ArrayList<>();
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		pList = pd.searchProperty(searchaddress);
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
