package kr.co.flyingturtle.repository.vo;

import java.util.Date;

public class Memo {
	private int memoNo;
	private String content;
	private char save;
	private Date regDate;
	private Date editDate;
	private int sbjNo;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Date getEditDate() {
		return editDate;
	}
	public void setEditDate(Date editDate) {
		this.editDate = editDate;
	}
	
	
}
