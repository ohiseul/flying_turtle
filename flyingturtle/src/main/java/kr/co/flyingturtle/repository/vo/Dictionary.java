package kr.co.flyingturtle.repository.vo;

public class Dictionary {
	private int dicNo;			// 용어 번호
	private String content;
	private int sbjNo;			// 과목번호
	
	public int getDicNo() {
		return dicNo;
	}
	public void setDicNo(int dicNo) {
		this.dicNo = dicNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getSbjNo() {
		return sbjNo;
	}
	public void setSbjNo(int sbjNo) {
		this.sbjNo = sbjNo;
	}
	
	
}
