package kr.co.flyingturtle.edu.user.notice.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;

public interface NoticeService {
	
//	public List<Notice> selectNotice();
	
//	페이징+검색+리스트
	public Map<String, Object> list(Page page);
//	조회 - 메인
	List<Notice> noticeMain();
//	등록
	public void write(Notice notice);
//	상세조회
	public Map<String, Object> detail(Notice notice)throws Exception;
//	삭제
	public void delete(int no);
//	수정폼
	public Notice updateform(int no);
//	수정
	public void update(Notice notice);

}
