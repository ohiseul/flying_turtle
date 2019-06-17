package kr.co.flyingturtle.edu.user.memo.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoService {
	
	/* 임시 메모 수정 */
	void updateNonSaveMemo(Memo memo);
	
	/* 과목 선택 저장(임시->저장메모) */
	void updateMemoSbj(Memo memo);
	
	/* 메모 조회(공통) */
	List<Memo> selectMemoList(Memo memo);
	
	/* 과목 조회(공통) */
	List<Memo> selectMemoSbj(int memberNo);
	
	/* 메모 등록(공통) */
	int insertMemo(Memo memo);

	/* 메모 삭제(공통) */
	void deleteMemo(int memoNo);
	
}
