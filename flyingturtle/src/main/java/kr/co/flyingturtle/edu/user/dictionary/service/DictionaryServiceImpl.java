package kr.co.flyingturtle.edu.user.dictionary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.DictionaryMapper;
import kr.co.flyingturtle.repository.vo.Dictionary;

@Service
public class DictionaryServiceImpl implements DictionaryService {
	
	@Autowired
	private DictionaryMapper mapper;
	
	/** 전체 과목리스트  불러오기  */
	@Override
	public Map<String, Object> list() {
		System.out.println("전체 메뉴 목록 가져오기!");
		Map<String, Object> map = new HashMap<>();
		map.put("sbj", mapper.selectListSubject());
		map.put("ssbj", mapper.selectListSmallSub());
		return map;
	}
	
	/** 과목명 등록  */
	public int subjectWrite(Dictionary dic) {
		System.out.println("등록");
		mapper.insertSubject(dic);
		return dic.getSbjNo();
	}
	
	/** 소과목 추가시 용어사전 생성	*/
	public int smallSubjectWrite(Dictionary dic) {
		System.out.println("소과목 등록");
		mapper.insertSmallSubject(dic);
		System.out.println(dic.getSsbjNo()+ "?????????????");
		return dic.getSsbjNo();
	}
	
	@Override
	public Dictionary insertDicWord(Dictionary dic) {
		mapper.insertDicWord(dic);
		// 등록 후 바로 pk 추출
		return mapper.selectDicWord(dic.getDicNo());
	};
	
	/** 용어사전 내용 등록/수정	*/
	@Override
	public void updateDicWord(Dictionary dic) {
	}
	
	
	
	
	
	
	
	
}
