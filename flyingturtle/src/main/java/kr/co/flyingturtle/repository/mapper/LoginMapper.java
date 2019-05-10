package kr.co.flyingturtle.repository.mapper;

import kr.co.flyingturtle.repository.vo.Member;

public interface LoginMapper {
	
	/** 로그인  */
	Member login(Member member);
	
	/** 아이디 중복체크 */
	int checkId(String id);
	
	/** 이메일 중복체크 */
	int checkEmail(String id);
}
