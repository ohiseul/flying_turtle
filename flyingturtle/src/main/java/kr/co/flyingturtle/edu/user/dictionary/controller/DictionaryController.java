package kr.co.flyingturtle.edu.user.dictionary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.dictionary.service.DictionaryService;
import kr.co.flyingturtle.repository.vo.Dictionary;

@Controller("kr.co.flyingturtle.edu.user.dictionary.controller")
@RequestMapping("/user/dictionary")
public class DictionaryController {
	
	@Autowired	
	public DictionaryService service;
	
	/** 로딩 :: 전체 과목리스트  불러오기  */
	@RequestMapping("/list.do")
	public void menuList(Model model) throws Exception {
		// 공유영역에 올려주기 : 소과목 전체과목
		Map<String, Object> map = service.list();
		model.addAttribute("sbjList", map.get("sbj"));
		model.addAttribute("ssbjList", map.get("ssbj"));
		return;
	}
	
	
	/** 과목 등록  */
	@RequestMapping("/subjectWrite.do")
	@ResponseBody
	public int subjectWrite(Dictionary dic) throws Exception{
		return service.subjectWrite(dic);
	}
	
	/** 소과목 등록  */
	@RequestMapping("/smallSubjectWrite.do")
	@ResponseBody
	public int smallSubjectWrite(Dictionary dic) throws Exception{
		return service.smallSubjectWrite(dic);
	}
	
	/** 소과목 수정  */
	@RequestMapping("/smallSubjectUpdate.do")
	@ResponseBody
	public void smallSubjectUpdate(Dictionary dic) throws Exception {
		service.smallSubjectUpdate(dic);
		return;
	}

	
// ===== 용어사전 =========================================================
	
	/** 용어사전 내용 불러오기	*/
	@RequestMapping("/selectdic.do")
	@ResponseBody
	public Dictionary selectDicWord(int ssbjNo) {
		System.out.println("용어사전 조회 controller");
		System.out.println("ssbjNo : " + ssbjNo);
		return service.selectDicWord(ssbjNo);
	}
	
	/** 용어 등록  */
	@RequestMapping("/insert.do")
	@ResponseBody
	public Dictionary detailWord(Dictionary dic) {
		System.out.println("용어 등록");
		return service.insertDicWord(dic); 
	}

	

}
