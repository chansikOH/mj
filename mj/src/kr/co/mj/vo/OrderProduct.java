package kr.co.mj.vo;

public class OrderProduct {

	private int orderNo;
	private int proNo;
	private int cartNo; 
	public String isWritable;
	
	public OrderProduct() {}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	
	public String getIsWritable() {
		return isWritable;
	}

	public void setIsWritable(String isWritable) {
		this.isWritable = isWritable;
	}
}
