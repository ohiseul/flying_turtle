package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Attend;

public interface AttendMapper {

//	일별출석 전체조회
//	public List<Attend> selectDayList();
	
	public List<Attend> selectDayList(Attend attend);


	

}
