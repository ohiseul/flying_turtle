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
	
	// 과목선택 저장(임시 -> 저장메모)
	public void updateMemoSbj(Memo memo) {
		mapper.updateMemoSbj(memo);
	}
	
	// 메모 조회
	public List<Memo> selectMemoList(Memo memo) {
		return mapper.selectMemoList(memo);
	}
	
	// 과목 조회
	public List<Memo> selectMemoSbj(int memberNo) {
		return mapper.selectMemoSbj(memberNo);
	}

	// 메모 등록
	public int insertMemo(Memo memo) {
		System.out.println("저장탭 메모 추가 SERVICE");
		mapper.insertMemo(memo);
		return memo.getMemoNo();
	}
	
	// 메모 수정
	public void updateMemo(Memo memo) {
		mapper.updateMemo(memo);
	}
	
	// 메모 삭제
	public void deleteMemo(int memoNo) {
		mapper.deleteMemo(memoNo);
	}
	
	
	


}
