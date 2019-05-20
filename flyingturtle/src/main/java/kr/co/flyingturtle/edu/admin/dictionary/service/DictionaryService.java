package kr.co.flyingturtle.edu.admin.dictionary.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Dictionary;

public interface DictionaryService {
	//과목명 조회
	List<Dictionary> list();
	
	
	// 조회
//	Dictionary selectDicWord(int dicNo);
	
	// 최초 등록 + 전체 리스트 반환
	Dictionary insertDicWord(Dictionary dic);
	
	// 등록
	void updateDicWord(Dictionary dic);
	
}
