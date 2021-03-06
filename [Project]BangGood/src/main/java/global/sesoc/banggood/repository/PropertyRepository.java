package global.sesoc.banggood.repository;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.banggood.dao.CanvasDAO;
import global.sesoc.banggood.dao.PropertyDAO;
import global.sesoc.banggood.vo.Canvas;
import global.sesoc.banggood.vo.Maintence;
import global.sesoc.banggood.vo.Option;
import global.sesoc.banggood.vo.Picture;
import global.sesoc.banggood.vo.Position;
import global.sesoc.banggood.vo.Property;
import global.sesoc.banggood.vo.Property_map;
import global.sesoc.banggood.vo.Property_search;
import global.sesoc.banggood.vo.propertyReply;

@Repository
public class PropertyRepository {

	@Autowired
	SqlSession query;

	@Autowired
	CanvasRepository repository;

	// 매물 정보 디비에 삽입하는 메소드
	public int insert_property(Property property, Option option, Maintence maintence, Canvas canvas,
			ArrayList<Picture> pList) {
		int result = 0;
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		CanvasDAO cd = query.getMapper(CanvasDAO.class);
		try {
			result += pd.insert_property(property); // 매물 정보 삽입

			int property_no = pd.select_recently_property();

			option.setProperty_no(property_no);
			maintence.setProperty_no(property_no);
			canvas.setProperty_no(property_no);
			for (int i = 0; i < pList.size(); i++) {
				pList.get(i).setProperty_no(property_no);
			}
			result += pd.insert_option(option); // 옵션 내용 삽입
			result += pd.insert_maintence(maintence); // 관리비 포함내역 삽입
			// 평면도 내용 삽입
			result += cd.save(canvas);
			for (int i = 0; i < pList.size(); i++) {
				result += pd.insert_picture(pList.get(i));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	// 사진만 입력 메소드
	public int insert_picture(ArrayList<Picture> pList){
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		int result=0;
		for (int i = 0; i < pList.size(); i++) {
			try {
				result += pd.insert_picture(pList.get(i));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

	// 매물 기본정보 불러오기
	public Property select_Property(int property_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		Property read_property = null;
		try {
			read_property = pd.select_property_property(property_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return read_property;
	}

	// 매물 기본정보 업데이트
	public int update_Property(Property property) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		int result = 0;
		try {
			result = pd.update_property(property);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 매물 옵션 불러오기
	public Option select_Option(int property_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		Option read_option = null;
		try {
			read_option = pd.select_property_option(property_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return read_option;
	}

	// 매물 옵션 업데이트
	public int update_Option(Option option) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		int result = 0;
		try {
			result = pd.update_option(option);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 매물 관리비내역 불러오기
	public Maintence select_Maintence(int property_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		Maintence read_maintence = null;
		try {
			read_maintence = pd.select_property_maintence(property_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return read_maintence;
	}

	// 매물 관리비 업데이트
	public int update_Maintence(Maintence maintence) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		int result = 0;
		try {
			result = pd.update_maintence(maintence);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 매물 사진정보 불러오기
	public ArrayList<Picture> select_Picture(int property_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		ArrayList<Picture> read_picture = new ArrayList<>();
		try {
			read_picture = pd.select_property_picture(property_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return read_picture;
	}

	// 매물 사진정보 업데이트 사진 삭제하기
	public int delete_Picture(ArrayList<Picture> pList) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		int result = 0;
		for (Picture picture : pList) {
			try {
				result += pd.delete_picture(picture);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

	// 조회수 증가
	public void add_hits(int property_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		try {
			pd.add_property_hits(property_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 검색 범위 자동완성을 위한 메소드
	public ArrayList<String> search_point(String searchText) {
		ArrayList<String> adList = new ArrayList<>();
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		try {
			adList = pd.getPosition(searchText);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return adList;
	}

	// 검색 범위 중심 좌표를 구하기 위해, 해당 범위의 주소를 가져오는 메소드
	public Position search_town(String searchaddress) {
		Position position = new Position();
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		String town = null;
		try {
			town = pd.get_town(searchaddress);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		position.setPosition_address(town);
		return position;
	}

	// 범위 안에 등록된 매물을 표시하기 위한 메소드
	public ArrayList<String> intoMap(Property_search search) {
		ArrayList<String> pList = new ArrayList<>();
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		try {
			pList = pd.searchProperty(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pList;
	}

	// 맵 상의 매물의 간단 정보를 읽어오기 위한 메소드
	public Property_map property_map(String address) {
		System.out.println(" "+address);
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		Property_map pm = null;
		ArrayList<Property_map> pmList;
		try {
			pmList = pd.readProperty_map(" "+address);
			if(pmList.size() == 0){
				if(address.contains("1동")){
					address = address.replace("1동", "일동");
					System.out.println("바뀐주소" + address);
					pmList = pd.readProperty_map(" "+address);
				}else if(address.contains("2동")){
					address = address.replace("2동", "이동");
					System.out.println("바뀐주소" + address);
					pmList = pd.readProperty_map(" "+address);
				}else if(address.contains("3동")){
					address = address.replace("3동", "삼동");
					System.out.println("바뀐주소" + address);
					pmList = pd.readProperty_map(" "+address);
				}else if(address.contains("4동")){
					address = address.replace("4동", "사동");
					System.out.println("바뀐주소" + address);
					pmList = pd.readProperty_map(" "+address);
				}
				pm = pmList.get(0);
			}else{
			 pm = pmList.get(0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pm;
	}

	// 게시 중단
	public int stop_showing(int property_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		int result = 0;
		try {
			result = pd.stop_showing(property_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 게시 재게
	public int restart_showing(int property_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		int result = 0;
		try {
			result = pd.restart_showing(property_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 댓글 입력
	public int insert_propertyReply(propertyReply pr) {
		System.out.println(pr);
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		int result = 0;
		try {
			result = pd.insert_propertyReply(pr);
			pd.add_reply_count(pr.getProperty_no());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 댓글 출력
	public ArrayList<propertyReply> get_propertyReply(int property_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		ArrayList<propertyReply> prList = new ArrayList<>();
		try {
			prList = pd.get_propertyReply(property_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prList;
	}

	// 댓글 삭제
	public int delete_propertyReply(int property_reply_no, int property_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		int result = 0;
		try {
			result = pd.delete_propertyReply(property_reply_no);
			if(result==1){
				pd.sub_reply_count(property_no);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 댓글 불러오기
	public propertyReply select_propertyReply(int property_reply_no) {
		PropertyDAO pd = query.getMapper(PropertyDAO.class);
		propertyReply pr = null;
		try {
			pr = pd.select_propertyReply(property_reply_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pr;
	}

}
