package kr.co.flyingturtle.repository.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Canvas extends Page {
	private int canNo; 
	private int ssbjNo; 
	private String ssbjName;
	private String sysName; 
	private String oriName; 
	private String path; 
	private int size; 
	private Date regDate;
	private int sbjNo;		
	private String sbjName;	 
	private String title;
	
	public int getCanNo() {
		return canNo;
	}
	public void setCanNo(int canNo) {
		this.canNo = canNo;
	}
	public int getSsbjNo() {
		return ssbjNo;
	}
	public void setSsbjNo(int ssbjNo) {
		this.ssbjNo = ssbjNo;
	}
	public String getSsbjName() {
		return ssbjName;
	}
	public void setSsbjName(String ssbjName) {
		this.ssbjName = ssbjName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getSbjNo() {
		return sbjNo;
	}
	public void setSbjNo(int sbjNo) {
		this.sbjNo = sbjNo;
	}
	public String getSbjName() {
		return sbjName;
	}
	public void setSbjName(String sbjName) {
		this.sbjName = sbjName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
}
