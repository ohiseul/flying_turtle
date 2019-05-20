package kr.co.flyingturtle.edu.user.dictionary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.dictionary.service.DictionaryService;
import kr.co.flyingturtle.repository.vo.Dictionary;

@Controller("kr.co.flyingturtle.edu.user.dictionary.controller")
@RequestMapping("/user/dictionary")
public class DictionaryController {
	
	@Autowired	
	public DictionaryService service;
	
	// 처음 로딩시 전체조회
	@RequestMapping("/list.do")
	@ResponseBody
	public Dictionary list(int dicNo) {
		System.out.println("소과목 클릭시");
		return service.selectDicWord(dicNo);
	}
	
	
	// 최초 등록
	@RequestMapping("/insert.do")
	@ResponseBody
	public Dictionary detailWord(Dictionary dic) {
		System.out.println("용어 등록");
		return service.insertDicWord(dic); 
	}
	
	

}
