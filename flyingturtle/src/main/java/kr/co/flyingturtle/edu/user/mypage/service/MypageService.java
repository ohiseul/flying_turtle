package kr.co.flyingturtle.edu.user.mypage.service;

import java.util.Map;

public interface MypageService {

	Map<String, Object> listMypage(int memberNo) throws Exception;

	Map<String, Object> myWrite(int memberNo);
	
}
