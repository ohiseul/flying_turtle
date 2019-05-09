package kr.co.flyingturtle.edu.qna.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.qna.service.QnaService;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;

@Controller
@RequestMapping("/qna")
public class QnaController {
		
		@Autowired	
		public QnaService service;
		
		/*전체 리스트 조회*/
		@RequestMapping("/list.do")
		public void list(Model model) throws Exception {
			System.out.println("list.do - Controller 호출");
			Map<String, Object> result = service.list();
			model.addAttribute("list", result.get("lists"));
		}
		/*댓글 리스트 조회*/
	   @RequestMapping("/commentlist.do")
	   @ResponseBody
	   public List<QnaCom> listCom(int qnaNo) throws Exception{
	      return service.listCom(qnaNo);
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
		/*수정*/
		@RequestMapping("/updateform.do")
		public void updateform(Model model, int qnaNo) throws Exception{			
			model.addAttribute("update",service.detail(qnaNo));
		}
		
		@RequestMapping("/update.do")
		public String update(Qna qna,MultipartFile attach) throws Exception{
			service.update(qna);
		//	attach.transferTo(new File("c:/bit2019/upload/"+attach.getOriginalFilename()));			
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
		}
		/*삭제*/
	   @RequestMapping("/delete.do")
	   public String delete(int qnaNo) throws Exception {
	      service.delete(qnaNo);
	      return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	   }

}

