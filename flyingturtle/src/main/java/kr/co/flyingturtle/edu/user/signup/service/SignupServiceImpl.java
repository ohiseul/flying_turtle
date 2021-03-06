package kr.co.flyingturtle.edu.user.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.SignupMapper;
import kr.co.flyingturtle.repository.vo.Member;

@Service
public class SignupServiceImpl implements SignupService {

		@Autowired
		private SignupMapper mapper;

		@Override
		public void insertMember(Member member) {
			System.out.println("service - insertMember ===");
			mapper.insertMember(member);
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
