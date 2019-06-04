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
		System.out.println("관리자서비스 옴");
		map.put("list",mapper.selectDayList(attend));
		map.put("count",mapper.selectAllCount(attend));
		map.put("attendCount",mapper.selectCount(attend));
		System.out.println(mapper.selectCount(attend));
		return map;
	}
	
//	날짜별로 일별출석 조회
	@Override
	public Map<String, Object> Daylist(Attend attend){
		System.out.println("checkIn"+attend.getCheckIn());
		System.out.println(mapper.selectAjaxDayList(attend));
		Map<String, Object> map = new HashMap<>();
		map.put("list",mapper.selectAjaxDayList(attend));
		map.put("count",mapper.selectAjaxAllCount(attend));
		map.put("addCount",mapper.selectAjaxCount(attend));
		return map;
	}
	
//	출석상태 변경
	public void updateState(Attend attend) {
		System.out.println("업데이트 서비스 왔음!");
		Attend param = new Attend();
		for(int i = 0; i<attend.getCheckArr().length;i++) {
			param.setCodeNo(attend.getSelectArr()[i]);
			param.setMemberNo(attend.getCheckArr()[i]);
			param.setSpecialNote(attend.getMemoArr()[i]);
			mapper.updateState(param);
		}
	}
	
//	public Map<String, Object> list(){
//		Map<String, Object> map = new HashMap<>();
//		System.out.println("서비스 옴");
//		map.put("list",mapper.selectDayList());
//		System.out.println(map);
//		return map;
//	}
}