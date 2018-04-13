package com.cafe24.bitmall.vo;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class UserVo {
	private Long no;
	
	@NotEmpty
	@Email
	private String email;
	
	@NotEmpty	
	private String password;
	
	@NotEmpty
	private String name;
	
	@NotEmpty
	@Pattern(regexp="[0-9]+")
	private String phone;
	
	@NotEmpty
	private String address;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [no=" + no + ", email=" + email + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", address=" + address + "]";
	}

}
