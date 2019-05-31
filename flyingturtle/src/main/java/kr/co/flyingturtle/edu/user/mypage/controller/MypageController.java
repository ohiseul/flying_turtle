package kr.co.flyingturtle.edu.user.mypage.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	}
	
	
	// 작성글 보기 
	@RequestMapping("/myWrite.do") 
	public void myWrite(Model model, HttpSession session) throws Exception {
		System.out.println("-------------------작성글 보기 컨트롤러 들어옴-------------------------");
		Member mem = (Member)session.getAttribute("user");
		Map<String, Object> result = service.myWrite(mem.getMemberNo());
		model.addAttribute("write",result.get("write"));
	}
	
}
