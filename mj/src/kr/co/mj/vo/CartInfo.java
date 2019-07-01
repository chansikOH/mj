package kr.co.mj.vo;

public class CartInfo {

	private int proNo;            // 상품 번호 
	private String img;           // 상품 이미지
	private String proName;       // 상품 이름
	private int proPrice;         // 상품 가격
	private String saleYn;		  // 상품 할인여부 	
	private double discount; 	  // 상품 할인
	private String usedYn;        // 상품 판매여부 
	private int cartNo;           // 장바구니 번호 
	private int cartAmount;       // 장바구니 수량
	
	public CartInfo() {}

	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public String getSaleYn() {
		return saleYn;
	}

	public void setSaleYn(String saleYn) {
		this.saleYn = saleYn;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public String getUsedYn() {
		return usedYn;
	}

	public void setUsedYn(String usedYn) {
		this.usedYn = usedYn;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartAmount() {
		return cartAmount;
	}

	public void setCartAmount(int cartAmount) {
		this.cartAmount = cartAmount;
	}

	// 할인율 계산을 위한 getter메소드 
	public int getDiscountPrice() {
		if ("Y".equals(saleYn)) {
			return (int)(proPrice - discount);
		}
		return proPrice;
	}
}
