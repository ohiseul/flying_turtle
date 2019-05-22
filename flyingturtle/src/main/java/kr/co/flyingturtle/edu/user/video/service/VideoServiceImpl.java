package kr.co.flyingturtle.edu.user.video.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.VideoMapper;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.PageResult;
import kr.co.flyingturtle.repository.vo.Video;
import kr.co.flyingturtle.repository.vo.VideoCom;

@Service
public class VideoServiceImpl implements VideoService{
	
	@Autowired
	private VideoMapper mapper;
	
	/**과목등록*/
	public int  subjectWrite(Video video) {
		mapper.insertSubject(video);
		return video.getSubjectNo();
		
	}
	/**과목이름 등록 및 수정*/	
	public void subjectUpdate(Video video) {
		mapper.updateSubject(video);
	}
	/**과목 리스트*/
	public List<Video> listSub() {
		return mapper.selectListSubject();
	}
	public Map<String, Object> list(Page page) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("page",new PageResult(page.getPageNo(),mapper.selectCount()));
		result.put("list", mapper.selectListVideo(page));
		result.put("sbj", mapper.selectListSubject());
		return result;
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
		//mapper.viewCntPlus();
		return result;
	}
	/*비디오 주소를 얻어오기 위한 메소드*/
	public List<Video> listAddr(Page page) {
		return mapper.selectListAddr(page);
	}
	
//댓글=======================================================================
	
			/*댓글 전체조회*/
			public List<VideoCom> listCom(int videoNo) throws Exception{
				System.out.println("댓글 조회 매퍼 이동");
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
			/**과목번호에 해당하는 리스트 */
			public List<Video> listSubByNo(int subjectNo) {
				return mapper.selectListSubjectByNo(subjectNo);
			}





}