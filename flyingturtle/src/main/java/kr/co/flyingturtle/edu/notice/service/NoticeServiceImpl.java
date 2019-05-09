package kr.co.flyingturtle.edu.notice.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.NoticeMapper;
import kr.co.flyingturtle.repository.vo.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;
//	전체조회
	public Map<String, Object> list() {
		System.out.println("list.do - ServiceImpl 호출");
		Map<String, Object> result = new HashMap<>();
		result.put("lists", mapper.selectListNotice());
//		System.out.println("DB??? "+result.toString());
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
