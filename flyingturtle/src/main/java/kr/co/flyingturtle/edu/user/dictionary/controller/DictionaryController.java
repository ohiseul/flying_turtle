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
	
	/** 로딩시 전체 과목-소과목  출력 */
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
	public int subjectWrite(Dictionary dic) throws Exception {
		int no = service.subjectWrite(dic);
		return no;
	}
	
	/** 소과목 등록  */
	@RequestMapping("/smallSubjectWrite.do")
	@ResponseBody
	public int smallSubjectWrite(Dictionary dic) throws Exception{
		int no = service.smallSubjectWrite(dic);
		return no;
	}
	
	/** 소과목 수정  */
	@RequestMapping("/smallSubjectUpdate.do")
	@ResponseBody
	public void smallSubjectUpdate(Dictionary dic) throws Exception {
		service.smallSubjectUpdate(dic);
		return;
	}

	
// ===== 용어사전  =======================================================================
	
	/** 용어 등록  */
	@RequestMapping("/insert.do")
	@ResponseBody
	public Dictionary detailWord(Dictionary dic) {
		System.out.println("용어 등록");
		return service.insertDicWord(dic); 
	}

	/** 용어사전 조회  */
	@RequestMapping("/selectdic.do")
	@ResponseBody
	public Dictionary selectDicWord() {
		// 과목명 value 값을 가져와서 해당하는 번호를 조회한 후, 그에 맞는 용어사전내용을 반환한다.
		return null;
	}

}
