package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Employment;

public interface EmploymentMapper {
	
	/* 취업정보 전체 리스트 */
	List<Employment> selectEmpList();

}
