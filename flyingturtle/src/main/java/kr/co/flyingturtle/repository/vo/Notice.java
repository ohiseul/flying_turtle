package kr.co.flyingturtle.repository.vo;

import java.util.Date;

public class Notice {
	
	private int boardNo;
	private String title;
	private String content;
	private Date regDate;
	private int viewCnt;
	private int fileGroupNo;
	
	private String name;
	
	private int memberNo;
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
  public int getFileGroupNo() {
        return fileGroupNo;
    }

    public void setFileGroupNo(int fileGroupNo) {
        this.fileGroupNo = fileGroupNo;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
