package kr.co.flyingturtle.repository.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice extends Files{
	
	private int boardNo;
	private String title;
	private String content;
	private Date regDate;
	private int viewCnt;
	private int fileGroupNo;
	private String name;
	private int memberNo;
	private List<MultipartFile> attach;
	private String prevTitle;
	private String nextTitle;
	private String prevNo;
	private String nextNo;
	
	public String getPrevTitle() {
		return prevTitle;
	}

	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}

	public String getNextTitle() {
		return nextTitle;
	}

	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}

	public String getPrevNo() {
		return prevNo;
	}

	public void setPrevNo(String prevNo) {
		this.prevNo = prevNo;
	}

	public String getNextNo() {
		return nextNo;
	}

	public void setNextNo(String nextNo) {
		this.nextNo = nextNo;
	}

	public List<MultipartFile> getAttach() {
		return attach;
	}

	public void setAttach(List<MultipartFile> attach) {
		this.attach = attach;
	}

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
