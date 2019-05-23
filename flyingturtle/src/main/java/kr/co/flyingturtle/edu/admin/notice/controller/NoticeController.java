package kr.co.flyingturtle.edu.admin.notice.controller;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.user.notice.service.NoticeService;
import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;
@Controller("kr.co.flyingturtle.edu.admin.notice.controller")
@RequestMapping("/admin/notice")			
public class NoticeController {
	
	@Autowired	
	public NoticeService service;
	
//	전체조회
	@RequestMapping("/list.do")
	public void list(Page page, Model model	) throws Exception {
		System.out.println("list.do - Controller 호출");
		Map<String, Object> map = service.list(page);
		model.addAttribute("page",map.get("page"));
		model.addAttribute("keyword",map.get("keyword"));
		model.addAttribute("searchType",map.get("searchType"));
		model.addAttribute("lists", map.get("lists"));
	}
	
//	등록
	@RequestMapping("/writeform.do")
	public void writeform() throws Exception{}
	
	@RequestMapping("/write.do")
	public String write(Notice notice) throws Exception{
		System.out.println("등록 옴");
		if(notice.getAttach().get(0).getSize()==0) {
			
			service.write(notice);
		}else {
			
		UUID uuid = UUID.randomUUID();
		Files files = new Files(); 
			for(int i =0; i<notice.getAttach().size() ; i++) {
				System.out.println("왔나????????????");
				MultipartFile attach = notice.getAttach().get(i);
				files.setOriName(notice.getAttach().get(i).getOriginalFilename());	
				String saveName = uuid + "_" + notice.getAttach().get(i).getOriginalFilename();

				files.setSysName(saveName);	
				files.setSize((int) notice.getAttach().get(i).getSize());	
				files.setPath("c:/bit2019/upload/");
				//실제경로에파일저장
				attach.transferTo(new File("c:/bit2019/upload/"+saveName));		
				
				int num = service.groupNo()+1;
					if(i==0) {
					files.setFileGroupNo(num);
					notice.setFileGroupNo(num);						
					}else {
						files.setFileGroupNo(service.groupNo());	
					}
					System.out.println("왔니?222");
					service.writeFile(files);
			}
		}
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
