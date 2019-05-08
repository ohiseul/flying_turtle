package kr.co.flyingturtle.edu.qna.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Qna;

public interface QnaService {
	Map<String, Object> list() throws Exception;
	public void write(Qna qna) throws Exception;
	void update(Qna qna) throws Exception;
	public Qna detail(int qnaNo) throws Exception;
	public void delete(int qnaNo) throws Exception;
	
}
