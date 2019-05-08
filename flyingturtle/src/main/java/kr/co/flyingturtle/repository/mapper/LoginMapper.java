package kr.co.flyingturtle.repository.mapper;

import kr.co.flyingturtle.repository.vo.Member;

public interface LoginMapper {
	
	/** 로그인  */
	Member login(Member member);
}
