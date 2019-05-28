package kr.co.flyingturtle.edu.admin.canvas.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Canvas;

public interface CanvasService {
	//과목명 조회
	Map<String, Object> list();

	//과목명 등록 + 리스트 반환
	int subjectWrite(Canvas canvas);
	
	//과목명 수정
	int subjectUpdate(Canvas canvas);
	
	//소과목 등록
	int smallSubjectWrite(Canvas canvas);
	
	//소과목 삭제
	void smallSubjectDelete(int ssbjNo);
}
