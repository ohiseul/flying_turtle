package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Todo;

public interface TodoMapper {

	// 프로젝트 생성
	void insertProject(Todo todo);


	// todo 생성
	void insertTodo(Todo todo);
	
	//todo 조회
	public List<Todo> selectListTodo(int no);
	
	
}
