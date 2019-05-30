package kr.co.flyingturtle.edu.user.memo.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Memo;

public interface MemoService {

		/*댓글 리스트 가져오기*/
		List<Memo> listMemo() throws Exception;
		/*댓글 등록*/
		void insertMemo(Memo memo);
		/*댓글 수정*/
		void updateMemo(Memo memo);
		/*댓글 삭제*/
		public void  deleteMemo(String id);
		/*댓글 상세*/
		Memo updateMemoDetail(String id);

}
