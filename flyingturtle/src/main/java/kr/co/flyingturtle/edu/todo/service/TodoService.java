package kr.co.flyingturtle.edu.todo.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Todo;


public interface TodoService {
	
	Map<String, Object> list() throws Exception;

	void insertProject(Todo todo) throws Exception;
	
	void insertTodo(Todo todo) throws Exception;
	
	
} 
