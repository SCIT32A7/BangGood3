package global.sesoc.banggood.vo;

public class Property_map {

	private int property_no;
	private String rent_type;
	private int deposit;
	private int month_fee;
	private String property_title;
	private String pic_name;
	private String pic_savename;

	public Property_map(int property_no, String rent_type, int deposit, int month_fee, String property_title,
			String pic_name, String pic_savename) {
		super();
		this.property_no = property_no;
		this.rent_type = rent_type;
		this.deposit = deposit;
		this.month_fee = month_fee;
		this.property_title = property_title;
		this.pic_name = pic_name;
		this.pic_savename = pic_savename;
	}

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

	public String getProperty_title() {
		return property_title;
	}

	public void setProperty_title(String property_title) {
		this.property_title = property_title;
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
				+ ", month_fee=" + month_fee + ", property_title=" + property_title + ", pic_name=" + pic_name
				+ ", pic_savename=" + pic_savename + "]";
	}

}
