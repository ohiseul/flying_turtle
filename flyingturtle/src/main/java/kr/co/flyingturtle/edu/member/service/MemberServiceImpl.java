package kr.co.flyingturtle.edu.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.MemberMapper;
import kr.co.flyingturtle.repository.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

		@Autowired
		private MemberMapper mapper;

		@Override
		public void insertMember(Member member) {
			System.out.println("service - insertMember ===");
			mapper.insertMember(member);
		}
		
		
		
		
		
}
