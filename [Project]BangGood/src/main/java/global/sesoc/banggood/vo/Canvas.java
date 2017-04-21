package global.sesoc.banggood.vo;

public class Canvas {
	private int datanum;
	private int property_no;
	private String icons;
	private String lines;
	
	public Canvas() {}

	public Canvas(int datanum, int property_no, String icons, String lines) {
		super();
		this.datanum = datanum;
		this.property_no = property_no;
		this.icons = icons;
		this.lines = lines;
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

	@Override
	public String toString() {
		return "Canvas [datanum=" + datanum + ", property_no=" + property_no + ", icons=" + icons + ", lines=" + lines
				+ "]";
	}

	
	
}
