package kr.co.flyingturtle.repository.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class File{
   private List<MultipartFile> attach;
   private int fileNo;
   private String oriName; 
   private String sysName; 
   private String path; 
   private int size; 
   private int fileGroupNo;

   public List<MultipartFile> getAttach() {
	   return attach;
   }
   public void setAttach(List<MultipartFile> attach) {
	   this.attach = attach;
   }
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
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
	public int getFileGroupNo() {
		return fileGroupNo;
	}
	public void setFileGroupNo(int fileGroupNo) {
		this.fileGroupNo = fileGroupNo;
	} 
}
