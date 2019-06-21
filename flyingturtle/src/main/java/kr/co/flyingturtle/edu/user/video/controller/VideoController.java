package kr.co.flyingturtle.edu.user.video.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.flyingturtle.edu.user.video.service.VideoService;
import kr.co.flyingturtle.repository.vo.Dictionary;
import kr.co.flyingturtle.repository.vo.Member;
import kr.co.flyingturtle.repository.vo.Video;
import kr.co.flyingturtle.repository.vo.VideoCom;

@Controller("kr.co.flyingturtle.edu.user.video.controller")
@RequestMapping("/user/video")
public class VideoController {
	
	@Autowired	
	public VideoService service;
	
	@Autowired
	public HttpSession session;
	
	/**과목 리스트 */
    @RequestMapping("/menulist.do")
    @ResponseBody
    public List<Video> menuList() throws Exception {
        System.out.println("로딩 --------- 용어 메뉴 목록 가져오기");
        return service.listSub();	
    }

	/** 과목 등록  */
	@RequestMapping("/subjectWrite.do")
	@ResponseBody
	public int subjectWrite(Video video) throws Exception{
		return service.subjectWrite(video);
	}

	/** 과목명 수정 */
	@RequestMapping("/subjectUpdate.do")
	@ResponseBody
	public int subjectUpdate(Video video) throws Exception{
		 int no = service.subjectUpdate(video);
		 return no; 
	}
	
	/*과목 삭제*/
	@RequestMapping("/subjectdelete.do")
	public String subjectDelete(int subjectNo) throws Exception{
		System.out.println("서브젝트no"+ subjectNo);
		service.subjectDelete(subjectNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"list.do";
	}
	
	/*리스트*/
	@RequestMapping("/list.do")
	public void videolist(Model model,Video video) throws Exception {
//		video.setListSize(5);
		
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
	public void write(Video video, HttpSession session) throws Exception{
		Member mem = (Member)session.getAttribute("user");
		video.setMemberNo(mem.getMemberNo());
		System.out.println("등록 컨트롤러로 들어옴");
		System.out.println("제목"+video.getTitle());
		System.out.println("내용"+video.getContent());
		System.out.println("주소"+video.getVideoAddr());
		System.out.println("등록한 멤버번호"+ video.getMemberNo());
		service.write(video);
	}
	
	/*수정글 하나 가져오기*/
	@RequestMapping("/updateform.do")
	public void updateform(Model model, int videoNo) throws Exception{
		System.out.println("수정 폼 컨트롤러 옴");
		System.out.println("수정할 videoNo" + videoNo);
		model.addAttribute("update",service.updateform(videoNo));
	}
	
	/*수정*/
	@RequestMapping("/update.do")
	@ResponseBody
	public int update(Video video) throws Exception{
		System.out.println("수정 컨트롤러");
		System.out.println("수정할 video내용" + video.getContent());
		System.out.println("수정할 video주소" + video.getVideoAddr());
		System.out.println("수정할 video번호" + video.getVideoNo());
		service.update(video);
		int no = video.getSubjectNo();
		return no;
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
		VideoCom videoCom = new VideoCom();
		
	   /*댓글 리스트 조회*/
	   @RequestMapping("/commentlist.do")
	   @ResponseBody
	   public List<VideoCom> listCom(int videoNo) throws Exception{
		   System.out.println(videoNo + "번 들어옴 : 댓글 리스트 컨트롤러 시작");
		   Member mem = (Member)session.getAttribute("user");
		   videoCom.setMemberNo(mem.getMemberNo());
		   return service.listCom(videoNo);
	   }	
	   
	   /*댓글  등록*/
	   @RequestMapping("/commentwrite.do")
	   @ResponseBody
	   public void writeCom(VideoCom videoCom, int videoNo) throws Exception{
			System.out.println("댓글 등록 컨트롤러 시작");
			Member mem = (Member)session.getAttribute("user");
			videoCom.setMemberNo(mem.getMemberNo());
		    videoCom.setVideoNo(videoNo);
		    videoCom.setComContent(videoCom.getComContent());
		    System.out.println("넘겨준 videoNo:" + videoNo);
		    System.out.println("넘겨준 memberNo:"+ mem.getMemberNo());
		    System.out.println("넘겨준 내용:"+ videoCom.getComContent());
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
