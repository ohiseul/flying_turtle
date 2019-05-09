package kr.co.flyingturtle.repository.mapper;

import kr.co.flyingturtle.repository.vo.Member;

public interface MemberMapper {
	
	/** 회원가입 */
	void insertMember(Member member);
}
