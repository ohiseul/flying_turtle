package kr.co.flyingturtle.edu.user.video.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Dictionary;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.QnaCom;
import kr.co.flyingturtle.repository.vo.Video;
import kr.co.flyingturtle.repository.vo.VideoCom;


public interface VideoService {
	/* 리스트 가져오기*/
	Map<String, Object> list(Video video) throws Exception;
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
	
	/** 과목새롭게 등록*/
	int subjectWrite(Video video);
	/**과목 이름등록 수정*/
	void subjectUpdate(Video video);
	/**과목 주소  가져오기*/
	List<Video> listSub();
	/*비디오 주소를 위한  에이작스*/
	List<Video> listAddr(Page page);


	// 댓글 ============================================
	/*댓글 리스트 가져오기*/
	List<VideoCom> listCom(int videoNo) throws Exception;
	/*댓글 등록*/
	void writeCom(VideoCom VideoCom);
	/*댓글 수정*/
	void updateCom(VideoCom VideoCom);
	/*댓글 삭제*/
	void deleteCom(int comNo);
	/*댓글 상세*/
	VideoCom updateComDetail(int comNo);
}
