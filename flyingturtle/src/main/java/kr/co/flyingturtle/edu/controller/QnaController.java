package kr.co.flyingturtle.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.flyingturtle.edu.service.QnaService;
import kr.co.flyingturtle.repository.vo.Qna;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService service;
	
	public void tranTest() throws Exception{
		System.out.println("트렌젝션 테스트");
		Qna board = new Qna();
		board.setTitle("h");
		board.setContent("a");
		board.setWriter("m");
		service.updateBoard(board);
		
	}
	
	public void retrieveBoard()throws Exception{
		List<Qna> list = service.retrieveBoard();
		System.out.println("게시물정보");
		System.out.println("=====================");
		for(Qna board : list) {
			System.out.print(board.getNo()+"\t");
			System.out.print(board.getTitle()+"\t");
			System.out.print(board.getContent()+"\t");
			System.out.print(board.getWriter()+"\t");
			System.out.println(board.getRegDate());
		}
	}
	
	
}
