package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;

public interface QnaMapper {
	/*전체리스트*/
	List<Qna> selectListQna(Page page) throws Exception;
	/*댓글리스트*/
	List<QnaCom> selectComByNo(int no);
	/*글상세*/
	Qna selectQnaByNo(int qnaNo) throws Exception;
	/*총갯수*/
	int selectCount() throws Exception;
	/*글등록*/
	void insertQna(Qna qna) throws Exception;
	/*글수정*/
	void updateQna(Qna qna)throws Exception;
	/*글삭제*/
	void deleteQna(int qnaNo)throws Exception;
	
	
}
