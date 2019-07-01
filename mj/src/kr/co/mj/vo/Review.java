package kr.co.mj.vo;

import java.util.Date;

public class Review {

	private int no;
	private String content;
	private String title;
	private int likes;
	private int view;
	private String img;
	private Date createDate;
	private int proNo;
	private String custId;
	private Customers customer;
	private String proName;
	private String usedYn;
	private int orderNo;
	
	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public void setCustomer(Customers customer) {
		this.customer = customer;
	}

	public Review() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public Customers getCustomer() {
		return customer;
	}

	public void setCustomers(Customers customer) {
		this.customer = customer;
	}

	public String getUsedYn() {
		return usedYn;
	}

	public void setUsedYn(String usedYn) {
		this.usedYn = usedYn;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	
	
	
}
