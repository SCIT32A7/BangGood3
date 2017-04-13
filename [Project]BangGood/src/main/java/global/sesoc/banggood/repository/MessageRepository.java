package global.sesoc.banggood.repository;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.banggood.dao.CustomerDAO;
import global.sesoc.banggood.dao.MessageDAO;
import global.sesoc.banggood.vo.Customer;
import global.sesoc.banggood.vo.Message;

@Repository
public class MessageRepository {

	@Autowired
	SqlSession session;

	// 메시지 전송
	public Customer send_message(Message message) {
		CustomerDAO cDao = session.getMapper(CustomerDAO.class);
		MessageDAO dao = session.getMapper(MessageDAO.class);
		
		Customer result = null;
		try {
			result = cDao.customer_select(message.getReceiver());
			if(result != null){
				dao.send_message(message);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 메시지 읽기
	public Message read_message(int msg_no, String mine) {
		MessageDAO dao = session.getMapper(MessageDAO.class);
		Message m = null;
		try {
			m = dao.read_message(msg_no);
			if (mine.equals("no") && m.getIsChecked().equals("false")) {
				dao.update_readdate(msg_no); // 메시지 상태 변화
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;
	}

	// 메시지 함 열기
	public ArrayList<Message> getMessage(Map<String, Object> search) {
		MessageDAO dao = session.getMapper(MessageDAO.class);
		ArrayList<Message> mList = new ArrayList<>();
		try {
			mList = dao.getMessage(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mList;
	}

	public int getCount(String custid) {
		MessageDAO dao = session.getMapper(MessageDAO.class);
		int count = 0;
		try {
			count = dao.getCount(custid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	// 내가 쓴 메시지 함 열기
	public ArrayList<Message> get_iwriteList(Map<String, Object> search) {
		MessageDAO dao = session.getMapper(MessageDAO.class);
		ArrayList<Message> mList = new ArrayList<>();
		try {
			mList = dao.get_iwriteList(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mList;
	}

	public int get_iwriteCount(String custid) {
		MessageDAO dao = session.getMapper(MessageDAO.class);
		int count = 0;
		try {
			count = dao.get_iwriteCount(custid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	// 메시지 삭제
	public int delete_message(int msg_no) {
		MessageDAO dao = session.getMapper(MessageDAO.class);
		int result = 0;
		try {
			result = dao.delete_message(msg_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

}
