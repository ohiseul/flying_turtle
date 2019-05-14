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
		
	
		//프로젝트 등록
		public void insertProject(Todo todo) throws Exception {
			System.out.println("DB 넣기 전 : "+todo.getPjNo());
			mapper.insertProject(todo);
			System.out.println("DB 넣은 후 : "+todo.getPjNo());
		}
				
		//프로젝트 조회
		public Map<String, Object> selectListProject(int pjNo) throws Exception {
			System.out.println("list.do - ServiceImpl 호출");
			Map<String, Object> result = new HashMap<>();
			System.out.println("mapper로 목록 뿌리기 전 ");
			result.put("lists", mapper.selectListProject(pjNo));
			System.out.println("mapper로 목록 뿌리기 후 ");
			return result;
		}
		
		
		//투두 등록
		public int insertTodo(Todo todo) throws Exception {
//			System.out.println("todo DB 넣기 전 : "+todo.getPjNo());
			return mapper.insertTodo(todo);
//			System.out.println("todo DB 넣기 후 : "+todo.getPjNo());
		}

	
		//투두 조회
		public List<Todo> selectListTodo(int pjNo) throws Exception {
			System.out.println("===투두 리스트 mapper 가기 전 ");
			return mapper.selectListTodo(pjNo);
//			System.out.println("프로젝트 클릭");
//			Map<String, Object> result = new HashMap<>();
//			result.put("listtodo", mapper.selectListTodo());
//			return result;
		}

		//투두 삭제
		public int DeleteTodo(int pjNo) throws Exception {
			
			return mapper.deleteTodo(pjNo);
		}


		
		
	}