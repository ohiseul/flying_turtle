package kr.co.flyingturtle.edu.admin.attend.service;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Attend;

public interface AttendService {

	public Map<String, Object> list(Attend attend);
	
	public List<Attend> Daylist(Attend attend);
//	public void insert(Attend attend);
}
