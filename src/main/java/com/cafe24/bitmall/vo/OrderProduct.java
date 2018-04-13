package com.cafe24.bitmall.vo;

public class OrderProduct {
	private Long no;	
	private Long orderNo;
	private Long productNo;
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

	public Long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}

	public Long getProductNo() {
		return productNo;
	}

	public void setProductNo(Long productNo) {
		this.productNo = productNo;
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
		return "OrderProduct [no=" + no + ", orderNo=" + orderNo + ", productNo=" + productNo + ", quantity=" + quantity
				+ ", amount=" + amount + ", size=" + size + "]";
	}
		
}
