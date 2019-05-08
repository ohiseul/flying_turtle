package kr.co.flyingturtle.edu.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.login.service.LoginService;
import kr.co.flyingturtle.repository.vo.Member;

@Controller
@RequestMapping("/login")
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
		return "redirect:/main/main.do";
	}
	
	
	
	
}
