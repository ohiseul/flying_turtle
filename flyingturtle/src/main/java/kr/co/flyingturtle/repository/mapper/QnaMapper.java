package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Qna;

public interface QnaMapper {
	List<Qna> selectBoard() throws Exception;
	void insertBoard(Qna board) throws Exception;
	void updateBoard(Qna board)throws Exception;
	void deleteBoard(int no)throws Exception;
}
