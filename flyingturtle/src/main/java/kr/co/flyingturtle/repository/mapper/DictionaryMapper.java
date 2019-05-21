package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Dictionary;

public interface DictionaryMapper {
	
	// 용어 사전 조회
	Dictionary selectDicWord(int dicNo);
	
	// 소과목 추가시 용어 사전 생성
	void insertDicWord(Dictionary dic);
	
	// 용어 사전 작성/수정
	void updateDicWord(Dictionary dic);
	
	//과목명 전체 조회
	List<Dictionary> selectListSubject();
	
	//과목명 등록
	void insertSubject(Dictionary dic);
	
	//소과목명 등록
	void insertSmallSubject(Dictionary dic);
	
}
