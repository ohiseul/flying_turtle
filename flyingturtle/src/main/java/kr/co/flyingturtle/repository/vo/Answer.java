package kr.co.flyingturtle.repository.vo;

import java.util.Date;

public class Answer {
	private int aswNo;
	private int qnaNo;
	private String title;
	private String content; 
	private int memberNo; 
	private Date regDate;
	private String type;
	
	public int getAswNo() {
		return aswNo;
	}
	public void setAswNo(int aswNo) {
		this.aswNo = aswNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
