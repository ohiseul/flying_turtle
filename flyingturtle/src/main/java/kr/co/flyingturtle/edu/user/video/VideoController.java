package kr.co.flyingturtle.edu.user.video;

import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.repository.vo.Video;


public class VideoController {

	@RequestMapping("user/video/videowrite.do")
	public String write(Video video) throws Exception{
		System.out.println("왔어");
		return video.getVideoAddr();
	}
}
