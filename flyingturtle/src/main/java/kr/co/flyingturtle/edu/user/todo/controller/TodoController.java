package kr.co.flyingturtle.edu.user.todo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.todo.service.TodoService;
import kr.co.flyingturtle.repository.vo.Todo;

@Controller
@RequestMapping("/user/todo")
public class TodoController {

	@Autowired	
	public TodoService service;
	
	//1. 프로젝트 등록하기 
		@RequestMapping("/addproject.do")
		@ResponseBody
		public Map<String, Object> addProject(Todo todo) throws Exception {	
			System.out.println("addProject 호출");		
			service.insertProject(todo);	// 프로젝트 생성
			System.out.println("pjNo 추출 : " + todo.getPjNo());			
			// 지금 생성한 프로젝트 번호를 가져와서 리스트 보여주기
			Map<String, Object> result = new HashMap<>(); 
			result.put("lists", service.selectListProject(todo.getPjNo()));
			return result;
		}
		 
				
	//2. 프로젝트 리스트 보이기 
	@RequestMapping("/list.do")
	public void selectListProject(Model model) throws Exception {
		  int pjNo = 1;
		  System.out.println("list.do - Controller 호출");
		  Map<String, Object> result = service.selectListProject(pjNo);
		  model.addAttribute("lists", result.get("lists"));
		}		

	//2+ 프로젝트 리스트 함수
	@RequestMapping("/Projectlist.do")
	@ResponseBody
	public List<Todo> ListProject() throws Exception {
			System.out.println("프로젝트 리스트");
		  return service.ListProject();
		}	
	

	//3. 투두 리스트 보이기
	@RequestMapping("/listtodo.do")
	@ResponseBody
	public List<Todo> selectListTodo(Model model, int pjNo) throws Exception {
//		  System.out.println("listtodo.do - Controller 호출");
//		  Map<String, Object> result = service.selectListTodo();
//		  model.addAttribute("listtodo", result.get("listtodo"));
//		  System.out.println("listtodo 끝");
		System.out.println("============투두 리스트 호출 =============");
		System.out.println("투두리스트 사이즈:" + service.selectListTodo(pjNo).size());
		  return service.selectListTodo(pjNo);
		}	
	
	
	//4. 투두 등록하기
	@RequestMapping("/addtodo.do")
	@ResponseBody  
	public int addTodo(Todo todo) throws Exception {
		System.out.println("투두 등록하기");
	    return service.insertTodo(todo);
	}
	
	
	//5. 투두 삭제
		@RequestMapping("/deletetodo.do")
		@ResponseBody
		public int DeleteTodo(int todoNo) throws Exception {
			System.out.println("투두 삭제 시작");
			System.out.println("가져온 번호:"+todoNo);
		    return service.DeleteTodo(todoNo);
		}		
		

	//6. 프로젝트 삭제
		@RequestMapping("/deleteproject.do")
		@ResponseBody
		public void DeleteProject(int pjNo) throws Exception {
			System.out.println("프로젝트 삭제 시작");
			System.out.println("삭제할 pjNo:"+pjNo);
		    service.DeleteProject(pjNo);
		}
			
			
}



	

