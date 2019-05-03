package kr.co.flyingturtle.db.edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.db.repository.mapper.MemberMapper;

@Service
public class MemberServiceImpl {

		@Autowired
		private MemberMapper mapper;
}
