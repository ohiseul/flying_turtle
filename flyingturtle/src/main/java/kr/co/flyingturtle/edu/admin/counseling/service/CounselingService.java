package kr.co.flyingturtle.edu.admin.counseling.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Answer;
import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;

public interface CounselingService {
//문의================================================================
	/*글 리스트 가져오기*/
	Map<String, Object> list(Page page) throws Exception;
	/*상세글정보 가져오기*/
	Map<String, Object> detail(int qnaNo) throws Exception;
	/*글등록*/
	public void write(Qna qna) throws Exception;
	/*글수정*/
	void update(Qna qna) throws Exception;
	void updateFile(Files files) throws Exception;
	/*총 글갯수*/
	int count() throws Exception;
	/*글삭제*/
	public void delete(int qnaNo) throws Exception;

//댓글================================================================
	/*댓글 리스트 가져오기*/
	List<QnaCom> listCom(int qnaNo) throws Exception;
	/*댓글 등록*/
	void writeCom(QnaCom qnaCom);
	/*댓글 수정*/
	void updateCom(QnaCom qnaCom);
	/*댓글 삭제*/
	public void  deleteCom(int comNo);
	/*댓글 상세*/
	QnaCom updateComDetail(int comNo);

}
