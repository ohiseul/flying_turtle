package kr.co.flyingturtle.repository.vo;

import java.util.Date;

public class Todo {
	private int todoNo;
	private int pjNo;
	private String content;
	private Date endDay;
	private int deadline;
	private int CodeNo;
	private String title;
	private int memberNo;

	public int getTodoNo() {
		return todoNo;
	}
	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}
	public int getPjNo() {
		return pjNo;
	}
	public void setPjNo(int pjNo) {
		this.pjNo = pjNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDeadline() {
		return deadline;
	}
	public void setDeadline(int deadline) {
		this.deadline = deadline;
	}
	public int getCodeNo() {
		return CodeNo;
	}
	public void setCodeNo(int codeNo) {
		CodeNo = codeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Date getEndDay() {
		return endDay;
	}
	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}
	
}
