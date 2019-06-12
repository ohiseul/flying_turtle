package kr.co.flyingturtle.edu.user.memo.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoService {
	
	/* 임시 메모 리스트 조회 */
	List<Memo> selectNonSaveMemo(int memberNo) throws Exception;

	/* 임시 메모 수정 */
	void updateNonSaveMemo(Memo memo);
	
	/* 과목 조회(공통) */
	List<Memo> selectMemoSbj(int memberNo);
	
	/* 메모 삭제(공통) */
	void deleteMemo(int memoNo);
	
	/* 메모 등록(공통) */
	void insertMemo(Memo memo);
	
	
	
}
