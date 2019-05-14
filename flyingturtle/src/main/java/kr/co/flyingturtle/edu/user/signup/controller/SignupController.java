package kr.co.flyingturtle.edu.user.signup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.user.signup.service.SignupService;
import kr.co.flyingturtle.repository.vo.Member;

@Controller
@RequestMapping("/user/signup")
public class SignupController {
	
	@Autowired
	SignupService service;
	
	@RequestMapping("/signup.do")
	public String signUp(Member member) {
		// null값이 없는지 확인 후 넘기기?
		service.insertMember(member);
		
		// 성공시 로그인화면으로
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/user/login/loginform.do";
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
