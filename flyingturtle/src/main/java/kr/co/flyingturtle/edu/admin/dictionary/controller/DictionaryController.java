package kr.co.flyingturtle.edu.admin.dictionary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public Map<String, Object> menuList(Model model) throws Exception {
		Map<String, Object> map = service.list();
		return map;
	}
	
	//과목 등록
	@RequestMapping("/subjectWrite.do")
	@ResponseBody
	public int subjectWrite(Dictionary dic) throws Exception{
		int no = service.subjectWrite(dic);
		return no;
	}
	
	//과목 수정
	@RequestMapping("/subjectUpdate.do")
	@ResponseBody
	public int subjectUpdate(Dictionary dic) throws Exception{
		 int no = service.subjectUpdate(dic); 	
		 return no; 
	}
	
	//소과목 등록
	@RequestMapping("/smallSubjectWrite.do")
	@ResponseBody
	public int smallSubjectWrite(Dictionary dic) throws Exception{
		int no = service.smallSubjectWrite(dic);
		return no; 
		}
	
	//소과목 삭제
	@RequestMapping("/smallSubjectDelete.do")
	@ResponseBody
	public void smallSubjectDelete(Dictionary dic) throws Exception{
		System.out.println("삭제 왔음"+dic.getSbjNo());
		service.smallSubjectDelete(dic);
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
