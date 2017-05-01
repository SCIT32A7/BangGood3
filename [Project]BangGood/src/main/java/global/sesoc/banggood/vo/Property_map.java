package global.sesoc.banggood.vo;

public class Property_map {

	private int property_no;
	private String rent_type;
	private int deposit;
	private int month_fee;
	private int maintence_fee;
	private int built_year;
	private Double roomsize;
	private int floor;
	private String property_title;
	private int property_hits;
	private int reply_count;
	private int property_like;
	private String pic_name;
	private String pic_savename;
	public Property_map() {
		super();
	}
	public int getProperty_no() {
		return property_no;
	}
	public void setProperty_no(int property_no) {
		this.property_no = property_no;
	}
	public String getRent_type() {
		return rent_type;
	}
	public void setRent_type(String rent_type) {
		this.rent_type = rent_type;
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
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public String getProperty_title() {
		return property_title;
	}
	public void setProperty_title(String property_title) {
		this.property_title = property_title;
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
		return "Property_map [property_no=" + property_no + ", rent_type=" + rent_type + ", deposit=" + deposit
				+ ", month_fee=" + month_fee + ", maintence_fee=" + maintence_fee + ", built_year=" + built_year
				+ ", roomsize=" + roomsize + ", floor=" + floor + ", property_title=" + property_title
				+ ", property_hits=" + property_hits + ", reply_count=" + reply_count + ", property_like="
				+ property_like + ", pic_name=" + pic_name + ", pic_savename=" + pic_savename + "]";
	}

	
}
