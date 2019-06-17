package kr.co.flyingturtle.edu.user.attend.service;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Attend;

public interface AttendService {
//	일별 전체조회
//	public Map<String, Object> list(Attend attend);

//	입실 등록
	public void checkIn(Attend attend);
//	퇴실 등록
	public void checkOut(Attend attend);
//	입실체크
	public int isCheck(Attend attend);
	
	public List<Attend> attendList(Attend attend);
	
	public Attend selectCheckOut(Attend attend);
	
	public Attend attendCnt(int memberNo);
}
