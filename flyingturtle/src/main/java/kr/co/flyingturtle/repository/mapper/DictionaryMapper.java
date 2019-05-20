package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Dictionary;

public interface DictionaryMapper {
	
	// 조회
	Dictionary selectDicWord(int dicNo);
	
	// 최초 등록
	void insertDicWord(Dictionary dic);
	
	// 등록
	void updateDicWord(Dictionary dic);
	
	//과목명 전체 조회
	List<Dictionary> selectListSubject();
}
