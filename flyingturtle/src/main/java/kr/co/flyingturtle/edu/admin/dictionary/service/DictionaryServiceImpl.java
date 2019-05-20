package kr.co.flyingturtle.edu.admin.dictionary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.DictionaryMapper;
import kr.co.flyingturtle.repository.vo.Dictionary;

@Service
public class DictionaryServiceImpl implements DictionaryService {
	
	@Autowired
	private DictionaryMapper mapper;

	public Dictionary selectDicWord(int dicNo) {
		
		return new Dictionary();
	};
	public void insertDicWord(Dictionary dic) {
		mapper.insertDicWord(dic);
	};
	public void updateDicWord(Dictionary dic) {
		
	};
	
}
