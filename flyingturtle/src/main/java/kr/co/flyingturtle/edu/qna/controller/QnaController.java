package kr.co.flyingturtle.edu.qna.controller;

import java.io.File;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.qna.service.QnaService;
import kr.co.flyingturtle.repository.vo.Qna;

@Controller
@RequestMapping("/qna")
public class QnaController {
		
		@Autowired	
		public QnaService service;
		
		/*전체 리스트 조회*/
		@RequestMapping("/list.do")
		public void list(Model model) throws Exception {
			Map<String, Object> result = service.list();
			model.addAttribute("list", result.get("lists"));
		}	
		/*상세조회*/
		@RequestMapping("/detail.do")
		public void detail(Model model, int qnaNo) throws Exception {
			model.addAttribute("detail",service.detail(qnaNo));
		}
		/*등록*/
		@RequestMapping("/writeform.do")
		public void writeform() throws Exception{}
		
		@RequestMapping("/write.do")
		public String write(Qna qna,MultipartFile attach) throws Exception{
			service.write(qna);
			attach.transferTo(new File("c:/bit2019/upload/"+attach.getOriginalFilename()));
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
		}
		
}
