package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Attend;

public interface AttendMapper {

//	일별출석 전체조회
	public List<Attend> selectDayList(Attend attend);

//	일별 날짜 선택 리스트
	public List<Attend> selectAjaxDayList(Attend attend);
	
//	입실 수정
	public void updateAttendance(int no);
	
//	입실 등록
	public void insertCheckIn(Attend attend);
	
//	퇴실 등록
	public void updateCheckOut(Attend attend);
	
//	입실 체크
	public int selectAttendCheck(Attend attend);
	
//	일별 전체 인원 count
	public int selectAllCount(Attend attend);
	
	public int selectAjaxAllCount(Attend attend);
	
//	count
	public Attend selectCount(Attend attend);
	public Attend selectAjaxCount(Attend attend);

	

}
