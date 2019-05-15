package kr.co.flyingturtle.edu.admin.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.user.notice.service.NoticeService;
import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;
@Controller("kr.co.flyingturtle.edu.admin.calendar.controller")
@RequestMapping("/admin/calendar")
public class CalendarController {
	
	@Autowired	
	public NoticeService service;
	
//	전체조회
	@RequestMapping("/calendar.do")
	public void list(Page page, Model model	) throws Exception {
		
	}

}
