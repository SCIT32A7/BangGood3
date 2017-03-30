package global.sesoc.banggood.vo;

public class Message {

	private int msg_no;
	private String sender;
	private String receiver;
	private String msg_text;
	private String sentDate;
	private String readDate;
	private String isChecked;

	public Message(int msg_no, String sender, String receiver, String msg_text, String sentDate, String readDate,
			String isChecked) {
		super();
		this.msg_no = msg_no;
		this.sender = sender;
		this.receiver = receiver;
		this.msg_text = msg_text;
		this.sentDate = sentDate;
		this.readDate = readDate;
		this.isChecked = isChecked;
	}

	public Message(String sender, String receiver, String msg_text) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.msg_text = msg_text;
	}

	public Message() {
		super();
	}

	public int getMsg_no() {
		return msg_no;
	}

	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMsg_text() {
		return msg_text;
	}

	public void setMsg_text(String msg_text) {
		this.msg_text = msg_text;
	}

	public String getSentDate() {
		return sentDate;
	}

	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}

	public String getReadDate() {
		return readDate;
	}

	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}

	public String getIsChecked() {
		return isChecked;
	}

	public void setIsChecked(String isChecked) {
		this.isChecked = isChecked;
	}

	@Override
	public String toString() {
		return "Message [msg_no=" + msg_no + ", sender=" + sender + ", receiver=" + receiver + ", msg_text=" + msg_text
				+ ", sentDate=" + sentDate + ", readDate=" + readDate + ", isChecked=" + isChecked + "]";
	}

}
