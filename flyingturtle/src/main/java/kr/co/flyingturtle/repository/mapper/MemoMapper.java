package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoMapper {
	
	// 임시저장메모 조회
	List<Memo> selectNonSaveMemo(int memberNo);

}
