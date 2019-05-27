package kr.co.flyingturtle.edu.user.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/mypage")
public class MypageController {
	
	@Autowired
//	LoginService service;
	
	@RequestMapping("/mypage.do")
	public void mypage() {}

	
	
}
