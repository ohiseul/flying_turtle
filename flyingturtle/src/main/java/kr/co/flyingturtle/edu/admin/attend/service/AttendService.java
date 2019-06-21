package kr.co.flyingturtle.edu.admin.attend.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Attend;

public interface AttendService {

	public Map<String, Object> list();
	
	public Map<String, Object> Daylist(Attend attend);
//	public void insert(Attend attend);
	
//	출석상태 변경
	public Map<String, Object> updateState(Attend attend);
//	public void updateState(Attend attend);
	
	public Map<String, Object> monthList(Attend attend);
	
//	관리자 메인 출석
	public List<Attend> adminAttendList();
	public List<Attend> adminAttendChart();
	

	
}
