package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.File;
import kr.co.flyingturtle.repository.vo.Notice;
import kr.co.flyingturtle.repository.vo.Qna;

public interface QnaMapper {
	List<Notice> selectListQna() throws Exception;
	Qna selectQnaByNo(int qnaNo) throws Exception;
	void insertQna(Qna qna) throws Exception;
	void insertFile(File file) throws Exception;
	void updateQna(Qna qna)throws Exception;
	void deleteQna(int qnaNo)throws Exception;
	
	
}
