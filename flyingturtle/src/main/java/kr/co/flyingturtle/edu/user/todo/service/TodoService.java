package kr.co.flyingturtle.edu.user.todo.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Todo;


public interface TodoService {
	
	void insertProject(Todo todo) throws Exception;
	Map<String, Object> selectListProject(int pjNo) throws Exception;
	
	
	List<Todo>selectListTodo(int pjNo) throws Exception;
	int insertTodo(Todo todo) throws Exception;
	int DeleteTodo(int pjNo) throws Exception;
	
} 