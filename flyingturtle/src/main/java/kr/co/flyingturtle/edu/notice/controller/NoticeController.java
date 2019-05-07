package kr.co.flyingturtle.edu.notice.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.notice.service.NoticeService;
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired	
	public NoticeService service;
	
	@RequestMapping("/list.do")
	public void selectNotice(Model model) throws Exception {
		System.out.println("list.do - Controller 호출");
		Map<String, Object> result = service.selectNotice();
		System.out.println("controller DB - " + result.toString());
		model.addAttribute("lists", result.get("lists"));
		
//		model.addAttribute("list", result.get("list"));
//		Notice notice = service.selectNotice();
//			notice.getBoardNo();
//			notice.getContent();
//			notice.getTitle();
//			notice.getMemberNo();
			
			
			
	}
}
