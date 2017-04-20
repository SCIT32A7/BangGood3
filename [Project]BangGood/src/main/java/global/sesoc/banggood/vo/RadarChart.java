package global.sesoc.banggood.vo;

public class RadarChart {
	private String address;
	private String rent_type;
	private String property_type;
	private Double deposit;
	private Double month_fee;
	private Double maintence_fee;
	private Double roomsize;
	private Double total; //옵션 수
	
	public RadarChart() {
		// TODO Auto-generated constructor stub
	}

	public RadarChart(Double deposit, Double month_fee, Double maintence_fee, Double roomsize, Double total) {
		super();
		this.deposit = deposit;
		this.month_fee = month_fee;
		this.maintence_fee = maintence_fee;
		this.roomsize = roomsize;
		this.total = total;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRent_type() {
		return rent_type;
	}

	public void setRent_type(String rent_type) {
		this.rent_type = rent_type;
	}

	public String getProperty_type() {
		return property_type;
	}

	public void setProperty_type(String property_type) {
		this.property_type = property_type;
	}

	public Double getDeposit() {
		return deposit;
	}

	public void setDeposit(Double deposit) {
		this.deposit = deposit;
	}

	public Double getMonth_fee() {
		return month_fee;
	}

	public void setMonth_fee(Double month_fee) {
		this.month_fee = month_fee;
	}

	public Double getMaintence_fee() {
		return maintence_fee;
	}

	public void setMaintence_fee(Double maintence_fee) {
		this.maintence_fee = maintence_fee;
	}

	public Double getRoomsize() {
		return roomsize;
	}

	public void setRoomsize(Double roomsize) {
		this.roomsize = roomsize;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "RadarChart [address=" + address + ", rent_type=" + rent_type + ", property_type=" + property_type
				+ ", deposit=" + deposit + ", month_fee=" + month_fee + ", maintence_fee=" + maintence_fee
				+ ", roomsize=" + roomsize + ", total=" + total + "]";
	}
	
}
