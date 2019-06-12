package kr.co.flyingturtle.edu.user.memo.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoService {

	/* 임시저장메모 리스트 조회 */
	List<Memo> selectNonSaveMemo(int memberNo) throws Exception;

}
