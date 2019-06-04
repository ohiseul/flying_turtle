package kr.co.flyingturtle.edu.admin.canvas.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Canvas;
import kr.co.flyingturtle.repository.vo.Page;

public interface CanvasService {
//과목메뉴===============================================
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
	
//이미지===============================================

	/**과목번호에 해당하는 이름 가져오기 파일경로 생성시 이름으로 저장하기 위해서 */
	Canvas getSbjName(int sbjNo);
	/**과목번호에 해당하는 이름 가져오기 소과목 */
	Canvas getSsbjName(int ssbjNo);
}
