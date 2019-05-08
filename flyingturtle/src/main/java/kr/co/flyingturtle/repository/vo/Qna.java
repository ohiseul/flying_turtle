package kr.co.flyingturtle.repository.vo;

import java.util.Date;

public class Qna {
  private int qna_no; 
  private int code_no; 
  private int member_no; 
  private Date reg_date;
    private String title; 
    private int view_cnt; 
    private String  type; 
    private String  content; 
    private int file_group_no;
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getCode_no() {
		return code_no;
	}
	public void setCode_no(int code_no) {
		this.code_no = code_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getFile_group_no() {
		return file_group_no;
	}
	public void setFile_group_no(int file_group_no) {
		this.file_group_no = file_group_no;
	}   
}
