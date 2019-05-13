package kr.co.flyingturtle.edu.notice.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.NoticeMapper;
import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.PageResult;


@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;

	//	전체조회
	public Map<String, Object> list(Page page) {
		System.out.println("list.do - ServiceImpl 호출");
		System.out.println("page VO" + page.getKeyword());
		Map<String, Object> result = new HashMap<>();
		System.out.println("Map 생성 후 ---");
//		System.out.println("page검색어" + page.getKeyword());
		
		result.put("keyword",page.getKeyword());
		System.out.println(mapper.selectListNotice(page).toString());
		result.put("lists", mapper.selectListNotice(page));
		System.out.println("lists 성공");
//		System.out.println("DB??? "+result.toString());
//		System.out.println("검색어 : "+page.getKeyword());
		System.out.println("keyword put 성공");
		
		System.out.println("service keyword받기 "+page.getKeyword());
		result.put("page",new PageResult(page.getPageNo(),mapper.selectNoticeCount()));
		System.out.println(result);
		return result;
	}
	
	
//	등록
	public void write(Notice notice) {
		mapper.insertNotice(notice);
	}
//	상세조회
	public Notice detail(int no) {
		mapper.updateViewCnt(no);
		return mapper.selectDetailNotice(no);
		
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
