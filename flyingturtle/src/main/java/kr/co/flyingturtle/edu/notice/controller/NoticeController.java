package kr.co.flyingturtle.edu.notice.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.notice.service.NoticeService;
import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.Search;
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired	
	public NoticeService service;
	
//	전체조회
	@RequestMapping("/list.do")
	public void list(Page page, Model model, String keyword	) throws Exception {
		System.out.println("list.do - Controller 호출");
		System.out.println("매개변수" + keyword);
		page.setKeyword(keyword);
		System.out.println("page 키워드 ::: " + page.getKeyword());
//		service객체의 list메서드를 호출해서 map객체에 넣어라!
		Map<String, Object> map = service.list(page);
//		System.out.println("controller DB - " + result.toString());
//		map.put("keyword",page.getKeyword());
//		map.put("page",page.getPageNo());
		model.addAttribute("lists", map.get("lists"));
		model.addAttribute("page",map.get("page"));
		model.addAttribute("keyword", map.get("keyword"));
		System.out.println("keyword받기 "+page.getKeyword());
	}
	
//	등록
	@RequestMapping("/writeform.do")
	public void writeform() throws Exception{}
	
	@RequestMapping("/write.do")
	public String write(Notice notice) throws Exception{
		service.write(notice);
	
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
//	상세조회
	@RequestMapping("/detail.do")
	public void detail(int no, Model model)throws Exception {
		model.addAttribute("detail",service.detail(no));
	}
//	삭제		
	@RequestMapping("delete.do")
	public String delete(int no)throws Exception {
		service.delete(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}

//	수정
	@RequestMapping("updateform.do")
	public void updateform(int no, Model model)throws Exception {
		model.addAttribute("update", service.updateform(no));
	}
	
	@RequestMapping("update.do")
	public String update(Notice notice)throws Exception {
		System.out.println("update---");
		service.update(notice);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}

}
