package kr.co.flyingturtle.edu.user.attend.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.AttendMapper;
import kr.co.flyingturtle.repository.vo.Attend;


@Service("kr.co.flyingturtle.edu.user.attend.service")
public class AttendServiceImpl implements AttendService {
	@Autowired
	private AttendMapper mapper;
	
	public void insert(Attend attend) {
		mapper.insertAttendance(attend);
		// 성공 시 
		mapper.updateAttendance(attend.getAttendNo());
	}
}