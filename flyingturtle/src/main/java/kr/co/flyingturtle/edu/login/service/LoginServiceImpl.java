package kr.co.flyingturtle.edu.login.service;

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
			System.out.println(mapper.login(member));
			
			Member mem = mapper.login(member);
			return mem;
		}
		
		/** 아이디 중복 체크 */
		@Override
		public int checkId(String id) {
			System.out.println("아이디 중복체크 Service 호출");
			System.out.println(" 값 ---- "+ mapper.checkId(id));
			return mapper.checkId(id);
		}
		
		/** 이메일 중복 체크 */
		@Override
		public int checkEmail(String email) {
			System.out.println("이메일 중복체크 Service 호출");
			System.out.println(" 값 ---- "+ mapper.checkEmail(email));
			return mapper.checkEmail(email);
		}
		
}
