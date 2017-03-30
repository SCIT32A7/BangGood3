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
	private Double roomSize;
	private String isAccessible;
	private String isSoldOut;
	private String board_title;
	private String board_text;
	private String board_inputdate;
	private int board_hits;
	private int reply_count;
	private ArrayList<RoomReply> replyList;
	private ArrayList<Picture> picList;
	private Floorplan floorplan;
	private Maintence maintence;
	private Option option;

	public Property(int property_no, String custid, String rent_type, String address, String address_detail,
			String bulildingName, int floor, String property_type, int deposit, int month_fee, int maintence_fee,
			int built_year, Double roomSize, String isAccessible, String isSoldOut, String board_title,
			String board_text, String board_inputdate, int board_hits, int reply_count, ArrayList<RoomReply> replyList,
			ArrayList<Picture> picList, Floorplan floorplan, Maintence maintence, Option option) {
		super();
		this.property_no = property_no;
		this.custid = custid;
		this.rent_type = rent_type;
		this.address = address;
		this.address_detail = address_detail;
		this.bulildingName = bulildingName;
		this.floor = floor;
		this.property_type = property_type;
		this.deposit = deposit;
		this.month_fee = month_fee;
		this.maintence_fee = maintence_fee;
		this.built_year = built_year;
		this.roomSize = roomSize;
		this.isAccessible = isAccessible;
		this.isSoldOut = isSoldOut;
		this.board_title = board_title;
		this.board_text = board_text;
		this.board_inputdate = board_inputdate;
		this.board_hits = board_hits;
		this.reply_count = reply_count;
		this.replyList = replyList;
		this.picList = picList;
		this.floorplan = floorplan;
		this.maintence = maintence;
		this.option = option;
	}

	public Property(String custid, String rent_type, String address, String address_detail, String bulildingName,
			int floor, String property_type, int deposit, int month_fee, int maintence_fee, int built_year,
			Double roomSize, String board_title, String board_text, Floorplan floorplan, Maintence maintence,
			Option option) {
		super();
		this.custid = custid;
		this.rent_type = rent_type;
		this.address = address;
		this.address_detail = address_detail;
		this.bulildingName = bulildingName;
		this.floor = floor;
		this.property_type = property_type;
		this.deposit = deposit;
		this.month_fee = month_fee;
		this.maintence_fee = maintence_fee;
		this.built_year = built_year;
		this.roomSize = roomSize;
		this.board_title = board_title;
		this.board_text = board_text;
		this.floorplan = floorplan;
		this.maintence = maintence;
		this.option = option;
	}

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

	public Double getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(Double roomSize) {
		this.roomSize = roomSize;
	}

	public String getIsAccessible() {
		return isAccessible;
	}

	public void setIsAccessible(String isAccessible) {
		this.isAccessible = isAccessible;
	}

	public String getIsSoldOut() {
		return isSoldOut;
	}

	public void setIsSoldOut(String isSoldOut) {
		this.isSoldOut = isSoldOut;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_text() {
		return board_text;
	}

	public void setBoard_text(String board_text) {
		this.board_text = board_text;
	}

	public String getBoard_inputdate() {
		return board_inputdate;
	}

	public void setBoard_inputdate(String board_inputdate) {
		this.board_inputdate = board_inputdate;
	}

	public int getBoard_hits() {
		return board_hits;
	}

	public void setBoard_hits(int board_hits) {
		this.board_hits = board_hits;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	public ArrayList<RoomReply> getReplyList() {
		return replyList;
	}

	public void setReplyList(ArrayList<RoomReply> replyList) {
		this.replyList = replyList;
	}

	public ArrayList<Picture> getPicList() {
		return picList;
	}

	public void setPicList(ArrayList<Picture> picList) {
		this.picList = picList;
	}

	public Floorplan getFloorplan() {
		return floorplan;
	}

	public void setFloorplan(Floorplan floorplan) {
		this.floorplan = floorplan;
	}

	public Maintence getMaintence() {
		return maintence;
	}

	public void setMaintence(Maintence maintence) {
		this.maintence = maintence;
	}

	public Option getOption() {
		return option;
	}

	public void setOption(Option option) {
		this.option = option;
	}

	@Override
	public String toString() {
		return "Property [property_no=" + property_no + ", custid=" + custid + ", rent_type=" + rent_type + ", address="
				+ address + ", address_detail=" + address_detail + ", bulildingName=" + bulildingName + ", floor="
				+ floor + ", property_type=" + property_type + ", deposit=" + deposit + ", month_fee=" + month_fee
				+ ", maintence_fee=" + maintence_fee + ", built_year=" + built_year + ", roomSize=" + roomSize
				+ ", isAccessible=" + isAccessible + ", isSoldOut=" + isSoldOut + ", board_title=" + board_title
				+ ", board_text=" + board_text + ", board_inputdate=" + board_inputdate + ", board_hits=" + board_hits
				+ ", reply_count=" + reply_count + "]";
	}

}
