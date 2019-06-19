package kr.co.flyingturtle.edu.user.todo.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Todo;


public interface TodoService {
	
	//프로젝트 등록
	void insertProject(Todo todo) throws Exception;
	//프로젝트 리스트 조회
	Map<String, Object> selectListProject(int memberNo) throws Exception;
	//프젝추가 + 
	List<Todo> ListProject() throws Exception;
	List<Todo> selectListTodo(Todo todo) throws Exception;
	int insertTodo(Todo todo) throws Exception;
	int DeleteTodo(int todoNo) throws Exception;
	void DeleteProject(int pjNo) throws Exception;
	void finishTodo(Todo todo) throws Exception;;
} 
