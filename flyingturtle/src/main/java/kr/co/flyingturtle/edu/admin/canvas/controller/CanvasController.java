package kr.co.flyingturtle.edu.admin.canvas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.admin.canvas.service.CanvasService;

@Controller("kr.co.flyingturtle.edu.admin.canvas.controller")
@RequestMapping("/admin/canvas")
public class CanvasController {
			
			@Autowired	
			public CanvasService service;
	//문의==========================================================================		
			/*전체 리스트 조회*/
			@RequestMapping("/list.do")
			public void list(Model model) throws Exception {

			}
			@RequestMapping("/canvas.do")
			public void canvas(Model model) throws Exception {
				
			}
}
