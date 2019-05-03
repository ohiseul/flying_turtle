package kr.co.flyingturtle.db.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.flyingturtle.db.repository.mapper.BoardMapper;
import kr.co.flyingturtle.db.repository.vo.Board;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	public List<Board> retrieveBoard() throws Exception{
		return mapper.selectBoard();
	}
	
//	공용aop? 스프링 방식대로 코딩해야해 
//	@Transactional(rollbackFor = Exception.class)
	public void updateBoard(Board board) throws Exception{
		//트렌젝션 테스트용(전체가 성공하면 db에 넣는다 하나라도 망가지면 되돌리겠다 all or nothing)
		//트렌젝션 시작 코드
		mapper.insertBoard(board);
		// 테이블명을 잘못 작성한 상태: 실행시 에러발생....
		mapper.deleteBoard(1);
		//트렌젝션 커밋
		//예외발생시 롤백
	}
}
