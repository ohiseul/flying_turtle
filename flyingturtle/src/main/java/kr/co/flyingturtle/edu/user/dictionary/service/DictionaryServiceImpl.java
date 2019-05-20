package kr.co.flyingturtle.edu.user.dictionary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.DictionaryMapper;
import kr.co.flyingturtle.repository.vo.Dictionary;

@Service
public class DictionaryServiceImpl implements DictionaryService {
	
	@Autowired
	private DictionaryMapper mapper;

	@Override
	public Dictionary selectDicWord(int dicNo) {
		return mapper.selectDicWord(dicNo);
	};
	
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
