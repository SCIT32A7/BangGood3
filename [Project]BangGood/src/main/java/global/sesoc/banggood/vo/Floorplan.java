package global.sesoc.banggood.vo;

public class Floorplan {

	private int pic_plan_no;
	private int property_no;
	private String pic_name;
	private String pic_savename;
	private String canvasfile;

	public Floorplan(int pic_plan_no, int property_no, String pic_name, String pic_savename, String canvasfile) {
		super();
		this.pic_plan_no = pic_plan_no;
		this.property_no = property_no;
		this.pic_name = pic_name;
		this.pic_savename = pic_savename;
		this.canvasfile = canvasfile;
	}

	public Floorplan() {
		super();
	}

	public int getPic_plan_no() {
		return pic_plan_no;
	}

	public void setPic_plan_no(int pic_plan_no) {
		this.pic_plan_no = pic_plan_no;
	}

	public int getProperty_no() {
		return property_no;
	}

	public void setProperty_no(int property_no) {
		this.property_no = property_no;
	}

	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}

	public String getPic_savename() {
		return pic_savename;
	}

	public void setPic_savename(String pic_savename) {
		this.pic_savename = pic_savename;
	}

	public String getCanvasfile() {
		return canvasfile;
	}

	public void setCanvasfile(String canvasfile) {
		this.canvasfile = canvasfile;
	}

	@Override
	public String toString() {
		return "Floorplan [pic_plan_no=" + pic_plan_no + ", property_no=" + property_no + ", pic_name=" + pic_name
				+ ", pic_savename=" + pic_savename + ", canvasfile=" + canvasfile + "]";
	}

}
