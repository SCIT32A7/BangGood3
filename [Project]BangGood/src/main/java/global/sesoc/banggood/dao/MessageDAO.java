package global.sesoc.banggood.dao;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.banggood.vo.Message;

public interface MessageDAO {
     
	 // 메시지보내기
	 public int send_message(Message message) throws Exception; 
	 
	 // 메시지 읽기
	 public Message read_message(int msg_no) throws Exception;
	 
	 // 메시지 읽은 후 상태변경
	 public int update_readdate(int msg_no) throws Exception;
	 
	 // 메시지함 열었을 때 목록 띄우기
	 public ArrayList<Message> getMessage(Map<String, Object> getMList) throws Exception;
	 
	 // 내그 쓴 메이지함 목록 띄우기
	 public ArrayList<Message> get_iwriteList(Map<String, Object> getMList) throws Exception;
	 
	 // 메시지함 열기 전 갯수 구하기
	 public int getCount(String  custid) throws Exception;
	 
	 // 내가 쓴 메시지 리스트 출력전  메시지 갯수 구하기
	 public int get_iwriteCount(String  custid) throws Exception;
	
	 // 메시지 지우기
	 public int delete_message(int msg_no) throws Exception;
	 
}
