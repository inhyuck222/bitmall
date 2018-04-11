package com.cafe24.bitmall.vo;

public class ProductVo {
	private Long no;
	private Long categoryNo;
	private String name;
	private Long price;
	private String picturePath;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public Long getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(Long categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public String getPicturePath() {
		return picturePath;
	}

	public void setPicturePath(String picturePath) {
		this.picturePath = picturePath;
	}

	@Override
	public String toString() {
		return "Producnt [no=" + no + ", categoryNo=" + categoryNo + ", name=" + name + ", price=" + price
				+ ", picturePath=" + picturePath + "]";
	}

}
