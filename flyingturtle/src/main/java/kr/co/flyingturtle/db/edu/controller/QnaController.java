package kr.co.flyingturtle.db.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.flyingturtle.db.edu.service.BoardService;
import kr.co.flyingturtle.db.repository.vo.Board;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	public void tranTest() throws Exception{
		System.out.println("트렌젝션 테스트");
		Board board = new Board();
		board.setTitle("h");
		board.setContent("a");
		board.setWriter("m");
		service.updateBoard(board);
		
	}
	
	public void retrieveBoard()throws Exception{
		List<Board> list = service.retrieveBoard();
		System.out.println("게시물정보");
		System.out.println("=====================");
		for(Board board : list) {
			System.out.print(board.getNo()+"\t");
			System.out.print(board.getTitle()+"\t");
			System.out.print(board.getContent()+"\t");
			System.out.print(board.getWriter()+"\t");
			System.out.println(board.getRegDate());
		}
	}
	
	
}
