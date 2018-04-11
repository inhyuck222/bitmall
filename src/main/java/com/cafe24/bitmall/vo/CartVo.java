package com.cafe24.bitmall.vo;

public class CartVo {
	private Long productNo;
	private Long userNo;
	private Long quantity;
	private Long amount;

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
		return "Cart [productNo=" + productNo + ", userNo=" + userNo + ", quantity=" + quantity + ", amount=" + amount
				+ "]";
	}

}
