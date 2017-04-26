package global.sesoc.banggood.dao;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.banggood.vo.SearchBoard;
import global.sesoc.banggood.vo.SearchReply;

public interface SearchBoardDAO {

	// 게시글 등록
	public int insert_searchBoard(SearchBoard sb) throws Exception;

	// 게시글 읽기
	public SearchBoard get_searchBoard(int searchBoard_no) throws Exception;

	// 조회수 증가
	public int addHits(int searchBoard_no) throws Exception;

	// 전체 글 개수 구하기
	public int getCount(Map<String, String> search) throws Exception;

	// 게시글 리스트 받기
	public ArrayList<SearchBoard> list_searchBoard(Map<String, Object> search) throws Exception;

	// 게시글 수정
	public int update_searchBoard(SearchBoard sb) throws Exception;

	// 게시글 삭제
	public int delete_searchBoard(int searchBoard_no) throws Exception;
	
	// 댓글 갯수 추가
	public int addReplyCount(int searchBoard_no) throws Exception;
	
	// 댓글 갯수 감소
	public int subReplyCount(int searchBoard_no) throws Exception;

	// 문의게시판 댓글입력
	public int insert_searchReply(SearchReply sr) throws Exception;

	// 댓글리스트 출력
	public ArrayList<SearchReply> getList_searchReply(int searchBoard_no) throws Exception;

	// 댓글 삭제
	public int delete_searchReply(int searchBoard_no) throws Exception;

	// 수정 전 해당 댓글 검색
	public SearchReply select_searchReply(int searchBoard_no) throws Exception;

	// 댓글 수정
	public int update_searchReply(SearchReply sr) throws Exception;

}
