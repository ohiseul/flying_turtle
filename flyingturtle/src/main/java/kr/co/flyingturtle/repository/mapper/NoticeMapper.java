package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Files;
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
//	전체조회 - 메인
	public List<Notice> selectNoticeMain();
	/*파일*/
//	파일그룹번호 가져오기
	public int selectGroupNo()throws Exception;
//	글에 해당하는 파일 가져오기
	public List<Files> selectFileByNo(int fileGroupNo) throws Exception;
//	파일등록
	public void insertFile(Files files) throws Exception;
//	파일수정
	public void updateFile(Files files);

}
