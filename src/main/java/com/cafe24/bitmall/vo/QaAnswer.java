package com.cafe24.bitmall.vo;

public class QaAnswer {
	private Long no;
	private Long qaNo;
	private String content;
	private String writeDate;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public Long getQaNo() {
		return qaNo;
	}

	public void setQaNo(Long qaNo) {
		this.qaNo = qaNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "QaAnswer [no=" + no + ", qaNo=" + qaNo + ", content=" + content + ", writeDate=" + writeDate + "]";
	}

}
