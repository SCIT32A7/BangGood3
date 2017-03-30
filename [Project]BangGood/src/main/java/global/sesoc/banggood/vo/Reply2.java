package global.sesoc.banggood.vo;

public class Reply2 {

	private int reply2_no;
	private int reply_no;
	private String custid;
	private String reply2_inputdate;
	private String reply2_text;

	public Reply2(int reply2_no, int reply_no, String custid, String reply2_inputdate, String reply2_text) {
		super();
		this.reply2_no = reply2_no;
		this.reply_no = reply_no;
		this.custid = custid;
		this.reply2_inputdate = reply2_inputdate;
		this.reply2_text = reply2_text;
	}

	public Reply2(int reply_no, String custid, String reply2_text) {
		super();
		this.reply_no = reply_no;
		this.custid = custid;
		this.reply2_text = reply2_text;
	}

	public Reply2() {
		super();
	}

	public int getReply2_no() {
		return reply2_no;
	}

	public void setReply2_no(int reply2_no) {
		this.reply2_no = reply2_no;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getReply2_inputdate() {
		return reply2_inputdate;
	}

	public void setReply2_inputdate(String reply2_inputdate) {
		this.reply2_inputdate = reply2_inputdate;
	}

	public String getReply2_text() {
		return reply2_text;
	}

	public void setReply2_text(String reply2_text) {
		this.reply2_text = reply2_text;
	}

	@Override
	public String toString() {
		return "Reply2 [reply2_no=" + reply2_no + ", reply_no=" + reply_no + ", custid=" + custid
				+ ", reply2_inputdate=" + reply2_inputdate + ", reply2_text=" + reply2_text + "]";
	}

}
