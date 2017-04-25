package global.sesoc.banggood.vo;

import java.util.ArrayList;

public class propertyReply {

	private int property_reply_no;
	private int property_no;
	private String custid;
	private String propertyreply_inputdate;
	private String propertyreply_text;
	private String pic_name;
	private String pic_savename;

	public propertyReply() {
		super();
	}

	public int getProperty_reply_no() {
		return property_reply_no;
	}

	public void setProperty_reply_no(int property_reply_no) {
		this.property_reply_no = property_reply_no;
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

	public String getPropertyreply_inputdate() {
		return propertyreply_inputdate;
	}

	public void setPropertyreply_inputdate(String propertyreply_inputdate) {
		this.propertyreply_inputdate = propertyreply_inputdate;
	}

	public String getPropertyreply_text() {
		return propertyreply_text;
	}

	public void setPropertyreply_text(String propertyreply_text) {
		this.propertyreply_text = propertyreply_text;
	}

	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}

	public String getPic_savename() {
		return pic_savename;
	}

	public void setPic_savename(String pic_savename) {
		this.pic_savename = pic_savename;
	}

	@Override
	public String toString() {
		return "propertyReply [property_reply_no=" + property_reply_no + ", property_no=" + property_no + ", custid="
				+ custid + ", propertyreply_inputdate=" + propertyreply_inputdate + ", propertyreply_text="
				+ propertyreply_text + ", pic_name=" + pic_name + ", pic_savename=" + pic_savename + "]";
	}

}
