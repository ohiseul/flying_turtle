package kr.co.flyingturtle.repository.vo;

public class PageResult {
	private int pageNo;		
	private int count;		//실제 게시물 수
	private int beginPage;	//현재페이지 기준 시작 페이지 번호
	private int endPage;	//현재페이지 기준 끝 페이지 번호
	private boolean prev;	//이전버튼 활성화 여부
	private boolean next;	//다음버튼 활성화 여부
	
	public PageResult(int pageNo, int count) {
		this.pageNo = pageNo;
		this.count = count;
		//메서드 호출
		setPageInfo();
	}
	
	public void setPageInfo() {
		//실제 마지막 페이지
		int lastPage = (count % 10)==0 ? (count % 10) : (count % 10) +1;
		
		//한번에 보여줄 페이지 개수
		int tabSize = 10;
		//currTab - 요청 페이지 번호가 포함된 페이지 블럭 번호( 1Tab ->1~10, 2Tab ->11~20 )
		int currTab = (pageNo -1)/tabSize +1;
		
		beginPage = (currTab -1) * tabSize +1;
		//실제 글이 존재하는 페이지 번호 수(lastPage = 7page)보다 페이지탭수(1~10page)가 크면 마지막페이지(endPage)번호는 실제 존재하는 페이지번호 수 (7page)가 된다. 
		endPage = (currTab * tabSize > lastPage)? lastPage : currTab * tabSize;
		
		//이전버튼 활성화할껀지?
		prev = beginPage != 1;
		next = endPage != lastPage;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public int getCount() {
		return count;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	
}
