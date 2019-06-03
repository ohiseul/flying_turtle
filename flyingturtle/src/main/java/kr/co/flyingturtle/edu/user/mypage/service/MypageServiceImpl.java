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
	public List<Member> myWrite(int memberNo) {
		System.out.println(memberNo +"들어옴");
		System.out.println("mapper: "+ mapper.listMyWrite(memberNo));
		List<Member> mem = mapper.listMyWrite(memberNo);

		System.out.println("====================================");
		System.out.println("18번"+mapper.listMyWrite(memberNo));
		System.out.println("====================================");
		for(Member m : mem) {
			System.out.println("비디오 : "+ m.getQnaTitle());
			System.out.println("qna : "+m.getQnaTitle());
		}
		
		return mem;
	}


	@Override
	public List<Member> myQna(int memberNo) throws Exception {
		Member m2 = new Member();
		System.out.println("질문글 제목: "+m2.getQnaTitle());
		return mapper.listQna(memberNo);
	}
	

}
