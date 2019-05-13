package kr.co.flyingturtle.edu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	/** 아이디 중복 검사 */
	@RequestMapping("/checkid.do")
	@ResponseBody
	public int checkId(String id) {
		System.out.println("중복검사 Controller 호출");
		return service.checkId(id);
	}
	
	/** 아이디 중복 검사 */
	@RequestMapping("/checkemail.do")
	@ResponseBody
	public int checkEmail(String email) {
		System.out.println("이메일 중복검사 Controller 호출");
		return service.checkEmail(email);
	}
	
	
}
