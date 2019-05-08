package kr.co.flyingturtle.edu.notice.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.notice.service.NoticeService;
import kr.co.flyingturtle.repository.vo.Notice;
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired	
	public NoticeService service;
	
//	전체조회
	@RequestMapping("/list.do")
	public void list(Model model) throws Exception {
		System.out.println("list.do - Controller 호출");
		Map<String, Object> result = service.list();
		System.out.println("controller DB - " + result.toString());
		model.addAttribute("lists", result.get("lists"));
	}	
	@RequestMapping("/writeform.do")
	public void writeform() throws Exception{}
	
	@RequestMapping("/write.do")
	public String write(Notice notice) throws Exception{
		service.write(notice);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
			
			
			

}
