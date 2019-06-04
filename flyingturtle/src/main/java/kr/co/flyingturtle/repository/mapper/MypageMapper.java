package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Member;

public interface MypageMapper {

	/* 작성글, 작성댓글 보기  */
	public Member listMypage(int memberNo);
	public List<Member> listMyWrite(int memberNo);
	public List<Member> listMyComment(int memberNo);
	
	
	/* 작성글 갯수, 작성댓글 갯수 보기  */
	public int countWriteVideo(int memberNo);
	public int countWriteQna(int memberNo);
	public int countCommentVideo(int memberNo);
	public int countCommentQna(int memberNo);
		
}