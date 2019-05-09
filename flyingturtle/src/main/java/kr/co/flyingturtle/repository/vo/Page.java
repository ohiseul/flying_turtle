package kr.co.flyingturtle.repository.vo;

public class Page {
	//pageNo = 요청페이지
	private int pageNo = 1;
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	//요청페이지를 1로 설정해줬기 때문에 -1을 해준다.
	//1페이지의 보여지는 개수를 변경하고 싶다면 Begin과 End를 변경해준다.
	public int getBegin() {
		return (this.pageNo -1) * 15 + 1;
	}
	 
	public int getEnd() {
		return this.pageNo * 15;
	}
}
