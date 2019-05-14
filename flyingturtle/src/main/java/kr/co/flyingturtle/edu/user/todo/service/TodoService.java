package kr.co.flyingturtle.edu.user.todo.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Todo;


public interface TodoService {
	
	void insertProject(Todo todo) throws Exception;
	Map<String, Object> selectListProject(int pjNo) throws Exception;
	Map<String, Object> selectListTodo() throws Exception;
	void insertTodo(Todo todo) throws Exception;
	
	
} 
