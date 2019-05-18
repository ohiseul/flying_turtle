package kr.co.flyingturtle.edu.user.video.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Video;


public interface VideoService {
	/* 리스트 가져오기*/
	List<Video> list() throws Exception;
	/*상세*/
	Video updateform(int videoNo) throws Exception;
	/*등록*/
	void write(Video video) throws Exception;
	/*수정*/
	void update(Video video) throws Exception;
	/*삭제*/
	public void  delete(int videoNo) throws Exception;
	
	/*상세글정보 가져오기*/
	Map<String, Object> detail(int qnaNo) throws Exception;
	
}
