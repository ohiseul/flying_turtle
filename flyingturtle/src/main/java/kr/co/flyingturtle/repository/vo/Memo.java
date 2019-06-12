package kr.co.flyingturtle.repository.vo;

import java.util.Date;

public class Memo {
	private int memoNo;
	private String content;
	private char save;
	private int sbjNo;
	private Date regDate;
	private Date update;
	private int memberNo;
	
	private String subjectName;
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getMemoNo() {
		return memoNo;
	}
	public void setMemoNo(int memoNo) {
		this.memoNo = memoNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public char getSave() {
		return save;
	}
	public void setSave(char save) {
		this.save = save;
	}
	public int getSbjNo() {
		return sbjNo;
	}
	public void setSbjNo(int sbjNo) {
		this.sbjNo = sbjNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdate() {
		return update;
	}
	public void setUpdate(Date update) {
		this.update = update;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
}
