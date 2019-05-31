package kr.co.flyingturtle.repository.mapper;

import kr.co.flyingturtle.repository.vo.Member;

public interface MypageMapper {

	public Member listMypage(int memberNo);

	public Member listMyWrite(int memberNo);
}