package kr.co.flyingturtle.edu.qna.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.QnaMapper;
import kr.co.flyingturtle.repository.vo.File;
import kr.co.flyingturtle.repository.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService{
		@Autowired
		private QnaMapper mapper;
		
		/*QNA 전체조회*/
		public Map<String, Object> list() throws Exception{
			System.out.println("list.do - ServiceImpl 호출");
			Map<String, Object> result = new HashMap<>();
			result.put("lists", mapper.selectListQna());
			System.out.println("DB::: "+result.toString());
			return result;
		}
		/*QNA 상세조회*/
		public Qna detail(int qnaNo) throws Exception{
			return mapper.selectQnaByNo(qnaNo);			
		}
		/*QNA 등록*/
		public void write(Qna qna) throws Exception {
			mapper.insertQna(qna);
		}
		/*File 등록*/
		public void writeFile(File file) throws Exception {
			mapper.insertFile(file);
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
		
		

}
