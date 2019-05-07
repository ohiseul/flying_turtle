package kr.co.flyingturtle.edu.notice.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.NoticeMapper;


@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;
	
	public Map<String, Object> selectNotice() {
		System.out.println("list.do - ServiceImpl 호출");
		Map<String, Object> result = new HashMap<>();
		result.put("lists", mapper.selectListNotice());
		System.out.println("DB??? "+result.toString());
		return result;
	}
	
}
