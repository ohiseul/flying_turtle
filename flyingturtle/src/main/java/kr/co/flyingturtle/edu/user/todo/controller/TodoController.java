package kr.co.flyingturtle.edu.user.todo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.flyingturtle.edu.user.todo.service.TodoService;
import kr.co.flyingturtle.repository.vo.Member;
import kr.co.flyingturtle.repository.vo.Todo;

@Controller
@RequestMapping("/user/todo")
public class TodoController {

	@Autowired	
	public TodoService service;
	@Autowired	
    HttpSession session;
	
	//1. 프로젝트 등록하기 
		@RequestMapping("/addproject.do")
		@ResponseBody
		public Map<String, Object> addProject(Todo todo) throws Exception {	
			Member mem = (Member)session.getAttribute("user");
			todo.setMemberNo(mem.getMemberNo());	
			service.insertProject(todo);	// 프로젝트 생성
			
			// 지금 생성한 프로젝트 번호를 가져와서 리스트 보여주기
			Map<String, Object> result = new HashMap<>(); 
			result.put("lists", service.selectListProject(todo.getPjNo()));
			return result;
		}
		 
				
	//2. 프로젝트 리스트 보이기 - 최초 로딩시 뿌리기
	@RequestMapping("/list.do")
	public void selectListProject(Model model, HttpSession session) throws Exception {
		  Member mem = (Member)session.getAttribute("user");
		  Map<String, Object> result = service.selectListProject(mem.getMemberNo());
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
	public List<Todo> selectListTodo(Todo todo) throws Exception {
		Member mem = (Member)session.getAttribute("user");
		todo.setMemberNo(mem.getMemberNo());
		  return service.selectListTodo(todo);
		}	
	
	
	//4. 투두 등록하기
	@RequestMapping("/addtodo.do")
	@ResponseBody  
	public int addTodo(Todo todo) throws Exception {
		 Member mem = (Member)session.getAttribute("user");
		 int memNo = mem.getMemberNo();
		 todo.setMemberNo(memNo);
	    return service.insertTodo(todo);
	}
	
	//4-1. 투두 상태코드 변경(완료)
	@RequestMapping("/finishtodo.do")
	@ResponseBody
	public void finishTodo(Todo todo) throws Exception {
//		System.out.println("들어온 todoNo" + todoNo);
//		System.out.println("들어온 codeNo" + codeNo);
//		Todo todo = new Todo();
//		todo.setCodeNo(codeNo);
	    service.finishTodo(todo);
	}	
	
	
	//5. 투두 삭제
		@RequestMapping("/deletetodo.do")
		@ResponseBody
		public int DeleteTodo(int todoNo) throws Exception {
		    return service.DeleteTodo(todoNo);
		}		
		

	//6. 프로젝트 삭제
		@RequestMapping("/deleteproject.do")
		@ResponseBody
		public void DeleteProject(int pjNo) throws Exception {
		    service.DeleteProject(pjNo);
		}
			
			
}



	

