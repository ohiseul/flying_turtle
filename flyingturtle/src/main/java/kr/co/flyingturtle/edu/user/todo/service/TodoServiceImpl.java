package kr.co.flyingturtle.edu.user.todo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.TodoMapper;
import kr.co.flyingturtle.repository.vo.Todo;


@Service
public class TodoServiceImpl implements TodoService {

		@Autowired
		private TodoMapper mapper;
		
		public Todo todo;
		
	
	//1. 프로젝트 등록
		public void insertProject(Todo todo) throws Exception {
			System.out.println("DB 넣기 전 : "+todo.getPjNo());
			mapper.insertProject(todo);
			System.out.println("DB 넣은 후 : "+todo.getPjNo());
		}
				
	//2. 프로젝트 조회
		public Map<String, Object> selectListProject(int memberNo) throws Exception {
			System.out.println("list.do - ServiceImpl 호출");
			Map<String, Object> result = new HashMap<>();
			System.out.println("mapper로 목록 뿌리기 전 ");
			result.put("lists", mapper.selectListProject(memberNo));
			System.out.println("mapper로 목록 뿌리기 후 ");
			return result;
		}
		
		
	// 2+ 프로젝트 조회
		public List<Todo> ListProject() throws Exception {
			return mapper.ListProject();
		}
		
		
		//투두 등록
		public int insertTodo(Todo todo) throws Exception {
			return mapper.insertTodo(todo);
		}

	
		//투두 조회
		public List<Todo> selectListTodo(Todo todo) throws Exception {
			System.out.println("===투두 리스트 mapper 가기 전 ");
			return mapper.selectListTodo(todo);
		}

		//투두 삭제
		public int DeleteTodo(int pjNo) throws Exception {
			
			return mapper.deleteTodo(pjNo);
		}

		//프로젝트 삭제
		public void DeleteProject(int pjNo) throws Exception {
			 mapper.deleteProject(pjNo);
		}

		//투두 완료
		public int finishTodo(int todoNo) throws Exception {
			return mapper.finishTodo(todoNo);
		}


		
		
	}