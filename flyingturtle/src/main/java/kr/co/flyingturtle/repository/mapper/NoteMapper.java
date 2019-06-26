package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Member;

public interface NoteMapper {

//	회원목록
	public List<Member> selectMember();

}
