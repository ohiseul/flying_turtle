package kr.co.flyingturtle.edu.member.service;

import kr.co.flyingturtle.repository.vo.Member;

public interface MemberService {
	
	/** 회원가입 */
	void insertMember(Member member);

}
