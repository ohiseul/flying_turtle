package kr.co.flyingturtle.edu.qna.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.flyingturtle.repository.mapper.QnaMapper;
import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.PageResult;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;

@Service
public class QnaServiceImpl implements QnaService{
		@Autowired
		private QnaMapper mapper;
		
		/*QNA 전체조회*/
		public Map<String, Object> list(Page page) throws Exception{
			Map<String, Object> result = new HashMap<>();
			result.put("page",new PageResult(page.getPageNo(),mapper.selectCount()));
			result.put("lists", mapper.selectListQna(page));
			System.out.println("DB::: "+result.toString());
			return result;
		}
		/*댓글 전체조회*/
		public List<QnaCom> listCom(int qnaNo) throws Exception{
				return mapper.selectComByNo(qnaNo);
		}
		/*QNA 상세조회*/
		public Map<String, Object> detail(int qnaNo) throws Exception{
			Map<String, Object> result = new HashMap<>();
			result.put("detail", mapper.selectQnaByNo(qnaNo));
			result.put("files", mapper.selectFileByNo(qnaNo));			
			System.out.println("DB::: "+result.toString());		
			return result;
		}
		/*QNA 등록*/
		public void write(Qna qna) throws Exception {
			mapper.insertQna(qna);
		}
		/*File등록*/
		public void writeFile(Files files) throws Exception {
			mapper.insertFile(files);
		}
		
		/*QNA 수정글 가져오기*/		
		public Qna updateForm(int qnaNo)throws Exception {
			return mapper.selectQnaByNo(qnaNo);	
		}
		/*QNA 글수정*/
		public void update(Qna qna)throws Exception {
			mapper.updateQna(qna);
		}
		/*QNA 파일수정*/
		public void updateFile(Files files) throws Exception {
			mapper.updateFile(files);
		}
		/*QNA 삭제*/
		public void delete(int qnaNo)throws Exception {
			mapper.deleteQna(qnaNo);
		}
		/*총게시글 개수*/
		public int count() throws Exception {
			return mapper.selectCount();
		}
		/*그룹번호 가져오기*/
		public int groupNo() throws Exception {
			return mapper.selectGroupNo();
		}



		
		

}
