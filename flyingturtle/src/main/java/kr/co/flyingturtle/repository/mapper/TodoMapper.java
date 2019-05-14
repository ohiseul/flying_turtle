package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Todo;

public interface TodoMapper {

	// 프로젝트 생성
	void insertProject(Todo todo);

	// 프로젝트 조회
	List<Todo> selectListProject(int pjNo);
	
	// 프로젝트 삭제
	void deleteProject(int pjNo);
	
	// 프로젝트 수정
	
	//=====================================
	
	// todo 생성
	int insertTodo(Todo todo);
	
	// todo 조회
	List<Todo> selectListTodo(int pjNo);
	
	// todo 삭제
	void deleteTodo(int pjNo);
	
	
}
