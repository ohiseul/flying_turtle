package kr.co.flyingturtle.edu.user.mypage.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageMapper mapper;
	
	@Override
	public Map<String, Object> listMypage(int memberNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("lists", mapper.listMypage(memberNo));
		return map;
	}



	@Override
	public Map<String, Object> myWrite(int memberNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("write", mapper.listMyWrite(memberNo));
		return map;
	}
	

}
