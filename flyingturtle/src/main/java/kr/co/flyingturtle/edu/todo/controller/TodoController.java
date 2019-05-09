package kr.co.flyingturtle.edu.todo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.flyingturtle.edu.todo.service.TodoService;
import kr.co.flyingturtle.repository.vo.Todo;

@Controller
@RequestMapping("/todo")
public class TodoController {

	@Autowired	
	public TodoService service;
	
	
	@RequestMapping("/list.do")
	public void selectTodo(Model model) throws Exception {
		System.out.println("list.do - Controller 호출");
		//Map<String, Object> result = service.selectTodo(todo.getPjNo());
		//System.out.println("controller DB - " + result.toString());
		//model.addAttribute("list", result.get("lists"));	
		}		

	//uri : /addproject.do 
	//title(key) : vo이름과 같아야한다. 
	@RequestMapping("/addproject.do")
	public void addProject(String title) throws Exception {
		//addProject 메서드 : TodoVO 안에 넘어온 데이터 넣어주기 	
		
		Todo todo = new Todo();
		
		//todo에 등록한 project title 값을 넣어준다. 
		todo.setTitle(title);
		todo.setMemberNo(1);
		//service.insertProject(todo);		
	}






}

	

