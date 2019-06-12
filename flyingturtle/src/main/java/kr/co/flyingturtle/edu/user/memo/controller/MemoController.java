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
	public void list(Model model) {
		mem = (Member)session.getAttribute("user");
		model.addAttribute("sbjList", service.selectMemoSbj(mem.getMemberNo()));
	}
	
	@RequestMapping("/loading.do")
	@ResponseBody
	public List<Memo> list() throws Exception {
		mem = (Member)session.getAttribute("user");
		return service.selectNonSaveMemo(mem.getMemberNo());
	}
	
	@RequestMapping("/editNonsaveMemo.do")
	@ResponseBody
	public void editNonsaveMemo(Memo memo) {
		service.updateNonSaveMemo(memo);
	}
	
	@RequestMapping("/delmemo.do")
	@ResponseBody
	public void delMemo(int memoNo) {
		service.deleteMemo(memoNo);
	}
	
	/** 크롬에서 복사 - db 저장 */
	@RequestMapping("/copy.do")
	public void save(Memo memo)throws Exception {
		System.out.println(memo.getContent());
		
		service.insertMemo(memo);
	}
	
}
