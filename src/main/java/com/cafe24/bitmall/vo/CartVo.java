package com.cafe24.bitmall.vo;

public class CartVo {
	private Long no;
	private Long productNo;
	private Long userNo;
	private Long quantity;
	private Long amount;
	private String size;
	
	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Long getProductNo() {
		return productNo;
	}

	public void setProductNo(Long productNo) {
		this.productNo = productNo;
	}

	public Long getUserNo() {
		return userNo;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "CartVo [no=" + no + ", productNo=" + productNo + ", userNo=" + userNo + ", quantity=" + quantity
				+ ", amount=" + amount + ", size=" + size + "]";
	}
	
}
