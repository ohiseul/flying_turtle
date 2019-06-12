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
	
	// 임시저장메모 조회
	public List<Memo> selectNonSaveMemo(int memberNo) throws Exception {
		System.out.println("임시저장메모 service");
		List<Memo> m = mapper.selectNonSaveMemo(memberNo);
		System.out.println(m.size());
		return mapper.selectNonSaveMemo(memberNo);
	}


}
