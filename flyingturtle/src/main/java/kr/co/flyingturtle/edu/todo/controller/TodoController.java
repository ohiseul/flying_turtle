package kr.co.flyingturtle.edu.todo.controller;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.google.gson.Gson;
import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import kr.co.flyingturtle.edu.todo.service.TodoService;
import kr.co.flyingturtle.repository.vo.Todo;

@Controller
@RequestMapping("/todo")
public class TodoController {

	@Autowired	
	public TodoService service;
	
	//1. 프로젝트 등록하기 
		//uri : /addproject.do 
		//title(key) : vo이름과 같아야한다. 
		@RequestMapping("/addproject.do")
		public void addProject(String title) throws Exception {	
			
			Todo todo = new Todo();
			
			//todo에 등록한 project title 값을 넣어준다. 
			todo.setTitle(title);
			todo.setMemberNo(1);
			service.insertProject(todo);
			
			//불러오는 코드를 
			
		}
		
		
	 //2. todo 등록하기 
		@RequestMapping("/addtodo.do")
		public void addTodo(String todo) throws Exception {
				
			
		}
		
				
	//3. todo 리스트 보이기 
	@RequestMapping("/list.do")
	public void selectTodo(Model model) throws Exception {
		System.out.println("list.do - Controller 호출");
		//Map<String, Object> result = service.selectTodo(todo.getPjNo());
		//System.out.println("controller DB - " + result.toString());
		//model.addAttribute("list", result.get("lists"));	
		}		

	
	
	
	
}



	

