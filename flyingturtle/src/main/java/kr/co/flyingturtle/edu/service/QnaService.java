package kr.co.flyingturtle.edu.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Qna;

public interface QnaService {
	List<Qna> retrieveBoard()throws Exception;
	void updateBoard(Qna board)throws Exception;
}
