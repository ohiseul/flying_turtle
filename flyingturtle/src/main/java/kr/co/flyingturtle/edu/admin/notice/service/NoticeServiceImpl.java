package kr.co.flyingturtle.edu.admin.notice.service;

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


@Service("kr.co.flyingturtle.edu.admin.notice.service")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;

	//	전체조회
	public Map<String, Object> list(Page page) {
		Map<String, Object> result = new HashMap<>();
		result.put("keyword",page.getKeyword());
		result.put("searchType",page.getSearchType());
		result.put("lists", mapper.selectListNotice(page));
		System.out.println("lists 성공");
		result.put("page",new PageResult(page.getPageNo(),mapper.selectNoticeCount(page)));
		System.out.println(result);
		return result;
	}
	
	
//	등록
	public void write(Notice notice) {
		mapper.insertNotice(notice);
	}
//	상세조회
	public Map<String,Object> detail(Notice notice) throws Exception {
		System.out.println("상세조회 서비스 옴");
		Map<String, Object> result = new HashMap<>();
		result.put("detail",mapper.selectDetailNotice(notice.getBoardNo()));
		int fileGroupNo = notice.getFileGroupNo();
		result.put("files",mapper.selectFileByNo(fileGroupNo));
		mapper.updateViewCnt(notice.getBoardNo());
		System.out.println(result.toString());
		/* result.put("paging",mapper.selectPaging(notice.getBoardNo())); */
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
//	파일 등록
	public void writeFile(Files files) throws Exception {
		mapper.insertFile(files);
	}
//	파일 수정
	public void updateFile(Files files) {
		mapper.updateFile(files);
	}
//	파일그룹번호
	public int groupNo() throws Exception {
		return mapper.selectGroupNo();
	}
//	파일다운로드를 위한 파일선택
	public List<Files> listFile(int fileGroupNo) throws Exception {
		return mapper.selectFileByNo(fileGroupNo);
	}
}
