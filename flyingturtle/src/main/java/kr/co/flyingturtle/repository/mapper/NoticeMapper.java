package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Notice;

public interface NoticeMapper {
	public void insertNotice(Notice notice);
	public List<Notice> selectListNotice();
	public Notice selectDetailNotice(int no);
	public void deleteNoticeByNo(int no);
}
