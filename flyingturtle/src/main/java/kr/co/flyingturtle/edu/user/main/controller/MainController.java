package kr.co.flyingturtle.edu.user.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.user.main.service.MainService;

@Controller("kr.co.flyingturtle.edu.main.controller.MainController")
@RequestMapping("/user/main")
public class MainController {
	
	@Autowired
	private MainService service;
	
	// 로그인 성공시
	@RequestMapping("/main2.do")
	public void main2(Model model) {
		System.out.println("main - controller");
		model.addAttribute("empList", service.selectEmpList());
	}
	
		

}
