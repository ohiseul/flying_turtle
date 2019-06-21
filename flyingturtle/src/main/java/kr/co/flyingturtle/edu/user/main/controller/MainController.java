package kr.co.flyingturtle.edu.user.main.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.attend.service.AttendService;
import kr.co.flyingturtle.edu.user.employment.service.EmploymentService;
import kr.co.flyingturtle.edu.user.notice.service.NoticeService;
import kr.co.flyingturtle.repository.vo.Attend;
import kr.co.flyingturtle.repository.vo.Member;

@Controller("kr.co.flyingturtle.edu.user.main.controller.MainController")
@RequestMapping("/user/main")
public class MainController {
	
	@Autowired
	private EmploymentService emp;
	@Autowired
	private NoticeService notice;
	@Autowired
	private AttendService attend;
	@Autowired
	private HttpSession session;
	Member mem;
	
	// 로그인 성공시
	@RequestMapping("/main2.do")
	public void main2(Model model) {
		model.addAttribute("noticeList", notice.noticeMain());
		model.addAttribute("empList", emp.selectEmpList());
		mem = (Member)session.getAttribute("user");
		model.addAttribute("pieChart",attend.selectAttendCount(mem.getMemberNo()));
	}
	
	@RequestMapping("/attendCnt.do") 
	@ResponseBody
	public Attend attendCnt(int memberNo) { 
		System.out.println("attendCnt 컨트롤러 옴"); 
	    return attend.attendCnt(memberNo);
	 }
	
	

		

}
