package kr.co.flyingturtle.edu.user.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.mypage.service.MypageService;
import kr.co.flyingturtle.repository.vo.Member;

@Controller
@RequestMapping("/user/mypage")
public class MypageController {
	
	@Autowired
	MypageService service;
	
	@RequestMapping("/my-main.do")
	public void mypage(Model model, HttpSession session) throws Exception {
		Member mem = (Member)session.getAttribute("user");
		Map<String, Object> result = service.listMypage(mem.getMemberNo());
		model.addAttribute("list", result.get("lists"));
		model.addAttribute("writeVid", result.get("writeVid"));
		model.addAttribute("writeQna", result.get("writeQna"));
		model.addAttribute("comVid", result.get("comVid"));
		model.addAttribute("comQna", result.get("comQna"));
	}
	
	// 작성글 보기 
	@RequestMapping("/myWrite.do")
	@ResponseBody
	public List<Member> myWrite(HttpSession session) throws Exception {
		System.out.println(" ******** 1. 작성글 보기 컨트롤러 들어옴 ******** ");
		Member mem = (Member)session.getAttribute("user");
		return service.myWrite(mem.getMemberNo());
	}	
	
	// 작성댓글 보기 
	@RequestMapping("/myComment.do")
	@ResponseBody
	public List<Member> myComment(HttpSession session) throws Exception {
		Member mem = (Member)session.getAttribute("user");
		return service.myComment(mem.getMemberNo());
	}
	
		
}
