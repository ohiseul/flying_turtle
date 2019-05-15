package kr.co.flyingturtle.edu.admin.assignment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.user.notice.service.NoticeService;
@Controller("kr.co.flyingturtle.edu.user.assignment.controller")
@RequestMapping("/user/assignment")
public class AssignmentController {
	
	@Autowired	
	public NoticeService service;
	
	// 과제 게시판
	@RequestMapping("/home.do")
	public void home() throws Exception {}

}
