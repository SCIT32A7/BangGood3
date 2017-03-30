package global.sesoc.banggood.vo;

import java.util.ArrayList;

public class RoomReply {

	private int reply_no;
	private int property_no;
	private String custid;
	private String reply_inputdate;
	private String reply_text;
	private ArrayList<Picture_reply> picList;
	private ArrayList<Reply2> reply2List;

	public RoomReply(int reply_no, int property_no, String custid, String reply_inputdate, String reply_text,
			ArrayList<Picture_reply> picList, ArrayList<Reply2> reply2List) {
		super();
		this.reply_no = reply_no;
		this.property_no = property_no;
		this.custid = custid;
		this.reply_inputdate = reply_inputdate;
		this.reply_text = reply_text;
		this.picList = picList;
		this.reply2List = reply2List;
	}

	public RoomReply(int reply_no, String custid, String reply_text) {
		super();
		this.reply_no = reply_no;
		this.custid = custid;
		this.reply_text = reply_text;
	}

	public RoomReply(int reply_no, String custid, String reply_text, ArrayList<Picture_reply> picList) {
		super();
		this.reply_no = reply_no;
		this.custid = custid;
		this.reply_text = reply_text;
		this.picList = picList;
	}

	public RoomReply() {
		super();
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getProperty_no() {
		return property_no;
	}

	public void setProperty_no(int property_no) {
		this.property_no = property_no;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getReply_inputdate() {
		return reply_inputdate;
	}

	public void setReply_inputdate(String reply_inputdate) {
		this.reply_inputdate = reply_inputdate;
	}

	public String getReply_text() {
		return reply_text;
	}

	public void setReply_text(String reply_text) {
		this.reply_text = reply_text;
	}

	public ArrayList<Picture_reply> getPicList() {
		return picList;
	}

	public void setPicList(ArrayList<Picture_reply> picList) {
		this.picList = picList;
	}

	public ArrayList<Reply2> getReply2List() {
		return reply2List;
	}

	public void setReply2List(ArrayList<Reply2> reply2List) {
		this.reply2List = reply2List;
	}

	@Override
	public String toString() {
		return "RoomReply [reply_no=" + reply_no + ", property_no=" + property_no + ", custid=" + custid
				+ ", reply_inputdate=" + reply_inputdate + ", reply_text=" + reply_text + "]";
	}

}
