package kr.co.flyingturtle.edu.user.signup.service;

import kr.co.flyingturtle.repository.vo.Member;

public interface SignupService {
	
	/** 회원가입 */
	void insertMember(Member member);

	/** 아이디 중복체크 */
	int checkId(String id);
	
	/** 이메일 중복체크 */
	int checkEmail(String id);


}
