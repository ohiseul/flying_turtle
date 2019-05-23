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
//	등록
	public void write(Notice notice);
//	상세조회
	public Map<String, Object> detail(int no)throws Exception;
//	삭제
	public void delete(int no);
//	수정폼
	public Notice updateform(int no);
//	수정
	public void update(Notice notice);
//	파일선택
	public List<Files> listFile(int groupNo) throws Exception;
//	파일등록
	public void writeFile(Files files) throws Exception;
//	그룹번호 
	public int groupNo() throws Exception;
}
