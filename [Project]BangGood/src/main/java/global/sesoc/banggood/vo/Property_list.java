package global.sesoc.banggood.vo;

public class Property_list {

	private int property_no;
	private int cart_no;
	private String property_title;
	private String rent_type;
	private String custid;
	private String property_inputdate;
	private int property_hits;
	private int reply_count;
	private int property_like;
	private int deposit;
	private int month_fee;
	private String isaccessible;
	private String pic_name;
	private String pic_savename;

	public Property_list() {
		super();
	}

	public int getProperty_no() {
		return property_no;
	}

	public void setProperty_no(int property_no) {
		this.property_no = property_no;
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public String getProperty_title() {
		return property_title;
	}

	public void setProperty_title(String property_title) {
		this.property_title = property_title;
	}

	public String getRent_type() {
		return rent_type;
	}

	public void setRent_type(String rent_type) {
		this.rent_type = rent_type;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
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

	public String getIsaccessible() {
		return isaccessible;
	}

	public void setIsaccessible(String isaccessible) {
		this.isaccessible = isaccessible;
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
		return "Property_list [property_no=" + property_no + ", cart_no=" + cart_no + ", property_title="
				+ property_title + ", rent_type=" + rent_type + ", custid=" + custid + ", property_inputdate="
				+ property_inputdate + ", property_hits=" + property_hits + ", reply_count=" + reply_count
				+ ", property_like=" + property_like + ", deposit=" + deposit + ", month_fee=" + month_fee
				+ ", isaccessible=" + isaccessible + ", pic_name=" + pic_name + ", pic_savename=" + pic_savename + "]";
	}

}
