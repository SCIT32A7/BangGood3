package global.sesoc.banggood.vo;

public class Cart {

	private int cart_no;
	private String custid;
	private String cartInputdate;
	private int property_no;

	public Cart(int cart_no, String custid, String cartInputdate, int property_no) {
		super();
		this.cart_no = cart_no;
		this.custid = custid;
		this.cartInputdate = cartInputdate;
		this.property_no = property_no;
	}

	public Cart(String custid, int property_no) {
		super();
		this.custid = custid;
		this.property_no = property_no;
	}

	public Cart() {
		super();
	}

	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getCartInputdate() {
		return cartInputdate;
	}

	public void setCartInputdate(String cartInputdate) {
		this.cartInputdate = cartInputdate;
	}

	public int getProperty_no() {
		return property_no;
	}

	public void setProperty_no(int property_no) {
		this.property_no = property_no;
	}

	@Override
	public String toString() {
		return "Cart [cart_no=" + cart_no + ", custid=" + custid + ", cartInputdate=" + cartInputdate + ", property_no="
				+ property_no + "]";
	}

}
