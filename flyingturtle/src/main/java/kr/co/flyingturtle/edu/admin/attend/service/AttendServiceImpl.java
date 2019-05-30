package kr.co.flyingturtle.edu.admin.attend.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.AttendMapper;
import kr.co.flyingturtle.repository.vo.Attend;


@Service("kr.co.flyingturtle.edu.admin.attend.service")
public class AttendServiceImpl implements AttendService {
	@Autowired
	private AttendMapper mapper;
	

//	일별출석 조회
	public Map<String, Object> list(Attend attend){
		Map<String, Object> map = new HashMap<>();
		System.out.println("서비스 옴");
		map.put("list",mapper.selectDayList(attend));
		return map;
	}
//	public Map<String, Object> list(){
//		Map<String, Object> map = new HashMap<>();
//		System.out.println("서비스 옴");
//		map.put("list",mapper.selectDayList());
//		System.out.println(map);
//		return map;
//	}
	
	public void insert(Attend attend) {
		mapper.insertAttendance(attend);
		// 성공 시
		mapper.updateAttendance(attend.getMemberNo());
	}
}