package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Dictionary;

public interface DictionaryMapper {
	
	// 과목명 전체 조회
	List<Dictionary> selectListSubject();
	
	// 소과목명 전체 조회
	List<Dictionary> selectListSmallSub();
	
	// 과목명 등록
	void insertSubject(Dictionary dic);
    
	//과목명 수정
    void updateSubject(Dictionary dic);
	
	// 소과목명 등록
	void insertSmallSubject(Dictionary dic);
	
	// 소과목명 수정
	void updateSmallSubject(Dictionary dic);
	
	// 소과목명 삭제
	void deleteSmallSubject(Dictionary dic);

// ===== 용어사전 =========================================================
	
	// 용어 사전 조회
	Dictionary selectDicWord(int ssbjNo);
	
	// 소과목 추가시 용어 사전 생성
	void insertDicWord(int ssbjNo);
	
	// 용어 사전 작성/수정
	void updateDicWord(Dictionary dic);
	
	
	
}
