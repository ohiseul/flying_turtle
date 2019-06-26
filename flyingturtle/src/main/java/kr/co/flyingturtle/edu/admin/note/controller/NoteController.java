package kr.co.flyingturtle.edu.admin.note.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.admin.note.service.NoteService;
import kr.co.flyingturtle.repository.vo.Member;
@Controller("kr.co.flyingturtle.edu.admin.note.controller")
@RequestMapping("/admin/note")
public class NoteController {
	
	@Autowired	
	public NoteService service;
	

//	날짜별로 리스트조회
	@RequestMapping("/ajaxMemberList.do")
	@ResponseBody
	public List<Member> ajaxMemberList() throws Exception {
		
		List<Member> result = service.selectMember();
		return result;
		
	}
	

}
