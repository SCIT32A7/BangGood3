package global.sesoc.banggood.vo;

import java.util.ArrayList;

public class Property {

	private int property_no;
	private String custid;
	private String rent_type;
	private String address;
	private String address_detail;
	private String bulildingName;
	private int floor;
	private String property_type;
	private int deposit;
	private int month_fee;
	private int maintence_fee;
	private int built_year;
	private Double roomsize;
	private String isaccessible;
	private String issoldout;
	private String property_title;
	private String property_text;
	private String property_inputdate;
	private int property_hits;
	private int reply_count;
	private int property_like;

	public Property() {
		super();
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

	public String getRent_type() {
		return rent_type;
	}

	public void setRent_type(String rent_type) {
		this.rent_type = rent_type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getBulildingName() {
		return bulildingName;
	}

	public void setBulildingName(String bulildingName) {
		this.bulildingName = bulildingName;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getProperty_type() {
		return property_type;
	}

	public void setProperty_type(String property_type) {
		this.property_type = property_type;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public int getMonth_fee() {
		return month_fee;
	}

	public void setMonth_fee(int month_fee) {
		this.month_fee = month_fee;
	}

	public int getMaintence_fee() {
		return maintence_fee;
	}

	public void setMaintence_fee(int maintence_fee) {
		this.maintence_fee = maintence_fee;
	}

	public int getBuilt_year() {
		return built_year;
	}

	public void setBuilt_year(int built_year) {
		this.built_year = built_year;
	}

	public Double getRoomsize() {
		return roomsize;
	}

	public void setRoomsize(Double roomsize) {
		this.roomsize = roomsize;
	}

	public String getIsaccessible() {
		return isaccessible;
	}

	public void setIsaccessible(String isaccessible) {
		this.isaccessible = isaccessible;
	}

	public String getIssoldout() {
		return issoldout;
	}

	public void setIssoldout(String issoldout) {
		this.issoldout = issoldout;
	}

	public String getProperty_title() {
		return property_title;
	}

	public void setProperty_title(String property_title) {
		this.property_title = property_title;
	}

	public String getProperty_text() {
		return property_text;
	}

	public void setProperty_text(String property_text) {
		this.property_text = property_text;
	}

	public String getProperty_inputdate() {
		return property_inputdate;
	}

	public void setProperty_inputdate(String property_inputdate) {
		this.property_inputdate = property_inputdate;
	}

	public int getProperty_hits() {
		return property_hits;
	}

	public void setProperty_hits(int property_hits) {
		this.property_hits = property_hits;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public int getProperty_like() {
		return property_like;
	}

	public void setProperty_like(int property_like) {
		this.property_like = property_like;
	}

	@Override
	public String toString() {
		return "Property [property_no=" + property_no + ", custid=" + custid + ", rent_type=" + rent_type + ", address="
				+ address + ", address_detail=" + address_detail + ", bulildingName=" + bulildingName + ", floor="
				+ floor + ", property_type=" + property_type + ", deposit=" + deposit + ", month_fee=" + month_fee
				+ ", maintence_fee=" + maintence_fee + ", built_year=" + built_year + ", roomsize=" + roomsize
				+ ", isaccessible=" + isaccessible + ", issoldout=" + issoldout + ", property_title=" + property_title
				+ ", property_text=" + property_text + ", property_inputdate=" + property_inputdate + ", property_hits="
				+ property_hits + ", reply_count=" + reply_count + ", property_like=" + property_like + "]";
	}

}
