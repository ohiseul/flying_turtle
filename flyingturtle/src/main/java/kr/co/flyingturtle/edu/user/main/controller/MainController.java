package kr.co.flyingturtle.edu.user.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.user.employment.service.EmploymentService;
import kr.co.flyingturtle.edu.user.notice.service.NoticeService;
import kr.co.flyingturtle.repository.vo.Page;

@Controller("kr.co.flyingturtle.edu.main.controller.MainController")
@RequestMapping("/user/main")
public class MainController {
	
	@Autowired
	private EmploymentService emp;
	@Autowired
	private NoticeService notice;
	
	// 로그인 성공시
	@RequestMapping("/main2.do")
	public void main2(Model model) {
		model.addAttribute("noticeList", notice.noticeMain());
		model.addAttribute("empList", emp.selectEmpList());
	}
	
		

}
