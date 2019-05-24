package kr.co.flyingturtle.edu.admin.dictionary.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Dictionary;

public interface DictionaryService {
	//과목명 조회
	Map<String, Object> list();

	//과목명 등록 + 리스트 반환
	int subjectWrite(Dictionary dic);
	
	//과목명 수정
	int subjectUpdate(Dictionary dic);
	
	//소과목 등록
	int smallSubjectWrite(Dictionary dic);
	
	//소과목 삭제
	void smallSubjectDelete(Dictionary dic);
	// 조회
//	Dictionary selectDicWord(int dicNo);
	
	// 최초 등록
//	Dictionary insertDicWord(Dictionary dic);
	
	// 두번째 등록부터는 덮어씌우기 > 수정
//	void updateDicWord(Dictionary dic);
	
	
}
