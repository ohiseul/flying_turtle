package kr.co.flyingturtle.edu.admin.dictionary.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.DictionaryMapper;
import kr.co.flyingturtle.repository.vo.Dictionary;

@Service("kr.co.flyingturtle.edu.admin.dictionary.service")
public class DictionaryServiceImpl implements DictionaryService {
	
	@Autowired
	private DictionaryMapper mapper;

//	과목명 조회
	public Map<String, Object> list() {
		Map<String, Object> map = new HashMap<>();
		map.put("sbj", mapper.selectListSubject());
		map.put("ssbj", mapper.selectListSmallSub());
		return map;
		
	}
//	과목명 등록
	public int subjectWrite(Dictionary dic) {
		mapper.insertSubject(dic);
		return dic.getSbjNo();
	}
	
//	과목명 수정
	public int subjectUpdate(Dictionary dic) {
		mapper.updateSubject(dic);
		return dic.getSbjNo();
	}
//	소과목명 등록
	public int smallSubjectWrite(Dictionary dic) {
		mapper.insertSmallSubject(dic);
		return dic.getSsbjNo();
		
	}
//	소과목 삭제
	public void smallSubjectDelete(Dictionary dic) {
		mapper.deleteSmallSubject(dic);
	}
	
	
	
//	@Override
//	public Dictionary selectDicWord(int dicNo) {
//		return mapper.selectDicWord(dicNo);
//	};
//	
//	@Override
//	public Dictionary insertDicWord(Dictionary dic) {
//		mapper.insertDicWord(dic);
//		// 등록 후 바로 pk 추출
//		return mapper.selectDicWord(dic.getDicNo());
//	};
	
//	@Override
//	public void updateDicWord(Dictionary dic) {
//		
//	}

	
	
}
