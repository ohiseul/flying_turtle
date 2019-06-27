package kr.co.flyingturtle.edu.user.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.user.login.service.LoginService;
import kr.co.flyingturtle.repository.vo.Member;

@Controller
@RequestMapping("/user/login")
public class LoginController {
	
	@Autowired
	LoginService service;
	Member mem;
	
	@RequestMapping("/loginform.do")
	public void loginform() {}

	@PostMapping("/login.do")
	@ResponseBody
	public int login(Member member) {
		mem = service.login(member);
		
		// db에 없으면 로그인 폼으로 보낸다.
		if( mem == null ) return 0;
		else return 1;
	}
	
	@RequestMapping("/loginsuccess.do")
	public String loginSuccess(HttpSession session) {
		// 로그인 성공 시 회원 코드에 따라 다른 페이지 이동
		if( mem.getMemberCode() == 51 ) {
			session.setAttribute("admin", mem);
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main/main.do";			
		}
		else {
			session.setAttribute("user", mem);
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/user/main/main2.do";
		}
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX +"/user/login/loginform.do";
	}
	
	@RequestMapping("/extensionlogin.do")
	@ResponseBody
	public int extensionlogin(Member member) {
		System.out.println("크롬 로그인 --- ");
		
		int memberNo = 0;
		Member mem = service.login(member);
		if( mem != null) memberNo = mem.getMemberNo();
		return memberNo;
	}
	
	/*============================패턴 로그인========================================*/
	@PostMapping("/patternlogin.do")
	public String patterlogin(Member member, HttpSession session) {
		System.out.println("*******패턴 로그인 컨트롤러 ********");
		System.out.println("id : " + member.getId());
		System.out.println("patternpass : " + member.getPatternPass());
		System.out.println("*******패턴 로그인 컨트롤러  ********");
		
		// Member가 DB에 있는지 체크
		Member mem = service.patternlogin(member);
		
		// db에 없으면 로그인 폼으로 보낸다.
		if(mem == null ) {
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/user/login/loginform.do";
		}
		session.setAttribute("user", mem);			
		
		// 로그인 성공 시 회원 코드에 따라 다른 페이지 이동
		if(mem.getMemberCode() == 51) {
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main/main.do";			
		} else {
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/user/main/main2.do";
		}
	}
	
	/*============================패턴 로그인========================================*/
	
	
	
	
}
