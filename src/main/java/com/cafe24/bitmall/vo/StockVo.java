package com.cafe24.bitmall.vo;

public class StockVo {
	private Long no;
	private Long productNo;
	private String size;
	private Long quantity;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public Long getProductNo() {
		return productNo;
	}

	public void setProductNo(Long productNo) {
		this.productNo = productNo;
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

	@Override
	public String toString() {
		return "Stock [no=" + no + ", productNo=" + productNo + ", size=" + size + ", quantity=" + quantity + "]";
	}

}
