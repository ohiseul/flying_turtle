package kr.co.flyingturtle.edu.user.employment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.employment.service.EmploymentService;
import kr.co.flyingturtle.repository.vo.Employment;

@Controller("kr.co.flyingturtle.edu.user.employment.controller")
@RequestMapping("/user/employment")
public class EmploymentController {
	
	@Autowired
	private EmploymentService service;
	
	/** 전체 과목리스트  불러오기  */
	@RequestMapping("/list.do")
	public void list(Model model) throws Exception {
		model.addAttribute("empList", service.selectEmpList());
	}
	
	@RequestMapping("/append.do")
	@ResponseBody
	public List<Employment> append() throws Exception {
		return service.selectEmpList();
	}
	
		

}
