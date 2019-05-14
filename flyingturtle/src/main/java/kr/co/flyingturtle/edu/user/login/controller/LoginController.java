package kr.co.flyingturtle.edu.user.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.user.login.service.LoginService;
import kr.co.flyingturtle.repository.vo.Member;

@Controller
@RequestMapping("/user/login")
public class LoginController {
	
	@Autowired
	LoginService service;
	
	@RequestMapping("/loginform.do")
	public void loginform() {}

	@PostMapping("/login.do")
	public String login(Member member, HttpSession session) {
		System.out.println("id : " + member.getId());
		System.out.println("pass : " + member.getPass());
		
		// 세션 등록
		Member mem = service.login(member);
		session.setAttribute("user", mem);
		
		// 로그인 성공 시 메인 페이지로 이동
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/user/main/main.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX +"/user/login/loginform.do";
	}
	
	
	
	
}
