package com.cafe24.bitmall.vo;

public class AuthVo {
	private Long no;
	private Long userNo;

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

	@Override
	public String toString() {
		return "Auth [no=" + no + ", userNo=" + userNo + "]";
	}
}
