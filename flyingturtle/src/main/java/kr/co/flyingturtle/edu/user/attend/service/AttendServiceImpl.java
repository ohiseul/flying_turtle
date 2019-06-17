package kr.co.flyingturtle.edu.user.attend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.flyingturtle.repository.mapper.AttendMapper;
import kr.co.flyingturtle.repository.vo.Attend;


@Service
public class AttendServiceImpl implements AttendService {
	@Autowired
	private AttendMapper mapper;
//	입실체크
	public int isCheck(Attend attend) {
		return mapper.selectAttendCheck(attend);
	}
//	입실
	public void checkIn(Attend attend) {
	
		mapper.insertCheckIn(attend);
			// 성공 시 
		mapper.updateAttendance(attend.getAttendNo());
	}
//	퇴실
	public void checkOut(Attend attend) {
		System.out.println("퇴실 버튼 서비스 옴");
//		mapper.insertCheckOut(attend);
		mapper.updateCheckOut(attend);
	}
	
	public List<Attend> attendList(Attend attend){
		return mapper.selectAttendList(attend);
	}
	public Attend selectCheckOut(Attend attend) {
		return mapper.selectAttend(attend);
	}

//	메인화면 출석횟수
	public Attend attendCnt(int memberNo) {
		return mapper.selectAttendCnt(memberNo);
	}
}