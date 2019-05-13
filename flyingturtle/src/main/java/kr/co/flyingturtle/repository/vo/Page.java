package kr.co.flyingturtle.repository.vo;

public class Page {
	//pageNo = 요청페이지
	private int pageNo = 1;
	private int listSize = 15;
	private String keyword;
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getListSize() {
		return listSize;
	}

	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	//요청페이지를 1로 설정해줬기 때문에 -1을 해준다.
	//1페이지의 보여지는 개수를 변경하고 싶다면 Begin과 End를 변경해준다.
	public int getBegin() {
		return (this.pageNo -1) * listSize;
	}
	 
	public int getEnd() {
		return this.pageNo * listSize;
	}
}
