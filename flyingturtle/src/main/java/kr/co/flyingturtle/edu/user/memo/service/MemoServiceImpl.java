package kr.co.flyingturtle.edu.user.memo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.MemoMapper;
import kr.co.flyingturtle.repository.vo.Memo;

@Service
public class MemoServiceImpl implements MemoService{

	@Autowired
	private MemoMapper mapper;
	
	// 임시 메모 조회
	public List<Memo> selectNonSaveMemo(int memberNo) throws Exception {
		return mapper.selectNonSaveMemo(memberNo);
	}
	
	// 임시 메모 등록
	public void insertMemo(Memo memo) {
		mapper.insertMemo(memo);
	}
	
	// 임시 메모 수정
	public void updateNonSaveMemo(Memo memo) {
		mapper.updateNonSaveMemo(memo);
	}
	
	// 메모 과목 조회(공통)
	public List<Memo> selectMemoSbj(int memberNo) {
		return mapper.selectMemoSbj(memberNo);
	}

	// 메모 삭제(공통)
	public void deleteMemo(int memoNo) {
		mapper.deleteMemo(memoNo);
	}
	
	


}
