package global.sesoc.banggood.vo;

import java.util.ArrayList;

public class Customer {

	private String custid;
	private String name="바보";
	private String password;
	private String email;
	private String phone;
	private ArrayList<Cart> cartList;
	private ArrayList<Property> propertyList;
	private ArrayList<Message> msgList;

	public Customer(String custid, String name, String password, String email, String phone, ArrayList<Cart> cartList,
			ArrayList<Property> propertyList, ArrayList<Message> msgList) {
		super();
		this.custid = custid;
		this.name = name;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.cartList = cartList;
		this.propertyList = propertyList;
		this.msgList = msgList;
	}

	public Customer() {
		super();
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = "바보";
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public ArrayList<Cart> getCartList() {
		return cartList;
	}

	public void setCartList(ArrayList<Cart> cartList) {
		this.cartList = cartList;
	}

	public ArrayList<Property> getPropertyList() {
		return propertyList;
	}

	public void setPropertyList(ArrayList<Property> propertyList) {
		this.propertyList = propertyList;
	}

	public ArrayList<Message> getMsgList() {
		return msgList;
	}

	public void setMsgList(ArrayList<Message> msgList) {
		this.msgList = msgList;
	}

	@Override
	public String toString() {
		return "Customer [custid=" + custid + ", name=" + name + ", password=" + password + ", email=" + email
				+ ", phone=" + phone + ", cartList=" + cartList + ", propertyList=" + propertyList + ", msgList="
				+ msgList + "]";
	}

}
