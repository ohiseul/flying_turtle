package kr.co.flyingturtle.edu.user.memo.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoService {
	
	/* 과목 조회 */
	List<Memo> selectMemoSbj(int memberNo);
	
	/* 과목 생성 */
	Memo insertMemoSbj(Memo memo);
	
	/* 과목 삭제 */
	void deleteMemoSbj(int sbjNo);
	
	/* 과목 선택 저장(임시->저장메모) */
	void updateMemoSbj(Memo memo);
	
	/* 메모 조회 */
	List<Memo> selectMemoList(Memo memo);
	
	/* 메모 등록 */
	Memo insertMemo(Memo memo);
	
	/* 메모 수정 */
	Memo updateMemo(Memo memo);
	
	/* 메모 삭제 */
	void deleteMemo(int memoNo);
	
}
