package kr.co.flyingturtle.edu.admin.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.admin.notice.service.NoticeService;
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
		Map<String, Object> result = service.list(page);
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
	public void detail(Notice notice, Model model)throws Exception {
		Map<String, Object> result = service.detail(notice);
		model.addAttribute("detail",result.get("detail"));
		model.addAttribute("file",result.get("files"));
	    model.addAttribute("paging",result.get("paging")); 
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
	public void downFile(int fileGroupNo, int fileNo, HttpServletResponse response) throws Exception {
		System.out.println("다운로드 옴");

		List<Files> files = service.listFile(fileGroupNo);
		System.out.println("files:" + files);
		for (Files f1 : files) {
			if (f1.getFileNo() == fileNo) {
				String path = f1.getPath();
				String name = f1.getSysName();
				// 다운로드 할 파일 이름
				String dName = f1.getOriName();
				
				System.out.println("path : " + path);
				System.out.println("name : " + name);
				
				File f = new File(path, name);
				
				// 전송하는 데이터의 해석 정보
				if (dName == null) {
					response.setHeader("Content-Type", "image/jpg");
				} else {
					response.setHeader(
						"Content-Type", "application/octet-stream"
					);
					
					// 한글 이름 처리하기
					dName = new String(dName.getBytes("utf-8"), "8859_1");

					response.setHeader(
						"Content-Disposition", "attachment;filename=" + dName
					);
				}
				
				// 파일을 읽고 사용자에게 전송
				FileInputStream fis = new FileInputStream(f);
				BufferedInputStream bis = new BufferedInputStream(fis);
				
				OutputStream out = response.getOutputStream();
				BufferedOutputStream bos = new BufferedOutputStream(out);
			
				while (true) {
					int ch = bis.read();
					if (ch == -1) break;
					
					bos.write(ch);
				}
				
				bis.close();  fis.close();
				bos.close();  out.close();
				
				
				
				
			}
		}

	}

}
