package kr.co.flyingturtle.edu.user.qna.service;

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

@Service
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
		public Map<String, Object> detail(Qna qna) throws Exception{
			Map<String, Object> result = new HashMap<>();
			
		//	System.out.println("서비스임플 getQnaNo:"+qna.getQnaNo()+"::::"+mapper.selectQnaByNo(qna.getQnaNo()));
			result.put("detail", mapper.selectQnaByNo(qna.getQnaNo()));
			//System.out.println("서비스임플 getFileGroupNo():"+qna.getFileGroupNo()+"::::"+mapper.selectFileByNo(qna.getFileGroupNo()));
			int fileGroupNo = qna.getFileGroupNo();
			//System.out.println("fileGroupNo:"+fileGroupNo);
			result.put("files", mapper.selectFileByNo(fileGroupNo));
			
			//System.out.println("서비스임플 getQnaNo():"+qna.getQnaNo()+"::::"+mapper.selectListAsw(qna.getQnaNo()));
			result.put("listAsw", mapper.selectListAsw(qna.getQnaNo()));
			//System.out.println("DB::: "+result.toString());		
			return result;
		}
		/*QNA 등록*/
		public void write(Qna qna) throws Exception {
			mapper.insertQna(qna);
		}
		
		/*QNA 수정글 가져오기*/		
		public Map<String, Object> updateForm(int qnaNo)throws Exception {
			System.out.println("수정할 글번호:"+qnaNo);
			Map<String, Object> result = new HashMap<>();
			result.put("updates", mapper.selectQnaByNo(qnaNo));
			System.out.println(mapper.selectQnaByNo(qnaNo).getContent());
			System.out.println(mapper.selectQnaByNo(qnaNo).getFileGroupNo());
			System.out.println(mapper.selectQnaByNo(qnaNo).getId());
			System.out.println(mapper.selectQnaByNo(qnaNo).getTitle());
			return result;
		}
		/*QNA 글수정*/
		public void update(Qna qna)throws Exception {
			System.out.println("글내용:"+qna.getContent());
			System.out.println("파일그룹번호:"+qna.getFileGroupNo());
			System.out.println("맴버번호:"+qna.getMemberNo());
			
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
		public List<Files> listFile(int fileGroupNo) throws Exception {
			return mapper.selectFileByNo(fileGroupNo);
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
		/*답글 전체*/
		public List<Answer> listAsw(int qnaNo) throws Exception {
			return mapper.selectListAsw(qnaNo);
		}
		/*답글 하나 상세*/
		public Answer detailAsw(int aswNo) throws Exception {
			return mapper.selectAswByNo(aswNo);
		}
		/*답글 등록*/
		public void writeAsw(Answer answer) throws Exception {
			mapper.insertAsw(answer);
		}
		/*답글 수정*/
		public void updateAsw(Answer answer) throws Exception {
			mapper.updateAsw(answer);
		}
		/*답글 갯수*/
		public int countAsw(int qnaNo) throws Exception {
			return mapper.selectAswCount(qnaNo);
		}
		/*답글삭제*/
		public void deleteAsw(int aswNo) throws Exception {
			mapper.deleteAsw(aswNo);
		}



		
		

}
