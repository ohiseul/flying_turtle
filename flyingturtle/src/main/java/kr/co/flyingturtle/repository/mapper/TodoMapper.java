package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Todo;

public interface TodoMapper {

	//todo 조회
	public List<Todo> selectListTodo(int no);
	
	// 프로젝트 생성
	void insertProject(Todo todo);
}
