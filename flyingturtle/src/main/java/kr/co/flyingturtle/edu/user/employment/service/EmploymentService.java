package kr.co.flyingturtle.edu.user.employment.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Employment;

public interface EmploymentService {

	// 취업정보 전체 리스트
	List<Employment> selectEmpList();
	
}
