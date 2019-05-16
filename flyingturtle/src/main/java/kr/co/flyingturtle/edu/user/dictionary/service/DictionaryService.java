package kr.co.flyingturtle.edu.user.dictionary.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;

public interface DictionaryService {
	
//	public List<Notice> selectNotice();
	
	public Map<String, Object> list(Page page);
	public void write(Notice notice);
	public Notice detail(int no);
	public void delete(int no);
	public Notice updateform(int no);
	public void update(Notice notice);
}
