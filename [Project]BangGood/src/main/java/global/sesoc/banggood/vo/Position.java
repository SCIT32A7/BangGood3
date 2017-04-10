package global.sesoc.banggood.vo;

public class Position {

	
	private String position;
	private String position_address;
	private String earchtext;
	public Position() {
		super();
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPosition_address() {
		return position_address;
	}
	public void setPosition_address(String position_address) {
		this.position_address = position_address;
	}
	public String getEarchtext() {
		return earchtext;
	}
	public void setEarchtext(String earchtext) {
		this.earchtext = earchtext;
	}
	@Override
	public String toString() {
		return "Position [position=" + position + ", position_address=" + position_address + ", earchtext=" + earchtext
				+ "]";
	}
	
	

}
