package com.cafe24.bitmall.dto;

public class OrderProductInfoDto {
	private Long orderProductNo;
	private Long orderNo;
	private Long quantity;
	private Long amount;
	private String size;
	private Long productNo;
	private String picturePath;
	private String productName;
	private Long categoryNo;
	private Long price;

	public Long getProductNo() {
		return productNo;
	}

	public void setProductNo(Long productNo) {
		this.productNo = productNo;
	}

	public Long getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Long categoryNo) {
		this.categoryNo = categoryNo;
	}

	public Long getOrderProductNo() {
		return orderProductNo;
	}

	public void setOrderProductNo(Long orderProductNo) {
		this.orderProductNo = orderProductNo;
	}

	public Long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}

	public String getPicturePath() {
		return picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Long getQuantity() {
		return quantity;
	}

	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "OrderProductInfoDto [orderProductNo=" + orderProductNo + ", orderNo=" + orderNo + ", quantity="
				+ quantity + ", amount=" + amount + ", size=" + size + ", productNo=" + productNo + ", picturePath="
				+ picturePath + ", productName=" + productName + ", categoryNo=" + categoryNo + ", price=" + price
				+ "]";
	}

}
