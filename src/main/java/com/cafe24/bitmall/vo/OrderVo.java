package com.cafe24.bitmall.vo;

public class OrderVo {
	private Long no;
	private Long userNo;
	private String code;
	private Long amount;
	private String address;
	private String orderDate;
	private String payment;
	private String status;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public Long getUserNo() {
		return userNo;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getAmount() {
		return amount;
	}

	public void setAmount(Long amount) {
		this.amount = amount;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Order [no=" + no + ", userNo=" + userNo + ", code=" + code + ", amount=" + amount + ", address="
				+ address + ", orderDate=" + orderDate + ", payment=" + payment + ", status=" + status + "]";
	}

}
