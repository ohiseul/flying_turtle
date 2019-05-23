package kr.co.flyingturtle.repository.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Files{
   private List<MultipartFile> attach;
   private MultipartFile[] attach2;
   private int fileNo;
   private String oriName; 	
   private String sysName; 
   private String path;	//파일이 저장될 경로 
   private int size; 	
   private int fileGroupNo;
   private String CKEditorFuncNum;	//CKEditor가 이미지 첨부할때 보내는 데이터
   


public String getCKEditorFuncNum() {
	return CKEditorFuncNum;
}
   
   
public void setCKEditorFuncNum(String cKEditorFuncNum) {
	CKEditorFuncNum = cKEditorFuncNum;
}



public MultipartFile[] getAttach2() {
	return attach2;
}


public void setAttach2(MultipartFile[] attach2) {
	this.attach2 = attach2;
}


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
