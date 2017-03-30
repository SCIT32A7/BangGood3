package global.sesoc.banggood.vo;

public class Property_map {

	private int property_no;
	private String rent_type;
	private int deposit;
	private int month_fee;
	private Floorplan floorplan;

	public Property_map(int property_no, String rent_type, int deposit, int month_fee, Floorplan floorplan) {
		super();
		this.property_no = property_no;
		this.rent_type = rent_type;
		this.deposit = deposit;
		this.month_fee = month_fee;
		this.floorplan = floorplan;
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

	public Floorplan getFloorplan() {
		return floorplan;
	}

	public void setFloorplan(Floorplan floorplan) {
		this.floorplan = floorplan;
	}

	@Override
	public String toString() {
		return "Property_map [property_no=" + property_no + ", rent_type=" + rent_type + ", deposit=" + deposit
				+ ", month_fee=" + month_fee + ", floorplan=" + floorplan + "]";
	}

}
