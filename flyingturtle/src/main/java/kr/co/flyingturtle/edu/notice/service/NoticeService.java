package kr.co.flyingturtle.edu.notice.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Notice;

public interface NoticeService {
	
//	public List<Notice> selectNotice();
	
	public Map<String, Object> list();
	
	public void write(Notice notice);
	public Notice detail(int no);
	public void delete(int no);
}
