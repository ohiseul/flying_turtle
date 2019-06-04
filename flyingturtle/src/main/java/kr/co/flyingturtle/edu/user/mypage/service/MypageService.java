package kr.co.flyingturtle.edu.user.mypage.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Member;

public interface MypageService {

	Map<String, Object> listMypage(int memberNo) throws Exception;

	List<Member> myWrite(int memberNo) throws Exception;
	
	List<Member> myComment(int memberNo) throws Exception;
	
	List<Member> myQna(int memberNo) throws Exception;
	
}
