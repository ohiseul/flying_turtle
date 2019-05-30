package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoMapper {
	public List<Memo> selectMemo();
	public void insertMemo(Memo memo);
	public void updateMemo(Memo memo);
	public void deleteMemo(String id);
}
