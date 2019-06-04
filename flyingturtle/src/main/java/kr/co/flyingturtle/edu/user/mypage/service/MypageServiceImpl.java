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
		map.put("lists", mapper.listMypage(memberNo));
		return map;
	}


	@Override
	public List<Member> myWrite(int memberNo) throws Exception{
		List<Member> mem = mapper.listMyWrite(memberNo);	
		return mapper.listMyWrite(memberNo);
	}

	@Override
	public List<Member> myComment(int memberNo) throws Exception {
		return mapper.listMyComment(memberNo);
	}
	
	@Override
	public List<Member> myQna(int memberNo) throws Exception {
		Member m2 = new Member();
		return mapper.listQna(memberNo);
	}

	

	
}
