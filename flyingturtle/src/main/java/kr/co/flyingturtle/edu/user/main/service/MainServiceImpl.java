package kr.co.flyingturtle.edu.user.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.EmploymentMapper;
import kr.co.flyingturtle.repository.vo.Employment;


@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private EmploymentMapper mapper;

	/* 취업정보 전체 리스트	 */
	public List<Employment> selectEmpList() {
		System.out.println("main - service");
		return mapper.selectEmpList();
	}
}
