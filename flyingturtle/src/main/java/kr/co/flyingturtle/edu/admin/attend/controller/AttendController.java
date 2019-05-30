package kr.co.flyingturtle.edu.admin.attend.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.admin.attend.service.AttendService;
import kr.co.flyingturtle.repository.vo.Attend;
@Controller("kr.co.flyingturtle.edu.admin.attend.controller")
@RequestMapping("/admin/attend")
public class AttendController {
	
	@Autowired	
	public AttendService service;
	
//	전체조회
	@RequestMapping("/dayList.do")
	public void list(Model model,Attend attend) throws Exception {
		System.out.println("컨트롤러 옴");
		Map<String, Object> map = service.list(attend);
		model.addAttribute("List",map.get("list"));
		System.out.println(map.get("list"));
	}	

}
