package kr.co.flyingturtle.edu.user.dictionary.service;

import kr.co.flyingturtle.repository.vo.Dictionary;

public interface DictionaryService {
	
	// 조회
	Dictionary selectDicWord(int dicNo);
	
	// 최초 등록 + 전체 리스트 반환
	Dictionary insertDicWord(Dictionary dic);
	
	// 등록
	void updateDicWord(Dictionary dic);
	
}
