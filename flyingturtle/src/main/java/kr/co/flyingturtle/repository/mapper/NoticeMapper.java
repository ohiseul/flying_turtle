package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;

public interface NoticeMapper {
//	등록
	public void insertNotice(Notice notice);
//	전체조회
	public List<Notice> selectListNotice(Page page);
//	상세조회
	public Notice selectDetailNotice(int no);
//	삭제
	public void deleteNoticeByNo(int no);
//	조회수증가
	public void updateViewCnt(int no);
//	수정
	public void updateNotice(Notice notice);
//	전체게시물수
	public int selectNoticeCount(Page page);
}
