package kr.co.flyingturtle.edu.user.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.repository.vo.Member;

@Controller("kr.co.flyingturtle.edu.main.controller.MainController")
@RequestMapping("/user/main")
public class MainController {
	
	@Autowired
	private HttpSession session;
	
	// 로그인 성공시
	@RequestMapping("/main.do")
	public void main() {
//		Member m = (Member)session.getAttribute("user");
//		System.out.println("로그인한 아이디는 ::: "+ m.getId());
//		System.out.println("로그인한 아이디의 이메일은 ::: "+ m.getEmail());
	}
	
	

}
