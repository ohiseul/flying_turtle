package kr.co.flyingturtle.edu.admin.qna.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.QnaMapper;
import kr.co.flyingturtle.repository.vo.Answer;
import kr.co.flyingturtle.repository.vo.Files;
import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.PageResult;
import kr.co.flyingturtle.repository.vo.Qna;
import kr.co.flyingturtle.repository.vo.QnaCom;


@Service("kr.co.flyingturtle.edu.admin.qna.service")
public class QnaServiceImpl implements QnaService{
		@Autowired
		private QnaMapper mapper;
		
//문의=======================================================================
		/*QNA 전체조회*/
		public Map<String, Object> list(Page page) throws Exception{
			Map<String, Object> result = new HashMap<>();
			result.put("page",new PageResult(page.getPageNo(),mapper.selectCount()));
			result.put("lists", mapper.selectListQna(page));
			System.out.println("DB::: "+result.toString());
			return result;
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
		
//파일=======================================================================
		/*File등록*/
		public void writeFile(Files files) throws Exception {
			mapper.insertFile(files);
		}
		/*그룹번호 가져오기*/
		public int groupNo() throws Exception {
			return mapper.selectGroupNo();
		}
		/*파일다운로드를 위한 파일선택*/
		public List<Files> listFile(int groupNo) throws Exception {
			return mapper.selectFileByNo(groupNo);
		}
//댓글=======================================================================
		/*댓글 전체조회*/
		public List<QnaCom> listCom(int qnaNo) throws Exception{
			return mapper.selectCom(qnaNo);
		}
		/*댓글등록*/
		public void writeCom(QnaCom qnaCom) {
			mapper.insertCom(qnaCom);
		}
		/*댓글수정*/
		public void updateCom(QnaCom qnaCom) {
			mapper.updateCom(qnaCom);
		}

		/*댓글삭제*/
		public void deleteCom(int comNo) {
			mapper.deleteCom(comNo);
		}
		/*댓글 하나조회*/
		public QnaCom updateComDetail(int comNo) {
			return mapper.selectComByNo(comNo);
		}

//답변=======================================================================
		@Override
		public Map<String, Object> listAsw(int qnaNo) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public Map<String, Object> detailAsw(int aswNo) throws Exception {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public void writeAsw(Answer answer) throws Exception {
			// TODO Auto-generated method stub
			
		}
		@Override
		public void updateAsw(Answer answer) throws Exception {
			// TODO Auto-generated method stub
			
		}
		@Override
		public int countAsw() throws Exception {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public void deleteAsw(int aswNo) throws Exception {
			// TODO Auto-generated method stub
			
		}



		
		

}
