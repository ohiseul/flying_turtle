package kr.co.flyingturtle.db.edu.service;

import java.util.List;

import kr.co.flyingturtle.db.repository.vo.Board;

public interface BoardService {
	List<Board> retrieveBoard()throws Exception;
	void updateBoard(Board board)throws Exception;
}
