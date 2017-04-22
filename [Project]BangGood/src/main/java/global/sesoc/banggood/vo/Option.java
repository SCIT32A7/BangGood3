package global.sesoc.banggood.vo;

public class Option {

	private int property_no = 0;
	private int pet = 2;
	private int car = 2;
	private int elevator = 2;
	private int air_conditioner = 2;
	private int fridge = 2;
	private int washing_machine = 2;
	private int gas_stove = 2;
	private int electric_stove = 2;
	private int microwave = 2;
	private int desk = 2;
	private int rack = 2;
	private int bed = 2;
	private int closet = 2;
	private int shoecabinet = 2;
	private int doorlock = 2;
	private int wifi = 2;
	private int total;

	public Option(int property_no, int pet, int car, int elevator, int air_conditioner, int fridge, int washing_machine,
			int gas_stove, int electric_stove, int microwave, int desk, int rack, int bed, int closet, int shoecabinet,
			int doorlock, int wifi, int total) {
		super();
		this.property_no = property_no;
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
		this.total = total;
	}

	public Option() {
		super();
	}

	public int getProperty_no() {
		return property_no;
	}

	public void setProperty_no(int property_no) {
		this.property_no = property_no;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Option [property_no=" + property_no + ", pet=" + pet + ", car=" + car + ", elevator=" + elevator
				+ ", air_conditioner=" + air_conditioner + ", fridge=" + fridge + ", washing_machine=" + washing_machine
				+ ", gas_stove=" + gas_stove + ", electric_stove=" + electric_stove + ", microwave=" + microwave
				+ ", desk=" + desk + ", rack=" + rack + ", bed=" + bed + ", closet=" + closet + ", shoecabinet="
				+ shoecabinet + ", doorlock=" + doorlock + ", wifi=" + wifi + ", total=" + total + "]";
	}

}
