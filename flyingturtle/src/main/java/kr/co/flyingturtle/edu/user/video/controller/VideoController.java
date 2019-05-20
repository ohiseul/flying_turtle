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
import kr.co.flyingturtle.repository.vo.Video;

@Controller("kr.co.flyingturtle.edu.user.video.controller")
@RequestMapping("/user/video")
public class VideoController {
	
	@Autowired	
	public VideoService service;
	
	@RequestMapping("/list.do")
	public void list() throws Exception {}	
	
	/*리스트*/
	@RequestMapping("/videolist.do")
	@ResponseBody
	public List<Video> videolist() throws Exception {
		return service.list();
	}	
	/*등록*/
	@RequestMapping("/write.do")
	@ResponseBody
	public String write(Video video) throws Exception{
			service.write(video);
			System.out.println(video.getContent());
			System.out.println(video.getTitle());
			System.out.println(video.getVideoAddr());
			  return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"video.html";
	}
	/*글 하나 가져오기*/
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
	@ResponseBody
	public void delete(int videoNo) throws Exception{
		System.out.println("삭제 컨트롤러");
		service.delete(videoNo);
	}
	
	
	/*상세조회*/
	@RequestMapping("/detail.do")
	public void detail(Model model, int videoNo) throws Exception {
		Map<String, Object> result = service.detail(videoNo);
		model.addAttribute("detail",result.get("detail"));	
	}
	
}
