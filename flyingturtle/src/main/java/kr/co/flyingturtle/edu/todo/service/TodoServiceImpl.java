package kr.co.flyingturtle.edu.todo.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import kr.co.flyingturtle.repository.mapper.TodoMapper;
import kr.co.flyingturtle.repository.vo.Todo;


@Service
public class TodoServiceImpl implements TodoService {

		@Autowired
		private TodoMapper mapper;
		
		public Todo todo;
	
		
		//프로젝트 등록
		public void insertProject(Todo todo) throws Exception {
		
			mapper.insertProject(todo);
//			String data = new Gson().toJson();
//			
//			PrintWriter out = response.getWriter();
//			
//			//서블릿을 부르게 되면 ajax 결과값으로 넘어간다. 
//			out.println(data);
//			out.close();
			
		}
				
		
		//투두 등록
		public void insertTodo(Todo todo) throws Exception {
			mapper.insertTodo(todo);
		}

	
		public Map<String, Object> selectTodo(int no) throws Exception {
			System.out.println("list.do - ServiceImpl 호출");
			Map<String, Object> result = new HashMap<>();
			//result.put("lists", mapper.selectListTodo(no));
			System.out.println("DB??? "+result.toString());
			return result;
		}


		@Override
		public Map<java.lang.String, Object> list() throws Exception {
			// TODO Auto-generated method stub
			return null;
		}

		
		
	}