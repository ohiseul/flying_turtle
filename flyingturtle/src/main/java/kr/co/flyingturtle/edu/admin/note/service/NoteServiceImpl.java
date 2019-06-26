package kr.co.flyingturtle.edu.admin.note.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.NoteMapper;
import kr.co.flyingturtle.repository.vo.Member;

@Service
public class NoteServiceImpl implements NoteService{

	@Autowired
	private NoteMapper mapper;
	
	public List<Member> selectMember(){
		return mapper.selectMember();
	}
}
