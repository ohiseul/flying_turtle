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
//	소과목 삭제
	public void smallSubjectDelete(int ssbjNo) {
		mapper.deleteSmallSubject(ssbjNo);
	}

//이미지================================================
	public Map<String, Object> listCanvas(Page page,int ssbjNo) {
		Map<String, Object> result = new HashMap<>();
		result.put("page",new PageResult(page.getPageNo(),mapper.selectCount(ssbjNo)));
		result.put("lists", mapper.selectCanvas(page));
		System.out.println("DB::: "+result.toString());
		return result;
	}
	public Map<String, Object> detailCanvas(int canNo) {
		Map<String, Object> result = new HashMap<>();
		result.put("lists", mapper.selectCanvasByNo(canNo));
		return result;
	}
	public int writeCanvas(Canvas canvas) {
		mapper.insertCanvas(canvas);
		return canvas.getCanNo();
		
	}
	public void updateCanvas(Canvas canvas) {
		mapper.updateCanvas(canvas);
	}
	public void deleteCanvas(int canNo) {
		mapper.deleteCanvas(canNo);
		
	}
	public int count(int ssbjNo){
		return mapper.selectCount(ssbjNo);
	}
	
//임시저장====================================================
	public int writeTem(Canvas canvas) {
		mapper.insertTem(canvas);
		return canvas.getSaveNo();
		
	}
	public Canvas detailTem(int saveNo) {
		return mapper.selectTemByNo(saveNo);

	}
	public void updateTem(Canvas canvas) {
		mapper.updateTem(canvas);
		
	}
	public void deleteTem(int saveNo) {
		mapper.deleteTem(saveNo);
	}



	
	
}
