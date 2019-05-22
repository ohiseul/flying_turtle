package kr.co.flyingturtle.edu.user.dictionary.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Dictionary;

public interface DictionaryService {
	
	// 과목명 조회
	Map<String, Object> list();
	
	//과목명 등록
	int subjectWrite(Dictionary dic);
	
	//소과목 등록
	int smallSubjectWrite(Dictionary dic);
	
	// 소과목 수정
	void smallSubjectUpdate(Dictionary dic);
		
// ==== 용어사전 =========================================================

	// 용어사전 조회
	Dictionary selectDicWord(int ssbjNo);
	
	// 용어사전 최초 등록
//	Dictionary insertDicWord(Dictionary dic);
	
	// 용어사전 수정
	void updateDicWord(Dictionary dic);
	
	
	
}
