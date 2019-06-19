package kr.co.flyingturtle.edu.user.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.NoticeMapper;
import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.PageResult;


@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;

//	전체조회
	public Map<String, Object> list(Page page) {
		Map<String, Object> map = new HashMap<>();
		map.put("lists", mapper.selectListNotice(page));
		map.put("page",new PageResult(page.getPageNo(),mapper.selectNoticeCount(page)));
		return map;
	}
//	조회 - 메인
	public List<Notice> noticeMain() {
		return mapper.selectNoticeMain();
	}
	
//	등록
	public void write(Notice notice) {
		mapper.insertNotice(notice);
	}
	
//	상세조회
	public Map<String, Object> detail(Notice notice) throws Exception {
		System.out.println("상세조회 서비스 옴");
		Map<String, Object> result = new HashMap<>();
		result.put("detail",mapper.selectDetailNotice(notice.getBoardNo()));
		int fileGroupNo = notice.getFileGroupNo();
		result.put("files",mapper.selectFileByNo(fileGroupNo));
		mapper.updateViewCnt(notice.getBoardNo());
		System.out.println(result.toString());
		return result;
	}
//	삭제
	public void delete(int no) {
		mapper.deleteNoticeByNo(no);
	}
	
//	수정폼보여주기
	public Notice updateform(int no) {
		return mapper.selectDetailNotice(no);	
	}
	public void update(Notice notice) {
		System.out.println("updateService불림");
		mapper.updateNotice(notice);
		System.out.println(notice.getBoardNo());
		System.out.println(notice.getContent());
	}

}
