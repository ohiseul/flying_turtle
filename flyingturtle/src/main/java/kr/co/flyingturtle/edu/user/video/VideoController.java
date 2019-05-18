package kr.co.flyingturtle.edu.user.video;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	/*리스트*/
	@RequestMapping("/videolist.do")
	@ResponseBody
	public List<Video> list() throws Exception{
		   return service.list();
	}	
	/*등록*/
	@RequestMapping("/videowrite.do")
	@ResponseBody
	public String write(Video video) throws Exception{
			service.write(video);
			System.out.println(video.getContent());
			System.out.println(video.getTitle());
			System.out.println(video.getVideoAddr());
			  return UrlBasedViewResolver.REDIRECT_URL_PREFIX+"video.html";
	}
	/*글 하나 가져오기*/
	@RequestMapping("/videoupdateform.do")
	@ResponseBody
	public Video updateform(int videoNo) throws Exception{
		return service.updateform(videoNo);
	}
	/*수정*/
	@RequestMapping("/videoupdate.do")
	@ResponseBody
	public void update(Video video) throws Exception{
		service.update(video);
	}
	/*삭제*/	
	@RequestMapping("/videodelete.do")
	@ResponseBody
	public void delete(int videoNo) throws Exception{
		service.delete(videoNo);
	}
	
}
