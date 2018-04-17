package com.cafe24.bitmall.vo;

public class OrderVo {
	private Long no;
	private Long userNo;
	private String code;
	private Long amount;
	private String recipientAddress;
	private String orderDate;
	private String payment;
	private String requirements;
	private String status;
	private String recipientName;
	private String recipientPhone;
		
	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

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

	public String getRecipientAddress() {
		return recipientAddress;
	}

	public void setRecipientAddress(String address) {
		this.recipientAddress = address;
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
		return "OrderVo [no=" + no + ", userNo=" + userNo + ", code=" + code + ", amount=" + amount + ", recipientAddress="
				+ recipientAddress + ", orderDate=" + orderDate + ", payment=" + payment + ", requirements=" + requirements
				+ ", status=" + status + ", recipientName=" + recipientName + ", recipientPhone=" + recipientPhone
				+ "]";
	}
	
}
