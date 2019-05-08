package kr.co.flyingturtle.edu.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.flyingturtle.edu.main.controller.MainController")
@RequestMapping("/main")
public class MainController {
	
	// 로그인 성공시
	@RequestMapping("/main.do")
	public void main() {}
	
	

}
