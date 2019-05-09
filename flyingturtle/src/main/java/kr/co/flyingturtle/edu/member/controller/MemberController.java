package kr.co.flyingturtle.edu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.member.service.MemberService;
import kr.co.flyingturtle.repository.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/signUp.do")
	public String signUp(Member member) {
		service.insertMember(member);
		
		// 성공시 로그인화면으로
		return "redirect:/login/loginform.do";
	}
	
	
	
	
}
