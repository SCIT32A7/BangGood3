package global.sesoc.banggood.vo;

import org.springframework.web.multipart.MultipartFile;

public class Picture {

	private int pic_room_no;
	private String pic_name;
	private String pic_savename;
	private String pic_division;
	private int property_no;
	private MultipartFile file;

	public Picture() {
		super();
	}
	

	public int getPic_room_no() {
		return pic_room_no;
	}



	public void setPic_room_no(int pic_room_no) {
		this.pic_room_no = pic_room_no;
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

	public String getPic_division() {
		return pic_division;
	}

	public void setPic_division(String pic_division) {
		this.pic_division = pic_division;
	}

	public int getProperty_no() {
		return property_no;
	}

	public void setProperty_no(int property_no) {
		this.property_no = property_no;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "Picture [pic_no=" + pic_room_no + ", pic_name=" + pic_name + ", pic_savename=" + pic_savename
				+ ", pic_division=" + pic_division + ", property_no=" + property_no + ", file=" + file + "]";
	}

}
