package global.sesoc.banggood.vo;

public class Canvas {
	private String icons;
	private String lines;
	
	public Canvas() {}

	public Canvas(String icons, String lines) {
		super();
		this.icons = icons;
		this.lines = lines;
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
		return "Canvas [icons=" + icons + ", lines=" + lines + "]";
	}
	
}
