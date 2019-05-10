package kr.co.flyingturtle.edu.qna.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;

public interface QnaService {
	Map<String, Object> list(Page page) throws Exception;
	List<QnaCom> listCom(int qnaNo) throws Exception;
	public void write(Qna qna) throws Exception;
	void update(Qna qna) throws Exception;
	int count() throws Exception;
	public Qna detail(int qnaNo) throws Exception;
	public void delete(int qnaNo) throws Exception;
	
}
