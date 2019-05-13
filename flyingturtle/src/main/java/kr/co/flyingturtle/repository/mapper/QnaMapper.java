package kr.co.flyingturtle.repository.mapper;


import java.util.List;

import kr.co.flyingturtle.repository.vo.Files;
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
	/*글에 해당하는 파일 가져오기*/
	List<Files> selectFileByNo(int qnaNo) throws Exception;
	
	/*총갯수*/
	int selectCount() throws Exception;
	/*글등록*/
	void insertQna(Qna qna) throws Exception;
	/*파일등록*/
	void insertFile(Files files) throws Exception;
	
	/*글수정*/
	void updateQna(Qna qna)throws Exception;
	/*파일수정*/
	void updateFile(Files files);
	/*글삭제*/
	void deleteQna(int qnaNo)throws Exception;
	/*그룹번호 가져오기*/
	int selectGroupNo()throws Exception;
	
	
}
