package global.sesoc.banggood.vo;

public class Canvas {
	private int datanum;
	private int property_no;
	private String custid;
	private String saved_name;
	private String icons;
	private String lines;
	private String objects;
	
	public Canvas() {}

	public Canvas(int datanum, int property_no, String custid, String saved_name, String icons, String lines,
			String objects) {
		super();
		this.datanum = datanum;
		this.property_no = property_no;
		this.custid = custid;
		this.saved_name = saved_name;
		this.icons = icons;
		this.lines = lines;
		this.objects = objects;
	}

	public int getDatanum() {
		return datanum;
	}

	public void setDatanum(int datanum) {
		this.datanum = datanum;
	}

	public int getProperty_no() {
		return property_no;
	}

	public void setProperty_no(int property_no) {
		this.property_no = property_no;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getSaved_name() {
		return saved_name;
	}

	public void setSaved_name(String saved_name) {
		this.saved_name = saved_name;
	}

	public String getIcons() {
		return icons;
	}

	public void setIcons(String icons) {
		this.icons = icons;
	}

	public String getLines() {
		return lines;
	}

	public void setLines(String lines) {
		this.lines = lines;
	}

	public String getObjects() {
		return objects;
	}

	public void setObjects(String objects) {
		this.objects = objects;
	}

	@Override
	public String toString() {
		return "Canvas [datanum=" + datanum + ", property_no=" + property_no + ", custid=" + custid + ", saved_name="
				+ saved_name + ", icons=" + icons + ", lines=" + lines + ", objects=" + objects + "]";
	}

}
