package kr.co.flyingturtle.edu.user.video.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.VideoMapper;
import kr.co.flyingturtle.repository.vo.Video;

@Service
public class VideoServiceImpl implements VideoService{
	
	@Autowired
	
	private VideoMapper mapper;

	public List<Video> list() throws Exception {

		return mapper.selectList();
	}


	public Video updateform(int videoNo) throws Exception {
		return mapper.selectByNo(videoNo);
	}


	public void write(Video video) throws Exception {
		mapper.insert(video);
	}


	public void update(Video video) throws Exception {
		mapper.update(video);
	}


	public void delete(int videoNo) throws Exception {		
		mapper.delete(videoNo);
	}

	public Map<String, Object> detail(int videoNo) throws Exception{
		Map<String, Object> result = new HashMap<>();
		result.put("detail", mapper.selectByNo(videoNo));
		return result;
	}
}
