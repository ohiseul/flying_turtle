package kr.co.flyingturtle.edu.user.video.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.VideoMapper;
import kr.co.flyingturtle.repository.vo.Video;
import kr.co.flyingturtle.repository.vo.VideoCom;

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
	
//댓글=======================================================================
	
			/*댓글 전체조회*/
			public List<VideoCom> listCom(int videoNo) throws Exception{
				return mapper.listCom(videoNo);
			}
			/*댓글등록*/
			public void writeCom(VideoCom videoNo) {
				mapper.insertCom(videoNo);
			}
			/*댓글수정*/
			public void updateCom(VideoCom videoNo) {
				mapper.updateCom(videoNo);
			}

			/*댓글삭제*/
			public void deleteCom(int comNo) {
				mapper.deleteCom(comNo);
			}
			/*댓글 하나조회*/
			public VideoCom updateComDetail(int comNo) {
				return mapper.selectComByNo(comNo);
			}
}
