package kr.co.flyingturtle.edu.admin.attend.service;

import java.util.Map;

import kr.co.flyingturtle.repository.vo.Attend;

public interface AttendService {

	public Map<String, Object> list(Attend attend);
	
	public Map<String, Object> Daylist(Attend attend);
//	public void insert(Attend attend);
}
