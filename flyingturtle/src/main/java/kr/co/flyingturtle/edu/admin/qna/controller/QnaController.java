package kr.co.flyingturtle.edu.admin.qna.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.user.qna.service.QnaService;
import kr.co.flyingturtle.repository.vo.Answer;
import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;

@Controller("kr.co.flyingturtle.edu.admin.qna.controller")
@RequestMapping("/admin/qna")
public class QnaController {
		
	@Autowired
	public QnaService service;

//문의==========================================================================		
	/* 전체 리스트 조회 */
	@RequestMapping("/list.do")
	public void list(Model model, Page page) throws Exception {
		Map<String, Object> result = service.list(page);
		model.addAttribute("list", result.get("lists"));
		model.addAttribute("page", result.get("page"));
	}

	/* 상세조회 */
	@RequestMapping("/detail.do")
	public void detail(Model model, Qna qna) throws Exception {
		Map<String, Object> result = service.detail(qna);
		model.addAttribute("listAsws", result.get("listAsw"));
		model.addAttribute("detail", result.get("detail"));
		model.addAttribute("file", result.get("files"));
		model.addAttribute("aswNo", result.get("aswNos"));
		

	}

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

	/* 등록 */
	@RequestMapping("/writeform.do")
	public void writeform() throws Exception {
	}

	/*
	 * 파일 그룹번호 조회 파일 VO에 조회한 그룹번호 set 파일 등록(파일이 여러개일경우 반복 처리) 글 VO 에 조회한 그룹번호 set
	 * 글등록
	 */
	@RequestMapping("/write.do")
	public String write(Qna qna) throws Exception {

		if (qna.getAttach().get(0).getSize() == 0) {
			service.write(qna);
		} else {

			UUID uuid = UUID.randomUUID();
			Files files = new Files();
			for (int i = 0; i < qna.getAttach().size(); i++) {
				MultipartFile attach = qna.getAttach().get(i);
				files.setOriName(qna.getAttach().get(i).getOriginalFilename());
				String saveName = uuid + "_" + qna.getAttach().get(i).getOriginalFilename();
				files.setSysName(saveName);
				files.setSize((int) qna.getAttach().get(i).getSize());
				files.setPath("c:/bit2019/upload/");
				// 실제경로에파일저장
				attach.transferTo(new File("c:/bit2019/upload/" + saveName));

				int num = service.groupNo() + 1;
				if (i == 0) {
					files.setFileGroupNo(num);
					qna.setFileGroupNo(num);
				} else {
					files.setFileGroupNo(service.groupNo());
				}
				service.writeFile(files);
			}

			service.write(qna);
		}
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	/* 수정하는 글 가져오기 */
	@RequestMapping("/updateform.do")
	public void updateform(Model model, Qna qna) throws Exception {
		Map<String, Object> result = service.updateForm(qna.getQnaNo());
		model.addAttribute("update", result.get("updates"));

	}

	/* 글수정 */
	@RequestMapping("/update.do")
	public String update(Qna qna) throws Exception {

		if (qna.getAttach().get(0).getSize() == 0) {
			service.update(qna);
		} else {

			UUID uuid = UUID.randomUUID();
			Files files = new Files();
			for (int i = 0; i < qna.getAttach().size(); i++) {
				MultipartFile attach = qna.getAttach().get(i);
				attach.transferTo(new File("c:/bit2019/upload/" + attach.getOriginalFilename()));
				files.setOriName(qna.getAttach().get(i).getOriginalFilename());
				String saveName = uuid + "_" + qna.getAttach().get(i).getOriginalFilename();
				files.setSysName(saveName);
				files.setSize((int) qna.getAttach().get(i).getSize());
				files.setPath("c:/bit2019/upload/");
				if(qna.getFileGroupNo()==0) {
					int num = service.groupNo() + 1;
					if (i == 0) {
						files.setFileGroupNo(num);
						qna.setFileGroupNo(num);
					} else {
						files.setFileGroupNo(service.groupNo());
					}
					service.writeFile(files);
				}
				files.setFileGroupNo(qna.getFileGroupNo());
				qna.setFileGroupNo(qna.getFileGroupNo());
				service.updateFile(files);
			}
			service.update(qna);
		}
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	/* 삭제 */
	@RequestMapping("/delete.do")
	public String delete(Qna qna) throws Exception {

		service.delete(qna);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

//댓글=========================================================================================
	/* 댓글 리스트 조회 */
	@RequestMapping("/commentlist.do")
	@ResponseBody
	public List<QnaCom> listCom(int qnaNo) throws Exception {
		return service.listCom(qnaNo);
	}

	/* 댓글 등록 */
	@RequestMapping("/commentwrite.do")
	@ResponseBody
	public void writeCom(QnaCom qnaCom, int qnaNo) throws Exception {
		qnaCom.setQnaNo(qnaNo);
		service.writeCom(qnaCom);
	}

	/* 댓글 상세보기 */
	@RequestMapping("/commentupdateform.do")
	@ResponseBody
	public QnaCom updateCom(int comNo) throws Exception {
		return service.updateComDetail(comNo);
	}

	/* 댓글 수정 */
	@RequestMapping("/commentupdate.do")
	@ResponseBody
	public void updateCom(QnaCom qnaCom) throws Exception {

		service.updateCom(qnaCom);

	}

	/* 댓글 삭제 */
	@RequestMapping("/commentdelete.do")
	@ResponseBody
	public void deleteCom(int comNo) throws Exception {
		service.deleteCom(comNo);
	}

//답변============================================================================================
	/* 수정할 글 가져오기 */
	@RequestMapping("/aswdetail.do")
	@ResponseBody
	public Answer detailAsw(int aswNo) throws Exception {
		return service.detailAsw(aswNo);

	}

	/* 문의 등록 */
	@RequestMapping("/aswwrite.do")
	public String writeAsw(Answer answer) throws Exception {

		service.writeAsw(answer);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "detail.do?qnaNo="+answer.getQnaNo()+"&fileGroupNo="+answer.getFileGroupNo();
	}

	/* 글수정 */
	@RequestMapping("/aswupdate.do")
	public String updateAsw(Answer answer) throws Exception {

		service.updateAsw(answer);

		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "detail.do?qnaNo="+answer.getQnaNo()+"&fileGroupNo="+answer.getFileGroupNo();
	}

	/* 삭제 */
	@RequestMapping("/aswdelete.do")
	public void deleteAsw(Answer answer) throws Exception {
		service.deleteAsw(answer);
	}
	   
}


