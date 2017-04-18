package global.sesoc.banggood.vo;

public class Property_search {

	private String searchaddress;
	private String property_type;
	private String rent_type;
	private int deposit1;
	private int deposit2;
	private int month_fee1;
	private int month_fee2;
	private int floor;
	private String maintence_fee;
	private String newbuild;
	private int pet;
	private int car;
	private int elevator;
	private int air_conditioner;
	private int fridge;
	private int washing_machine;
	private int gas_stove;
	private int electric_stove;
	private int microwave;
	private int desk;
	private int rack;
	private int bed;
	private int closet;
	private int shoecabinet;
	private int doorlock;
	private int wifi;

	public Property_search(String searchaddress, String property_type, String rent_type, int deposit1, int deposit2,
			int month_fee1, int month_fee2, int floor, String maintence_fee, String newbuild, int pet, int car,
			int elevator, int air_conditioner, int fridge, int washing_machine, int gas_stove, int electric_stove,
			int microwave, int desk, int rack, int bed, int closet, int shoecabinet, int doorlock, int wifi) {
		super();
		this.searchaddress = searchaddress;
		this.property_type = property_type;
		this.rent_type = rent_type;
		this.deposit1 = deposit1;
		this.deposit2 = deposit2;
		this.month_fee1 = month_fee1;
		this.month_fee2 = month_fee2;
		this.floor = floor;
		this.maintence_fee = maintence_fee;
		this.newbuild = newbuild;
		this.pet = pet;
		this.car = car;
		this.elevator = elevator;
		this.air_conditioner = air_conditioner;
		this.fridge = fridge;
		this.washing_machine = washing_machine;
		this.gas_stove = gas_stove;
		this.electric_stove = electric_stove;
		this.microwave = microwave;
		this.desk = desk;
		this.rack = rack;
		this.bed = bed;
		this.closet = closet;
		this.shoecabinet = shoecabinet;
		this.doorlock = doorlock;
		this.wifi = wifi;
	}

	public Property_search() {
		super();
	}

	public String getSearchaddress() {
		return searchaddress;
	}

	public void setSearchaddress(String searchaddress) {
		this.searchaddress = searchaddress;
	}

	public String getProperty_type() {
		return property_type;
	}

	public void setProperty_type(String property_type) {
		this.property_type = property_type;
	}

	public String getRent_type() {
		return rent_type;
	}

	public void setRent_type(String rent_type) {
		this.rent_type = rent_type;
	}

	public int getDeposit1() {
		return deposit1;
	}

	public void setDeposit1(int deposit1) {
		this.deposit1 = deposit1;
	}

	public int getDeposit2() {
		return deposit2;
	}

	public void setDeposit2(int deposit2) {
		this.deposit2 = deposit2;
	}

	public int getMonth_fee1() {
		return month_fee1;
	}

	public void setMonth_fee1(int month_fee1) {
		this.month_fee1 = month_fee1;
	}

	public int getMonth_fee2() {
		return month_fee2;
	}

	public void setMonth_fee2(int month_fee2) {
		this.month_fee2 = month_fee2;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getMaintence_fee() {
		return maintence_fee;
	}

	public void setMaintence_fee(String maintence_fee) {
		this.maintence_fee = maintence_fee;
	}

	public String getNewbuild() {
		return newbuild;
	}

	public void setNewbuild(String newbuild) {
		this.newbuild = newbuild;
	}

	public int getPet() {
		return pet;
	}

	public void setPet(int pet) {
		this.pet = pet;
	}

	public int getCar() {
		return car;
	}

	public void setCar(int car) {
		this.car = car;
	}

	public int getElevator() {
		return elevator;
	}

	public void setElevator(int elevator) {
		this.elevator = elevator;
	}

	public int getAir_conditioner() {
		return air_conditioner;
	}

	public void setAir_conditioner(int air_conditioner) {
		this.air_conditioner = air_conditioner;
	}

	public int getFridge() {
		return fridge;
	}

	public void setFridge(int fridge) {
		this.fridge = fridge;
	}

	public int getWashing_machine() {
		return washing_machine;
	}

	public void setWashing_machine(int washing_machine) {
		this.washing_machine = washing_machine;
	}

	public int getGas_stove() {
		return gas_stove;
	}

	public void setGas_stove(int gas_stove) {
		this.gas_stove = gas_stove;
	}

	public int getElectric_stove() {
		return electric_stove;
	}

	public void setElectric_stove(int electric_stove) {
		this.electric_stove = electric_stove;
	}

	public int getMicrowave() {
		return microwave;
	}

	public void setMicrowave(int microwave) {
		this.microwave = microwave;
	}

	public int getDesk() {
		return desk;
	}

	public void setDesk(int desk) {
		this.desk = desk;
	}

	public int getRack() {
		return rack;
	}

	public void setRack(int rack) {
		this.rack = rack;
	}

	public int getBed() {
		return bed;
	}

	public void setBed(int bed) {
		this.bed = bed;
	}

	public int getCloset() {
		return closet;
	}

	public void setCloset(int closet) {
		this.closet = closet;
	}

	public int getShoecabinet() {
		return shoecabinet;
	}

	public void setShoecabinet(int shoecabinet) {
		this.shoecabinet = shoecabinet;
	}

	public int getDoorlock() {
		return doorlock;
	}

	public void setDoorlock(int doorlock) {
		this.doorlock = doorlock;
	}

	public int getWifi() {
		return wifi;
	}

	public void setWifi(int wifi) {
		this.wifi = wifi;
	}

	@Override
	public String toString() {
		return "Property_search [searchaddress=" + searchaddress + ", property_type=" + property_type + ", rent_type="
				+ rent_type + ", deposit1=" + deposit1 + ", deposit2=" + deposit2 + ", month_fee1=" + month_fee1
				+ ", month_fee2=" + month_fee2 + ", floor=" + floor + ", maintence_fee=" + maintence_fee + ", newbuild="
				+ newbuild + ", pet=" + pet + ", car=" + car + ", elevator=" + elevator + ", air_conditioner="
				+ air_conditioner + ", fridge=" + fridge + ", washing_machine=" + washing_machine + ", gas_stove="
				+ gas_stove + ", electric_stove=" + electric_stove + ", microwave=" + microwave + ", desk=" + desk
				+ ", rack=" + rack + ", bed=" + bed + ", closet=" + closet + ", shoecabinet=" + shoecabinet
				+ ", doorlock=" + doorlock + ", wifi=" + wifi + "]";
	}

}
