package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoMapper {
	
	// 임시 메모 리스트 조회
	List<Memo> selectNonSaveMemo(int memberNo);
	
	// 임시 메모 수정
	void updateNonSaveMemo(Memo memo);
	
	// 과목 조회(공통)
	List<Memo> selectMemoSbj(int memberNo);
	
	// 메모 삭제(공통)
	void deleteMemo(int memoNo);
	
	// 메모 등록 (generatedKey로 바로 화면 구현 필요)
	void insertMemo(Memo memo);
	
	
	

}
