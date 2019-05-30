package kr.co.flyingturtle.edu.user.main.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Employment;

public interface MainService {

	// 취업정보 전체 리스트
	List<Employment> selectEmpList();
	
}
