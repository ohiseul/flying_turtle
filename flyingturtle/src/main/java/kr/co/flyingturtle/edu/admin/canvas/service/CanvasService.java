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
	/**이미지 리스트*/
	Map<String, Object> listCanvas(Canvas canvas);
	/**이미지 상세*/
	Map<String, Object> detailCanvas(int canNo);
	/**이미지 캔버스 하나 생성*/
	int writeCanvas(Canvas canvas);
	/**상세 페이지에서 이미지 수정*/
	void updateCanvas(Canvas canvas);
	/**이미지 삭제*/
	void deleteCanvas(int canNo);
	/**과목에 따른 이미지 갯수*/
	int count(int ssbjNo);
	/**과목번호에 해당하는 이름 가져오기 파일경로 생성시 이름으로 저장하기 위해서 */
	Canvas getSbjName(int sbjNo);
	/**과목번호에 해당하는 이름 가져오기 소과목 */
	Canvas getSsbjName(int ssbjNo);
}
