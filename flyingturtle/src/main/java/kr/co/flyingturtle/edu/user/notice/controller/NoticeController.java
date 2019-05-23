package kr.co.flyingturtle.edu.user.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.user.notice.service.NoticeService;
import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Page;
@Controller
@RequestMapping("/user/notice")
public class NoticeController {
	
	@Autowired	
	public NoticeService service;
	
//	전체조회
	@RequestMapping("/list.do")
	public void list(Page page, Model model	) throws Exception {
		System.out.println("list.do - Controller 호출");
		Map<String, Object> result = service.list(page);
		System.out.println(result.get("keyword"));
		System.out.println(result.get("searchType"));
		model.addAttribute("page",result.get("page"));
		model.addAttribute("lists", result.get("lists"));
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
		System.out.println("상세조회 왔습니다.");
		Map<String, Object> result = service.detail(no);
		model.addAttribute("detail",result.get("detail"));
		model.addAttribute("files",result.get("files"));
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

	
	
//	======================파일=======================
	@RequestMapping("/downFile.do")
	public void downFile(int fileGroupNo,int fileNo, HttpServletResponse response) throws Exception{
		
		List<Files> files = service.listFile(fileGroupNo);
		for(Files f : files ) {
			if(f.getFileNo()== fileNo) {
				
				response.setContentType("image/jpg");
				
				OutputStream out = response.getOutputStream();
				BufferedOutputStream bos = new BufferedOutputStream(out);
				
				FileInputStream fis = new FileInputStream(
						"c:/bit2019/upload/"+f.getSysName()
						);
				BufferedInputStream bis = new BufferedInputStream(fis);
				
				
				response.setContentType("application/octet-stream");

				response.setContentLength(f.getSize());

				response.setHeader("Content-Disposition",

						"attachment; fileName=\"" + URLEncoder.encode(f.getSysName(), "UTF-8") + "\";");

				response.setHeader("Content-Transfer-Encoding", "binary");
				
				while (true) {
					int ch = bis.read();
					if (ch == -1) break;
					
					bos.write(ch);
				}
				
				bis.close();  bos.close();
				fis.close();  out.close();
			}
		}
	
	}

}
