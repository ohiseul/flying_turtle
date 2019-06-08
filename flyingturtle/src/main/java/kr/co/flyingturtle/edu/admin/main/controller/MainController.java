package kr.co.flyingturtle.edu.admin.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.user.employment.service.EmploymentService;
import kr.co.flyingturtle.edu.user.notice.service.NoticeService;

@Controller("kr.co.flyingturtle.edu.admin.main.controller.MainController")
@RequestMapping("/admin/main")
public class MainController {
	
	// 로그인 성공시
	@RequestMapping("/main.do")
	public void main2(Model model) {
	}
	
		

}
