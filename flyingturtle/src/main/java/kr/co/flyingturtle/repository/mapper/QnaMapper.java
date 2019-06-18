package kr.co.flyingturtle.repository.mapper;


import java.util.List;

import kr.co.flyingturtle.repository.vo.Answer;
import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;

public interface QnaMapper {
//문의===============================================
	/**전체리스트*/
	List<Qna> selectListQna(Page page) throws Exception;
	/**글상세*/
	Qna selectQnaByNo(int qnaNo) throws Exception;
	/**총갯수*/
	int selectCount() throws Exception;
	/**글등록*/
	void insertQna(Qna qna) throws Exception;
	/**글수정*/
	void updateQna(Qna qna)throws Exception;
	/**글삭제*/
	void deleteQna(Qna qna)throws Exception;
	/**조희수 증가*/
	void updateQnaViewCnt(Qna qna)throws Exception;
//파일===============================================
	/**그룹번호 가져오기*/
	int selectGroupNo()throws Exception;
	/**글에 해당하는 파일 가져오기*/
	List<Files> selectFileByNo(int fileGroupNo) throws Exception;
	/**파일등록*/
	void insertFile(Files files) throws Exception;
	/**파일수정*/
	void updateFile(Files files);
//댓글===============================================
	/**댓글리스트*/
	List<QnaCom> selectCom(int qnaNo);
	/**댓글 하나*/
	QnaCom selectComByNo(int comNo);
	/**댓글 등록*/
	void insertCom(QnaCom qnaCom);
	/**댓글 수정*/
	void updateCom(QnaCom qnaCom);
	/**댓글 삭제*/
	void deleteCom(int comNo);
//답변===============================================
	/**문의 전체 리스트*/
	List<Answer> selectListAsw(int qnaNo) throws Exception;
	/**문의 상세*/
	Answer selectAswByNo(int aswNo) throws Exception;
	/**문의 총갯수*/
	int selectAswCount(int qnaNo) throws Exception;
	/**문의 등록*/
	void insertAsw(Answer answer) throws Exception;
	/**문의 수정*/
	void updateAsw(Answer answer)throws Exception;
	/**문의 삭제*/
	void deleteAsw(int aswNo)throws Exception;
	/**문의 등록시 상태값 변경*/
	int updateQnaStatus(Answer answer)throws Exception;
	
}
