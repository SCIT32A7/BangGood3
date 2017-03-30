package global.sesoc.banggood.vo;

public class Property_list {

	private int property_no;
	private String rent_type;
	private int board_no;
	private String custid;
	private String board_inputdate;
	private int board_hits;
	private int deposit;
	private int month_fee;
	private Floorplan floorplan;

	public Property_list(int property_no, String rent_type, int board_no, String custid, String board_inputdate,
			int board_hits, int deposit, int month_fee, Floorplan floorplan) {
		super();
		this.property_no = property_no;
		this.rent_type = rent_type;
		this.board_no = board_no;
		this.custid = custid;
		this.board_inputdate = board_inputdate;
		this.board_hits = board_hits;
		this.deposit = deposit;
		this.month_fee = month_fee;
		this.floorplan = floorplan;
	}

	public Property_list() {
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

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
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
		return "Property_list [property_no=" + property_no + ", rent_type=" + rent_type + ", board_no=" + board_no
				+ ", custid=" + custid + ", board_inputdate=" + board_inputdate + ", board_hits=" + board_hits
				+ ", deposit=" + deposit + ", month_fee=" + month_fee + ", floorplan=" + floorplan + "]";
	}

}
