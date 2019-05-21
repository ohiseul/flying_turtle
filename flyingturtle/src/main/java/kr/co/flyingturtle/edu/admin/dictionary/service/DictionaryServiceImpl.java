package kr.co.flyingturtle.edu.admin.dictionary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.DictionaryMapper;
import kr.co.flyingturtle.repository.vo.Dictionary;

@Service("kr.co.flyingturtle.edu.admin.dictionary.service")
public class DictionaryServiceImpl implements DictionaryService {
	
	@Autowired
	private DictionaryMapper mapper;

//	과목명 조회
	public List<Dictionary> list() {
		
		return mapper.selectListSubject();
	}
//	과목명 등록
	public void subjectWrite(String sbjName) {
		System.out.println("등록");
		mapper.insertSubject(sbjName);
	}
//	소과목명 등록
	public void smallSubjectWrite(Dictionary dic) {
		
		System.out.println("소과목 등록");
		mapper.insertSmallSubject(dic);
		
	}
	
	
//	@Override
//	public Dictionary selectDicWord(int dicNo) {
//		return mapper.selectDicWord(dicNo);
//	};
	
	@Override
	public Dictionary insertDicWord(Dictionary dic) {
		mapper.insertDicWord(dic);
		// 등록 후 바로 pk 추출
		return mapper.selectDicWord(dic.getDicNo());
	};
	
	@Override
	public void updateDicWord(Dictionary dic) {
		
	}

	
	
}
