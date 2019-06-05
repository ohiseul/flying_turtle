package kr.co.flyingturtle.edu.user.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.MypageMapper;
import kr.co.flyingturtle.repository.vo.Member;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageMapper mapper;
	
	@Override
	public Map<String, Object> listMypage(int memberNo) {
		Map<String, Object> map = new HashMap<>();
		//작성한 글 뿌리기
		map.put("lists", mapper.listMypage(memberNo));
		//작성글 갯수 뿌리기 
		map.put("writeVid", mapper.countWriteVideo(memberNo));
		map.put("writeQna", mapper.countWriteQna(memberNo));
		//작성댓글 갯수 뿌리기
		map.put("comVid",mapper.countCommentVideo(memberNo));
		map.put("comQna",mapper.countCommentQna(memberNo));
		return map;
	}
	
	@Override
	public List<Member> myWrite(int memberNo) throws Exception{;	
		return mapper.listMyWrite(memberNo);
	}
	

	@Override
	public List<Member> myComment(int memberNo) throws Exception {
		return mapper.listMyComment(memberNo);
	}
		
}
