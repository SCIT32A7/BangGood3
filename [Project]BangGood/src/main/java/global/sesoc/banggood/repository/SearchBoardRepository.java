package global.sesoc.banggood.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.banggood.dao.SearchBoardDAO;
import global.sesoc.banggood.vo.SearchBoard;
import global.sesoc.banggood.vo.SearchReply;

@Repository
public class SearchBoardRepository {

	@Autowired
	SqlSession sqlsession;
	
	//게시글 리스트 받기
	public ArrayList<SearchBoard> listBoard(Map<String, Object> search){
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		ArrayList<SearchBoard> bList = null;
		try {
			bList = dao.list_searchBoard(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bList;
	}
	
	//게시글 읽기
	public SearchBoard getBoard(int searchBoard_no){
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		SearchBoard board = null;
		try {
			dao.addHits(searchBoard_no);
			board = dao.get_searchBoard(searchBoard_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return board;
	}
	
	//게시글 찾기
	public SearchBoard selectBoard(int searchBoard_no){
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		SearchBoard board = null;
		try {
			board = dao.get_searchBoard(searchBoard_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return board;
	}
	
	// 전체 글 갯수 구하기
	public int getCount(String searchTitle, String searchText){
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		Map<String, String> search = new HashMap<>();
		search.put("searchTitle", searchTitle);
		search.put("searchText", searchText);
		int count = 0;
		try {
			count = dao.getCount(search);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	// 문의 게시글 입력
	public int insert(SearchBoard board){
		int result = 0;
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		try {
			result = dao.insert_searchBoard(board);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	// 문의 게시글 삭제
	public int delete(int searchBoard_no){
		int result = 0;
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		try {
			result = dao.delete_searchBoard(searchBoard_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	// 문의 게시글 수정
	public int update(SearchBoard board){
		int result = 0;
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		try {
			result = dao.update_searchBoard(board);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	// 게시글 댓글 출력
	public ArrayList<SearchReply> getList_searchReply (int searchBoard_no){
		ArrayList<SearchReply> srList = new ArrayList<>();
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		try {
			srList = dao.getList_searchReply(searchBoard_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return srList;
	}
	
	// 댓글 입력
	public int insert_searchReply(SearchReply searchReply){
		int result = 0;
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		try {
			result = dao.insert_searchReply(searchReply);
			dao.addReplyCount(searchReply.getSearchBoard_no());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete_searchReply(int searchReply_no, int searchBoard_no){
		int result = 0;
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		try {
			result = dao.delete_searchReply(searchReply_no);
			dao.subReplyCount(searchBoard_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//수정 전 댓글 호출
	public SearchReply select_searchReply(int searchReply_no){
		SearchReply sr = null;
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		try {
			sr = dao.select_searchReply(searchReply_no);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sr;		
	}
	
	// 댓글 수정
	public int update_searchReply (SearchReply sr){
		int result = 0;
		SearchBoardDAO dao = sqlsession.getMapper(SearchBoardDAO.class);
		try {
			result = dao.update_searchReply(sr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
}
