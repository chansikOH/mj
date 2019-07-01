package kr.co.mj.vo;

public class Delivery {

	private int delNo; 
	private String address;
	private String receiver;
	private String phoneNumber;
	private String message;
	private String custId;
	
	public Delivery() {}

	public int getNo() {
		return delNo;
	}

	public void setNo(int no) {
		delNo = no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}
	
	
}
