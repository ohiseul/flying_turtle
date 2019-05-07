package kr.co.flyingturtle.edu.todo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.TodoMapper;

@Service
public class TodoServiceImpl {

		@Autowired
		private TodoMapper mapper;
}
