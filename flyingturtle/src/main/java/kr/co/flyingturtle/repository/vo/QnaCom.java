package kr.co.flyingturtle.repository.vo;

import java.util.Date;

public class QnaCom {
    private int comNo; 
    private int qnaNo; 
    private String type; 
    private int memberNo; 
    private Date regDate; 
    private String comContent;
    private String id;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}

}
