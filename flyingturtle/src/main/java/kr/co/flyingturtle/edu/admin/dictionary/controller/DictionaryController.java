package kr.co.flyingturtle.edu.admin.dictionary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.admin.dictionary.service.DictionaryService;
import kr.co.flyingturtle.repository.vo.Dictionary;

@Controller("kr.co.flyingturtle.edu.admin.dictionary.controller")
@RequestMapping("/admin/dictionary")
public class DictionaryController {
	
	@Autowired	
	public DictionaryService service;
	
	// 처음 로딩시 메뉴 조회
	@RequestMapping("/list.do")
	public void list() {};
	
	//과목리스트 조회
	@RequestMapping("/menulist.do")
	@ResponseBody
	public List<Dictionary> menuList() throws Exception {
		System.out.println("로딩 --------- 용어 메뉴 목록 가져오기");
		return service.list();
	}
	//과목 등록
	@RequestMapping("/subjectWrite.do")
	@ResponseBody
	public void subjectWrite(String sbjName) throws Exception{
		System.out.println("등록 와라");
		System.out.println(sbjName);
	}
	//--------------------
	
	
	
	// 최초 등록
	@RequestMapping("/insert.do")
	@ResponseBody
	public Dictionary detailWord(Dictionary dic) {
		System.out.println("용어 등록");
		return service.insertDicWord(dic); 
	}

}
