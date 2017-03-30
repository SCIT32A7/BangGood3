package global.sesoc.banggood.vo;

public class SearchReply {

	private int searchReply_no;
	private int searchBoard_no;
	private String custid;
	private String searchReply_inputdate;
	private String searchReply_text;

	public SearchReply(int searchReply_no, int searchBoard_no, String custid, String searchReply_inputdate,
			String searchReply_text) {
		super();
		this.searchReply_no = searchReply_no;
		this.searchBoard_no = searchBoard_no;
		this.custid = custid;
		this.searchReply_inputdate = searchReply_inputdate;
		this.searchReply_text = searchReply_text;
	}

	public SearchReply(int searchBoard_no, String custid, String searchReply_text) {
		super();
		this.searchBoard_no = searchBoard_no;
		this.custid = custid;
		this.searchReply_text = searchReply_text;
	}

	public SearchReply() {
		super();
	}

	public int getSearchReply_no() {
		return searchReply_no;
	}

	public void setSearchReply_no(int searchReply_no) {
		this.searchReply_no = searchReply_no;
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

	public String getSearchReply_inputdate() {
		return searchReply_inputdate;
	}

	public void setSearchReply_inputdate(String searchReply_inputdate) {
		this.searchReply_inputdate = searchReply_inputdate;
	}

	public String getSearchReply_text() {
		return searchReply_text;
	}

	public void setSearchReply_text(String searchReply_text) {
		this.searchReply_text = searchReply_text;
	}

	@Override
	public String toString() {
		return "SearchReply [searchReply_no=" + searchReply_no + ", searchBoard_no=" + searchBoard_no + ", custid="
				+ custid + ", searchReply_inputdate=" + searchReply_inputdate + ", searchReply_text=" + searchReply_text
				+ "]";
	}

}
