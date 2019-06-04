package kr.co.flyingturtle.edu.admin.canvas.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.CanvasMapper;
import kr.co.flyingturtle.repository.vo.Canvas;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.PageResult;


@Service("kr.co.flyingturtle.edu.admin.canvas.service")
public class CanvasServiceImpl implements CanvasService {
	@Autowired
	private CanvasMapper mapper;
	

//	과목명 조회
	public Map<String, Object> list() {
		Map<String, Object> map = new HashMap<>();
		map.put("sbj", mapper.selectListSubject());
		map.put("ssbj", mapper.selectListSmallSub());
		return map;
		
	}
//	과목명 등록
	public int subjectWrite(Canvas canvas) {
		mapper.insertSubject(canvas);
		return canvas.getSbjNo();
	}
	
//	과목명 수정
	public int subjectUpdate(Canvas canvas) {
		mapper.updateSubject(canvas);
		return canvas.getSbjNo();
	}
//	소과목명 등록
	public int smallSubjectWrite(Canvas canvas) {
		mapper.insertSmallSubject(canvas);
		return canvas.getSsbjNo();		
	}
//  소과목명 수정
	public String smallSubjectUpdate(Canvas canvas) {
		mapper.updateSmallSubject(canvas);
		System.out.println("임플 소과목 변경:"+canvas.getSsbjName());
		return canvas.getSsbjName();
	}
//	소과목 삭제
	public void smallSubjectDelete(int ssbjNo) {
		mapper.deleteSmallSubject(ssbjNo);
	}
	/**과목번호에 해당하는 이름 가져오기 파일경로 생성시 이름으로 저장하기 위해서 */
	public Canvas getSbjName(int sbjNo) {
		return mapper.selectSubName(sbjNo);
	}
	/**과목번호에 해당하는 이름 가져오기 소과목 */
	public Canvas getSsbjName(int ssbjNo) {
		return mapper.selectSsubName(ssbjNo);
	}

	
	
}
