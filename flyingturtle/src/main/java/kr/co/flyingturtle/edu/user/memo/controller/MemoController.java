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
	
	// 메모 과목 조회(공통)
	@RequestMapping("/list.do")
	public void list(Model model) {
		mem = (Member)session.getAttribute("user");
		model.addAttribute("sbjList", service.selectMemoSbj(mem.getMemberNo()));
	}
	
	// 임시메모 조회
	@RequestMapping("/loading.do")
	@ResponseBody
	public List<Memo> loading() throws Exception {
		mem = (Member)session.getAttribute("user");
		return service.selectNonSaveMemo(mem.getMemberNo());
	}
	
	// 임시메모 수정
	@RequestMapping("/editNonsaveMemo.do")
	@ResponseBody
	public void editNonsaveMemo(Memo memo) {
		service.updateNonSaveMemo(memo);
	}
	
	// 메모 삭제 (공통)
	@RequestMapping("/delmemo.do")
	@ResponseBody
	public void delMemo(int memoNo) {
		service.deleteMemo(memoNo);
	}
	
	// 과목선택 저장(임시 -> 저장메모)
	@RequestMapping("/updateMemoSbj.do")
	@ResponseBody
	public void sortSbj(Memo memo) {
		service.updateMemoSbj(memo);
	}
	
	// 저장 메모 조회
	@RequestMapping("/selectSavedMemo.do")
	@ResponseBody
	public List<Memo> selectSavedMemo(Memo memo) {
		return service.selectSavedMemo(memo);
	}
	
	/** =========================================================
		chrome extension
	=========================================================*/
	
	// 메모 등록(공통)
	@RequestMapping("/copy.do")
	@ResponseBody
	public int save(Memo memo)throws Exception {
		return service.insertMemo(memo);
	}
	
}
