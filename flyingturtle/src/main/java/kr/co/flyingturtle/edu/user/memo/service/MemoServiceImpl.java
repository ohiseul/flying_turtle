package kr.co.flyingturtle.edu.user.memo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.MemoMapper;
import kr.co.flyingturtle.repository.vo.Memo;

@Service
public class MemoServiceImpl implements MemoService{
		@Autowired
		private MemoMapper mapper;

		public List<Memo> listMemo() throws Exception {
			return mapper.selectMemo();
		}

		public void insertMemo(Memo memo) {
			mapper.insertMemo(memo);
		}
		public void updateMemo(Memo memo) {
			mapper.updateMemo(memo);
			
		}

		public void deleteMemo(String id) {
			mapper.deleteMemo(id);
			
		}

		public Memo updateMemoDetail(String id) {
			return null;
		}




}
