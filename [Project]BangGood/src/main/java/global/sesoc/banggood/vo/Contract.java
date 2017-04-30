package global.sesoc.banggood.vo;

public class Contract {

	private String address;
	private String property_type;
	private String roomsize;
	private String deposit;
	private String maintence_fee;
	private String con_date;
	private String contractPrice;
	private String extra_condi;
	private String seller_name;
	private String seller_jumin;
	private String seller_phone;
	private String buyer_name;
	private String buyer_jumin;
	private String buyer_phone;

	public Contract(String address, String property_type, String roomsize, String deposit, String maintence_fee,
			String con_date, String contractPrice, String extra_condi, String seller_name, String seller_jumin,
			String seller_phone, String buyer_name, String buyer_jumin, String buyer_phone) {
		super();
		this.address = address;
		this.property_type = property_type;
		this.roomsize = roomsize;
		this.deposit = deposit;
		this.maintence_fee = maintence_fee;
		this.con_date = con_date;
		this.contractPrice = contractPrice;
		this.extra_condi = extra_condi;
		this.seller_name = seller_name;
		this.seller_jumin = seller_jumin;
		this.seller_phone = seller_phone;
		this.buyer_name = buyer_name;
		this.buyer_jumin = buyer_jumin;
		this.buyer_phone = buyer_phone;
	}

	public Contract() {
		super();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProperty_type() {
		return property_type;
	}

	public void setProperty_type(String property_type) {
		this.property_type = property_type;
	}

	public String getRoomsize() {
		return roomsize;
	}

	public void setRoomsize(String roomsize) {
		this.roomsize = roomsize;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public String getMaintence_fee() {
		return maintence_fee;
	}

	public void setMaintence_fee(String maintence_fee) {
		this.maintence_fee = maintence_fee;
	}

	public String getCon_date() {
		return con_date;
	}

	public void setCon_date(String con_date) {
		this.con_date = con_date;
	}

	public String getContractPrice() {
		return contractPrice;
	}

	public void setContractPrice(String contractPrice) {
		this.contractPrice = contractPrice;
	}

	public String getExtra_condi() {
		return extra_condi;
	}

	public void setExtra_condi(String extra_condi) {
		this.extra_condi = extra_condi;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public String getSeller_jumin() {
		return seller_jumin;
	}

	public void setSeller_jumin(String seller_jumin) {
		this.seller_jumin = seller_jumin;
	}

	public String getSeller_phone() {
		return seller_phone;
	}

	public void setSeller_phone(String seller_phone) {
		this.seller_phone = seller_phone;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getBuyer_jumin() {
		return buyer_jumin;
	}

	public void setBuyer_jumin(String buyer_jumin) {
		this.buyer_jumin = buyer_jumin;
	}

	public String getBuyer_phone() {
		return buyer_phone;
	}

	public void setBuyer_phone(String buyer_phone) {
		this.buyer_phone = buyer_phone;
	}

	@Override
	public String toString() {
		return "Contract [address=" + address + ", property_type=" + property_type + ", roomsize=" + roomsize
				+ ", deposit=" + deposit + ", maintence_fee=" + maintence_fee + ", con_date=" + con_date
				+ ", contractPrice=" + contractPrice + ", extra_condi=" + extra_condi + ", seller_name=" + seller_name
				+ ", seller_jumin=" + seller_jumin + ", seller_phone=" + seller_phone + ", buyer_name=" + buyer_name
				+ ", buyer_jumin=" + buyer_jumin + ", buyer_phone=" + buyer_phone + "]";
	}

}
