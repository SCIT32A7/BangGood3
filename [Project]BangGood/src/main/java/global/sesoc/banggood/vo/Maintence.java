package global.sesoc.banggood.vo;

public class Maintence {

	private int property_no;
	private int internet;
	private int tvfee;
	private int cleaning;
	private int waterfee;
	private int gasfee;
	private int electronic;

	public Maintence(int property_no, int internet, int tvfee, int cleaning, int waterfee, int gasfee, int electronic) {
		super();
		this.property_no = property_no;
		this.internet = internet;
		this.tvfee = tvfee;
		this.cleaning = cleaning;
		this.waterfee = waterfee;
		this.gasfee = gasfee;
		this.electronic = electronic;
	}

	public Maintence() {
		super();
	}

	public int getProperty_no() {
		return property_no;
	}

	public void setProperty_no(int property_no) {
		this.property_no = property_no;
	}

	public int getInternet() {
		return internet;
	}

	public void setInternet(int internet) {
		this.internet = internet;
	}

	public int getTvfee() {
		return tvfee;
	}

	public void setTvfee(int tvfee) {
		this.tvfee = tvfee;
	}

	public int getCleaning() {
		return cleaning;
	}

	public void setCleaning(int cleaning) {
		this.cleaning = cleaning;
	}

	public int getWaterfee() {
		return waterfee;
	}

	public void setWaterfee(int waterfee) {
		this.waterfee = waterfee;
	}

	public int getGasfee() {
		return gasfee;
	}

	public void setGasfee(int gasfee) {
		this.gasfee = gasfee;
	}

	public int getElectronic() {
		return electronic;
	}

	public void setElectronic(int electronic) {
		this.electronic = electronic;
	}

	@Override
	public String toString() {
		return "Maintence [property_no=" + property_no + ", internet=" + internet + ", tvfee=" + tvfee + ", cleaning="
				+ cleaning + ", waterfee=" + waterfee + ", gasfee=" + gasfee + ", electronic=" + electronic + "]";
	}

}
