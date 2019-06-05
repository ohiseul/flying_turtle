package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Member;

public interface MypageMapper {

	/* 작성글, 작성댓글 보기  */
	Member listMypage(int memberNo);
	List<Member> listMyWrite(int memberNo);
	List<Member> listMyComment(int memberNo);
		
	/* 작성글 갯수, 작성댓글 갯수 보기  */
	int countWriteVideo(int memberNo);
	int countWriteQna(int memberNo);
	int countCommentVideo(int memberNo);
	int countCommentQna(int memberNo);
			
	/*회원 정보 수정*/
	void updateMember(Member member);
		
}