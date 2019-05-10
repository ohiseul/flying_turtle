package kr.co.flyingturtle.edu.login.service;

import kr.co.flyingturtle.repository.vo.Member;

public interface LoginService {
	
	/** 로그인 */
	Member login(Member member);
	
}
