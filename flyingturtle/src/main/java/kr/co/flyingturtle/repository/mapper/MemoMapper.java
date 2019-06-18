package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoMapper {
	
	// 임시 -> 저장 (과목선택시)
	void updateMemoSbj(Memo memo);
	
	// 메모 조회
	List<Memo> selectMemoList(Memo memo);

	// 과목 조회
	List<Memo> selectMemoSbj(int memberNo);
	
	// 메모 등록
	int insertMemo(Memo memo);
	
	// 메모 수정
	void updateMemo(Memo memo);
	
	// 메모 수정 후 조회
	Memo selectEditDate(int memoNo);
	
	// 메모 삭제
	void deleteMemo(int memoNo);
}
