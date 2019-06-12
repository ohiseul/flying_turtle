package kr.co.flyingturtle.edu.user.memo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.memo.service.MemoService;
import kr.co.flyingturtle.repository.vo.Member;
import kr.co.flyingturtle.repository.vo.Memo;

@Controller("kr.co.flyingturtle.edu.user.memo.controller")
@RequestMapping("/user/memo")
public class MemoController{
	
	@Autowired	
	public MemoService service;
	
	@Autowired
	private HttpSession session;
	Member mem;
	
	@RequestMapping("/list.do")
	public void list() {}
	
	@RequestMapping("/loading.do")
	@ResponseBody
	public List<Memo> list(Model model) throws Exception {
		System.out.println("컨트롤러");
		
		mem = (Member)session.getAttribute("user");
//		model.addAttribute("list", service.selectNonSaveMemo(mem.getMemberNo()));
		return service.selectNonSaveMemo(mem.getMemberNo());
	}

	/** 크롬에서 복사 - db 저장 */
//	@RequestMapping("/list.do")
//	public void save(Memo memo)throws Exception {
//		System.out.println(memo.getContent());
//	}
	
}
