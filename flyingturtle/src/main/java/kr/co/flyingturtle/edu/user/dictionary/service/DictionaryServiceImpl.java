package kr.co.flyingturtle.edu.user.dictionary.service;

import java.util.HashMap;
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
	public Map<String, Object> list() 
	{
		System.out.println("전체 메뉴 목록 가져오기!");
		Map<String, Object> map = new HashMap<>();
		map.put("sbj", mapper.selectListSubject());
		map.put("ssbj", mapper.selectListSmallSub());
		return map;
	}
	
	/** 과목명 등록  */
	public int subjectWrite(Dictionary dic) 
	{
		System.out.println("등록");
		mapper.insertSubject(dic);
		System.out.println(dic.getSbjNo());
		return dic.getSbjNo();
	}
	
	/** 과목명 수정  */
	public int subjectUpdate(Dictionary dic) {
		mapper.updateSubject(dic);
		return dic.getSbjNo();
	}
	
	/** 소과목 추가시 용어사전 생성	*/
	public int smallSubjectWrite(Dictionary dic) 
	{
		System.out.println("소과목 추가");
		System.out.println("과목 번호 파라미터 : "+ dic.getSbjNo());
		System.out.println("소과목 명 파라미터 : "+ dic.getSsbjName());
		
		mapper.insertSmallSubject(dic);
		
		System.out.println("등록 후 소과목 번호 : " + dic.getSsbjNo());
		mapper.insertDicWord(dic.getSsbjNo());
		return dic.getSsbjNo();
	}
	
	/** 소과목 수정 */
	public int smallSubjectUpdate(Dictionary dic) 
	{
		System.out.println("소과목 수정 서비스");
		mapper.updateSmallSubject(dic);
		System.out.println(dic.getSsbjNo());
		return dic.getSsbjNo();
		
	}
	
	/** 소과목 삭제 */
	public void smallSubjectDelete(int ssbjNo) {
		mapper.deleteSmallSubject(ssbjNo);
	}
	
	

	
// ==== 용어사전 =========================================================	
	
	/** 용어사전 조회  */
	public Dictionary selectDicWord(int ssbjNo)
	{
		System.out.println("용어사전 조회 - 서비스");
		Dictionary dic = mapper.selectDicWord(ssbjNo);
		System.out.println("db에 있냐??? "+ dic);
		return dic;
	}
	
	/** 용어사전 작성/수정   */
	@Override
	public void updateDicWord(Dictionary dic) {
		mapper.updateDicWord(dic);
	};
	
	
	
	
	
	
	
	
}
