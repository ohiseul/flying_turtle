package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;

public interface QnaMapper {
	List<Qna> selectListQna() throws Exception;
	List<QnaCom> selectComByNo(int no);
	Qna selectQnaByNo(int qnaNo) throws Exception;
	int selectCount() throws Exception;
	void insertQna(Qna qna) throws Exception;
	void updateQna(Qna qna)throws Exception;
	void deleteQna(int qnaNo)throws Exception;
	
	
}
