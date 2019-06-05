package kr.co.flyingturtle.edu.admin.attend.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.admin.attend.service.AttendService;
import kr.co.flyingturtle.repository.vo.Attend;
@Controller("kr.co.flyingturtle.edu.admin.attend.controller")
@RequestMapping("/admin/attend")
public class AttendController {
	
	@Autowired	
	public AttendService service;
	
// 	일별전체조회
	@RequestMapping("/dayList.do")
	public void list(Model model) throws Exception {
		System.out.println("컨트롤러 옴");
		Map<String, Object> map = service.list();
		model.addAttribute("List",map.get("list"));
		model.addAttribute("AllCount",map.get("count"));
		model.addAttribute("count",map.get("attendCount"));
	}	
	
//	날짜별로 리스트조회
	@RequestMapping("/ajaxDayList.do")
	@ResponseBody
	public Map<String, Object> ajaxDayList(Attend attend) throws Exception {
		System.out.println("날짜가져옴"+attend.getAttendRegDate());
		System.out.println(service.Daylist(attend).size());
		Map<String, Object> result = service.Daylist(attend);
		return result;
		
	}
	
//	출석상태 변경
//	@RequestMapping("/updateState.do")
//	@ResponseBody
//	public void updateState(Attend attend) throws Exception {
//		System.out.println("update 컨트롤러 왔음");
//		service.updateState(attend);
//	}
	@RequestMapping("/updateState.do")
	@ResponseBody
	public Map<String, Object> updateState(Attend attend) throws Exception {
		System.out.println("update 컨트롤러 왔음");
		System.out.println("컨트롤러 멤버번호 : "+attend.getMemberNo());
		Map<String, Object> result = service.updateState(attend);
		return result;
	}
	
//	월별전체조회
	@RequestMapping("/monthList.do")
	public void monthList(Model model) throws Exception {
		System.out.println("월별 컨트롤러 옴");
		Map<String, Object> result = service.monthList();
		model.addAttribute("list",result.get("list"));
		
	}
	

}
