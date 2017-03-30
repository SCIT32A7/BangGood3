package global.sesoc.banggood.vo;

public class Picture_reply {

	private int pic_reply_no;
	private int roomreply_no;
	private String pic_name;
	private String pic_savename;

	public Picture_reply(int pic_reply_no, int roomreply_no, String pic_name, String pic_savename) {
		super();
		this.pic_reply_no = pic_reply_no;
		this.roomreply_no = roomreply_no;
		this.pic_name = pic_name;
		this.pic_savename = pic_savename;
	}

	public Picture_reply() {
		super();
	}

	public int getPic_reply_no() {
		return pic_reply_no;
	}

	public void setPic_reply_no(int pic_reply_no) {
		this.pic_reply_no = pic_reply_no;
	}

	public int getRoomreply_no() {
		return roomreply_no;
	}

	public void setRoomreply_no(int roomreply_no) {
		this.roomreply_no = roomreply_no;
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

	@Override
	public String toString() {
		return "Picture_reply [pic_reply_no=" + pic_reply_no + ", roomreply_no=" + roomreply_no + ", pic_name="
				+ pic_name + ", pic_savename=" + pic_savename + "]";
	}

}
