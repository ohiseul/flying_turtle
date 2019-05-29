package kr.co.flyingturtle.edu.user.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.LoginMapper;
import kr.co.flyingturtle.repository.vo.Member;

@Service
public class LoginServiceImpl implements LoginService {

		@Autowired
		private LoginMapper mapper;
		
		@Override
		public Member login(Member member) {
			System.out.println("Login Service 호출됨--- ");
			System.out.println("컨트롤러에서 넘겨준 아이디 : " + member.getId());
			System.out.println("컨트롤러에서 넘겨준 비번 : " + member.getPass());
			System.out.println("DB에 있음 >>> " + mapper.login(member));
			
			return mapper.login(member);
		}

		@Override
		public Member patternlogin(Member member) {
			System.out.println("PatternLogin Service 호출됨--- ");
			System.out.println("컨트롤러에서 넘겨준 아이디 : " + member.getId());
			System.out.println("컨트롤러에서 넘겨준 비번 : " + member.getPatternPass());
			System.out.println("DB에 있음 >>> " + mapper.patternlogin(member));
			System.out.println("----------------------------------");
			
			return mapper.patternlogin(member);
		}
		
		
		
}
