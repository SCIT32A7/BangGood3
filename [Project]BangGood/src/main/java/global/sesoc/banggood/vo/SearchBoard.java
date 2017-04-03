package global.sesoc.banggood.vo;

import java.util.ArrayList;

public class SearchBoard {

	private int searchBoard_no;
	private String custid;
	private String email;
	private String searchBoard_title;
	private String searchBoard_text;
	private String searchBoard_inputdate;
	private int searchBoard_hits;
	private int searchBoard_reply;
	private ArrayList<SearchReply> searchReply;

	public SearchBoard(int searchBoard_no, String custid, String email, String searchBoard_title,
			String searchBoard_text, String searchBoard_inputdate, int searchBoard_hits, int searchBoard_reply,
			ArrayList<SearchReply> searchReply) {
		super();
		this.searchBoard_no = searchBoard_no;
		this.custid = custid;
		this.email = email;
		this.searchBoard_title = searchBoard_title;
		this.searchBoard_text = searchBoard_text;
		this.searchBoard_inputdate = searchBoard_inputdate;
		this.searchBoard_hits = searchBoard_hits;
		this.searchBoard_reply = searchBoard_reply;
		this.searchReply = searchReply;
	}

	public SearchBoard() {
		super();
	}

	public int getSearchBoard_no() {
		return searchBoard_no;
	}

	public void setSearchBoard_no(int searchBoard_no) {
		this.searchBoard_no = searchBoard_no;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSearchBoard_title() {
		return searchBoard_title;
	}

	public void setSearchBoard_title(String searchBoard_title) {
		this.searchBoard_title = searchBoard_title;
	}

	public String getSearchBoard_text() {
		return searchBoard_text;
	}

	public void setSearchBoard_text(String searchBoard_text) {
		this.searchBoard_text = searchBoard_text;
	}

	public String getSearchBoard_inputdate() {
		return searchBoard_inputdate;
	}

	public void setSearchBoard_inputdate(String searchBoard_inputdate) {
		this.searchBoard_inputdate = searchBoard_inputdate;
	}

	public int getSearchBoard_hits() {
		return searchBoard_hits;
	}

	public void setSearchBoard_hits(int searchBoard_hits) {
		this.searchBoard_hits = searchBoard_hits;
	}

	public int getSearchBoard_reply() {
		return searchBoard_reply;
	}

	public void setSearchBoard_reply(int searchBoard_reply) {
		this.searchBoard_reply = searchBoard_reply;
	}

	public ArrayList<SearchReply> getSearchReply() {
		return searchReply;
	}

	public void setSearchReply(ArrayList<SearchReply> searchReply) {
		this.searchReply = searchReply;
	}

	@Override
	public String toString() {
		return "SearchBoard [searchBoard_no=" + searchBoard_no + ", custid=" + custid + ", email=" + email
				+ ", searchBoard_title=" + searchBoard_title + ", searchBoard_text=" + searchBoard_text
				+ ", searchBoard_inputdate=" + searchBoard_inputdate + ", searchBoard_hits=" + searchBoard_hits
				+ ", searchBoard_reply=" + searchBoard_reply + ", searchReply=" + searchReply + "]";
	}

}
