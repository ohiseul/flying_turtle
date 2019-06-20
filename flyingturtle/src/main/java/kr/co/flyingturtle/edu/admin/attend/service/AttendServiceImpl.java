package kr.co.flyingturtle.edu.admin.attend.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	public Map<String, Object> list(){
		Map<String, Object> map = new HashMap<>();
		System.out.println("관리자서비스 옴");
		map.put("list",mapper.selectDayList());
		map.put("count",mapper.selectAllCount());
		map.put("attendCount",mapper.selectCount());
		map.put("chart",mapper.selectTimeCount());
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
//		map.put("chart",mapper.selectAjaxTimeCount(attend));
		return map;
	}
	
//	출석상태 변경
//	public void updateState(Attend attend) {
//		System.out.println("업데이트 서비스 왔음!");
//		Attend param = new Attend();
//		for(int i = 0; i<attend.getCheckArr().length;i++) {
//			param.setCodeNo(attend.getSelectArr()[i]);
//			param.setMemberNo(attend.getCheckArr()[i]);
//			param.setSpecialNote(attend.getMemoArr()[i]);
//			mapper.updateState(param);
//		}
//	}
	public Map<String, Object> updateState(Attend attend) {
		List<Attend> att = new ArrayList<>();	
		System.out.println("업데이트 서비스 왔음!");
		System.out.println(attend);
		Attend param = new Attend();
		for(int i = 0; i<attend.getCheckArr().length;i++) {
			param.setCodeNo(attend.getSelectArr()[i]);
			param.setMemberNo(attend.getCheckArr()[i]);
			param.setSpecialNote(attend.getMemoArr()[i] == null ? "" : attend.getMemoArr()[i]);
			param.setAttendRegDate(attend.getAttendRegDate());
			mapper.updateState(param);
			att.add(mapper.selectPersonAttend(param.getMemberNo()));
		}
		
		Map<String, Object> map = new HashMap<>();
		// member : 1명만보는거
//		map.put("list",mapper.selectPersonAttend(param.getMemberNo()));
		map.put("list", att);
		map.put("count",mapper.selectAjaxAllCount(param));
		map.put("addCount",mapper.selectAjaxCount(param));
		return map;
	}
	
//	public Map<String, Object> list(){
//		Map<String, Object> map = new HashMap<>();
//		System.out.println("서비스 옴");
//		map.put("list",mapper.selectDayList());
//		System.out.println(map);
//		return map;
//	}
	
	public Map<String, Object> monthList(Attend attend) {
		Map<String, Object> map = new HashMap<>();
		System.out.println("월별 서비스 옴");
		map.put("list",mapper.selectmonthList(attend));
		map.put("chart",mapper.selectmonthChart(attend));
		return map;
	}

	public List<Attend> adminAttendList(){
		return mapper.selectAttendAdminList();
	}
	public List<Attend> adminAttendChart() {
		return mapper.selectMainChart();
	}
}