package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Member;

public interface MypageMapper {

	public Member listMypage(int memberNo);

	public List<Member> listMyWrite(int memberNo);
	
	public List<Member> listMyComment(int memberNo);
	
	public List<Member> listQna(int memberNo);
	
	
}