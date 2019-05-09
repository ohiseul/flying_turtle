package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Todo;

public interface TodoMapper {

	// 1. 프로젝트 생성
	void insertProject(Todo todo);

	// 2. 투두 생성
	void insertTodo(Todo todo);
	
	// 3. todo 조회
	public List<Todo> selectListTodo(int no);
	
	
}
