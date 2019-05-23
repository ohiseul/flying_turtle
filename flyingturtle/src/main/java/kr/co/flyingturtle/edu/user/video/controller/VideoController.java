package kr.co.flyingturtle.edu.user.video.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.user.video.service.VideoService;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.Video;
import kr.co.flyingturtle.repository.vo.VideoCom;

@Controller("kr.co.flyingturtle.edu.user.video.controller")
@RequestMapping("/user/video")
public class VideoController {
	
	@Autowired	
	public VideoService service;
	
	/**과목 리스트 */
    @RequestMapping("/menulist.do")
    @ResponseBody
    public List<Video> menuList() throws Exception {
        System.out.println("로딩 --------- 용어 메뉴 목록 가져오기");
        return service.listSub();	
    }

	/** 과목 등록  */
	@RequestMapping("/subjectwrite.do")
	@ResponseBody
	public int subjectWrite(Video video) throws Exception{
		System.out.println("과목등록 와라");
		int no = service.subjectWrite(video);
		System.out.println("등록 번호 :"+no);
		return no;
	}

	/**과목이름 등록 및 수정*/
	@RequestMapping("/subjectupdate.do")
	@ResponseBody
	public void subjectUpdate(Video video) throws Exception{
		System.out.println("과목수정 와라"+video.getSubjectName()+video.getSubjectNo());
		service.subjectUpdate(video);
	}
	/*리스트*/
	@RequestMapping("/list.do")
	public void videolist(Model model,Video video) throws Exception {
		System.out.println("과목번호 가지러 리스트"+video.getSubjectNo());
		if(video.getSubjectNo()==0) {
			video.setSubjectNo(1);
		}
		Map<String, Object> result = service.list(video);
		model.addAttribute("lists",result.get("list"));	
		model.addAttribute("page",result.get("page"));
		model.addAttribute("sbjList", result.get("sbj"));
	}	
	
   /*리스트의 주소를 얻어오기 위한 메소드*/
   @RequestMapping("/listaddr.do")
   @ResponseBody
   public List<Video> Addr() throws Exception{
	   System.out.println("리스트 주소 가지러 옴");
	   return service.listAddr();
   }
	
	
	/*등록화면*/
	@RequestMapping("/write.do")
	public void writefrom() throws Exception{
	}
	
	@RequestMapping("/videowrite.do")
	@ResponseBody
	public void write(Video video) throws Exception{
			service.write(video);
	}
	/*수정글 하나 가져오기*/
	@RequestMapping("/updateform.do")
	@ResponseBody
	public Video updateform(int videoNo) throws Exception{
		System.out.println("글하나 컨트롤러");
		return service.updateform(videoNo);
	}
	/*수정*/
	@RequestMapping("/update.do")
	@ResponseBody
	public void update(Video video) throws Exception{
		System.out.println("수정 컨트롤러");
		service.update(video);
	}
	/*삭제*/	
	@RequestMapping("/delete.do")
	public String delete(int videoNo) throws Exception{
		System.out.println("삭제 컨트롤러");
		service.delete(videoNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	/*상세조회*/
	@RequestMapping("/detail.do")
	public void detail(Model model, int videoNo) throws Exception {
		Map<String, Object> result = service.detail(videoNo);
		model.addAttribute("detail",result.get("detail"));	
		model.addAttribute("sbjList", result.get("sbj"));
	}
	
	
//댓글=========================================================================================
	
	   /*댓글 리스트 조회*/
	   @RequestMapping("/commentlist.do")
	   @ResponseBody
	   public List<VideoCom> listCom(int videoNo) throws Exception{
		   System.out.println(videoNo + "번 들어옴 : 댓글 리스트 컨트롤러 시작");
		   return service.listCom(videoNo);
	   }	
	   
	   /*댓글  등록*/
	   @RequestMapping("/commentwrite.do")
	   @ResponseBody
	   public void writeCom(VideoCom videoCom,int videoNo) throws Exception{
			System.out.println("댓글 등록 컨트롤러 시작");
		   videoCom.setVideoNo(videoNo);
		   service.writeCom(videoCom);
		   System.out.println("댓글 등록 컨트롤러 끝");
	   }	
	   
	   /*댓글  상세보기*/
	   @RequestMapping("/commentupdateform.do")
	   @ResponseBody
	   public VideoCom updateCom(int comNo) throws Exception{
		   return service.updateComDetail(comNo);
	   }
	   
	   /*댓글  수정*/
	   @RequestMapping("/commentupdate.do")
	   @ResponseBody
	   public void updateCom(VideoCom videoNo) throws Exception{
		   System.out.println(videoNo+": 수정할 번호 들어옴");
		   service.updateCom(videoNo);
		   
	   }
	     
	   /*댓글  삭제*/
	   @RequestMapping("/commentdelete.do")
	   @ResponseBody
	   public void deleteCom(int comNo) throws Exception{
		   service.deleteCom(comNo);
	   }
	   
}
