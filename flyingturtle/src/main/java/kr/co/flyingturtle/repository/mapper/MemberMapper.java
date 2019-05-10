package kr.co.flyingturtle.repository.mapper;

import kr.co.flyingturtle.repository.vo.Member;

public interface MemberMapper {
	
	/** 회원가입 */
	void insertMember(Member member);

	/** 아이디 중복체크 */
	int checkId(String id);
	
	/** 이메일 중복체크 */
	int checkEmail(String id);
	
}
