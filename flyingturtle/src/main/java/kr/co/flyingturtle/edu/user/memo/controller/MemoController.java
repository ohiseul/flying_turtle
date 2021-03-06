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
	
	// 과목 조회
	@RequestMapping("/list.do")
	public void list(Model model) {
		mem = (Member)session.getAttribute("user");
		model.addAttribute("sbjList", service.selectMemoSbj(mem.getMemberNo()));
	}
	
	// 과목 생성
	@RequestMapping("/insertMemoSbj.do")
	@ResponseBody
	public Memo insertMemoSbj(Memo memo) {
		return service.insertMemoSbj(memo);
	}
	
	// 과목 수정
	@RequestMapping("/updateSbjName.do")
	@ResponseBody
	public void updateSbjName(Memo memo) {
		service.updateSbjName(memo);
	}
	
	// 과목 삭제
	@RequestMapping("/deleteMemoSbj.do")
	@ResponseBody
	public void deleteMemoSbj(int sbjNo) {
		service.deleteMemoSbj(sbjNo);
	}
	
	// 과목선택 저장(임시 -> 저장메모)
	@RequestMapping("/updateMemoSbj.do")
	@ResponseBody
	public void sortSbj(Memo memo) {
		service.updateMemoSbj(memo);
	}
	
	// 메모 조회
	@RequestMapping("/selectMemoList.do")
	@ResponseBody
	public List<Memo> selectMemoList(Memo memo) {
		return service.selectMemoList(memo);
	}
	
	// 메모 조회 (1개)
	@RequestMapping("/selectOneMemo.do")
	@ResponseBody
	public Memo selectOneMemo(int memoNo) {
		return service.selectOneMemo(memoNo);
	}
	
	// 메모 등록 + chrome extension
	@RequestMapping("/copy.do")
	@ResponseBody
	public Memo insertMemo(Memo memo)throws Exception {
		return service.insertMemo(memo);
	}
	
	// 메모 수정
	@RequestMapping("/updateMemo.do")
	@ResponseBody
	public Memo updateMemo(Memo memo) {
		return service.updateMemo(memo);
	}
	
	// 메모 삭제
	@RequestMapping("/delmemo.do")
	@ResponseBody
	public void delMemo(int memoNo) {
		service.deleteMemo(memoNo);
	}
	
}
