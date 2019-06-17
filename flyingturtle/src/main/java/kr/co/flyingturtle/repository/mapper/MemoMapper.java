package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoMapper {
	
	// 임시 메모 리스트 조회
	List<Memo> selectNonSaveMemo(int memberNo);
	
	// 임시메모 등록 + 크롬 복사 등록
	void insertNoneSaveMemo(Memo memo);
	
	// 임시 메모 수정
	void updateNonSaveMemo(Memo memo);
	
	// 임시 -> 저장 (과목선택시)
	void updateMemoSbj(Memo memo);
	
	// 과목 조회(공통)
	List<Memo> selectMemoSbj(int memberNo);
	
	// 메모 삭제(공통)
	void deleteMemo(int memoNo);
	
	
	// 저장메모 조회
	List<Memo> selectSavedMemo(Memo memo);

	// 메모 등록
	int insertMemo(Memo memo);
	
}
