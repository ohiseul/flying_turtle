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
			System.out.println("아이 디 : "+member.getId());
			System.out.println("비번 : "+member.getPass());
			System.out.println(mapper.login(member));
			
			Member mem = mapper.login(member);
			return mem;
		}
		
		
		
}
