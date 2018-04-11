package com.cafe24.bitmall.vo;

public class QaVo {
	private Long no;
	private Long userNo;
	private String title;
	private String content;
	private String writeDate;

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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
		return "QA [no=" + no + ", userNo=" + userNo + ", title=" + title + ", content=" + content + ", writeDate="
				+ writeDate + "]";
	}

}
