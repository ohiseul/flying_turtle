package kr.co.flyingturtle.edu.todo.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.TodoMapper;
import kr.co.flyingturtle.repository.vo.File;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.Todo;


@Service
public class TodoServiceImpl implements TodoService {

		@Autowired
		private TodoMapper mapper;
		
		public Todo todo;
	
		
		public Map<String, Object> selectTodo(int no) throws Exception {
			System.out.println("list.do - ServiceImpl 호출");
			Map<String, Object> result = new HashMap<>();
			result.put("lists", mapper.selectListTodo(no));
			System.out.println("DB??? "+result.toString());
			return result;
		}


		@Override
		public Map<String, Object> list() throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
		
	}