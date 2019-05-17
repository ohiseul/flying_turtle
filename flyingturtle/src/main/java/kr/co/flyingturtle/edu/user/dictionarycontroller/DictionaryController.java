package kr.co.flyingturtle.edu.user.dictionarycontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.user.notice.service.NoticeService;
import kr.co.flyingturtle.repository.vo.Page;
@Controller
@RequestMapping("/user/dictionary")
public class DictionaryController {
	
	@Autowired	
	public NoticeService service;
	
//	전체조회
	@RequestMapping("/list.do")
	public void list(Page page, Model model	) throws Exception {
	}

}
