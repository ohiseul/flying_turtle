package kr.co.flyingturtle.repository.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Canvas {
	private int can_no; 
	private int ssbj_no; 
	private int save_no; 
	private String sys_name; 
	private String ori_name; 
	private String path; 
	private int size; 
	private Date reg_date;
	private List<MultipartFile> attach;
    
	
	public List<MultipartFile> getAttach() {
		return attach;
	}
	public void setAttach(List<MultipartFile> attach) {
		this.attach = attach;
	}
	public int getCan_no() {
		return can_no;
	}
	public void setCan_no(int can_no) {
		this.can_no = can_no;
	}
	public int getSsbj_no() {
		return ssbj_no;
	}
	public void setSsbj_no(int ssbj_no) {
		this.ssbj_no = ssbj_no;
	}
	public int getSave_no() {
		return save_no;
	}
	public void setSave_no(int save_no) {
		this.save_no = save_no;
	}
	public String getSys_name() {
		return sys_name;
	}
	public void setSys_name(String sys_name) {
		this.sys_name = sys_name;
	}
	public String getOri_name() {
		return ori_name;
	}
	public void setOri_name(String ori_name) {
		this.ori_name = ori_name;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
