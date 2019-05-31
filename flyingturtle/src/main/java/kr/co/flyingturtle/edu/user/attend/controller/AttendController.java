package kr.co.flyingturtle.edu.user.attend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.attend.service.AttendService;
import kr.co.flyingturtle.repository.vo.Attend;
@Controller("kr.co.flyingturtle.edu.user.attend.controller")
@RequestMapping("/user/attend")
public class AttendController {
	
	@Autowired	
	public AttendService service;

//	사용자 출석 버튼 클릭시
	@RequestMapping("/checkIn.do")
	@ResponseBody
	public void checkIn(Attend attend, int memberNo) throws Exception {
		service.checkIn(attend);
	}
//	사용자 퇴실 버튼 클릭시
	@RequestMapping("/checkOut.do")
	@ResponseBody
	public void checkOut(Attend attend, int memberNo) throws Exception {
		service.checkOut(attend);
	}
	
//	입실되어있는지 체크
	@RequestMapping("/isCheck.do")
	@ResponseBody
	public int isCheck(Attend attend)throws Exception {
		System.out.println("입실체크옴");
		return service.isCheck(attend);
	}
	
	
	

}
