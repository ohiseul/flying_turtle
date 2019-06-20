package kr.co.flyingturtle.edu.admin.notice.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;

public interface NoticeService {
	
//	public List<Notice> selectNotice();
	
	public Map<String, Object> list(Page page);
	public void write(Notice notice);
	public Map<String, Object> detail(Notice notice) throws Exception;
	public void delete(int no);
	public Notice updateform(int no);
	public void update(Notice notice);
//	파일선택
	public List<Files> listFile(int groupNo) throws Exception;
//	파일등록
	public void writeFile(Files files) throws Exception;
//	그룹번호 
	public int groupNo() throws Exception;
}
