package kr.co.flyingturtle.edu.user.dictionary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.notice.service.NoticeService;
import kr.co.flyingturtle.repository.vo.Dictionary;
import kr.co.flyingturtle.repository.vo.Page;
@Controller
@RequestMapping("/user/dictionary")
public class DictionaryController {
	
	@Autowired	
	public NoticeService service;
	
	// 처음 로딩시 전체조회
	@RequestMapping("/list.do")
	public void list(Page page, Model model	) throws Exception {
		
	}
	
	// 최초 등록
	@RequestMapping("/insert.do")
	@ResponseBody
	public void detailWord(Dictionary dic) {
		
	}
	

}
