package kr.co.flyingturtle.edu.qna.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.QnaMapper;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;

@Service
public class QnaServiceImpl implements QnaService{
		@Autowired
		private QnaMapper mapper;
		
		/*QNA 전체조회*/
		public Map<String, Object> list(Page page) throws Exception{;
			Map<String, Object> result = new HashMap<>();
			result.put("lists", mapper.selectListQna(page));
			System.out.println("DB::: "+result.toString());
			return result;
		}
		/*댓글 전체조회*/
		public List<QnaCom> listCom(int qnaNo) throws Exception{
				return mapper.selectComByNo(qnaNo);
		}
		/*QNA 상세조회*/
		public Qna detail(int qnaNo) throws Exception{
			return mapper.selectQnaByNo(qnaNo);			
		}
		/*QNA 등록*/
		public void write(Qna qna) throws Exception {
			mapper.insertQna(qna);
		}
		/*QNA 수정*/		
		public Qna updateForm(int qnaNo)throws Exception {
			return mapper.selectQnaByNo(qnaNo);	
		}
		public void update(Qna qna)throws Exception {
			mapper.updateQna(qna);
		}
		/*QNA 삭제*/
		public void delete(int qnaNo)throws Exception {
			mapper.deleteQna(qnaNo);
		}
		/*총게시글 개수*/
		public int count() throws Exception {
			return mapper.selectCount();
		}

		
		

}
