package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Attend;

public interface AttendMapper {

//	일별출석 전체조회
	public List<Attend> selectDayList();

//	일별 날짜 선택 리스트
	public List<Attend> selectAjaxDayList(Attend attend);
	
//	입실 수정
	public void updateAttendance(int no);
	
//	입실 등록
	public void insertCheckIn(Attend attend);
	
//	퇴실 등록
//	public void insertCheckOut(Attend attend);
	
	public void updateCheckOut(Attend attend);
	
//	입실 체크
	public int selectAttendCheck(Attend attend);
	
//	일별 전체 인원 count
	public int selectAllCount();
	
	public int selectAjaxAllCount(Attend attend);
	
//	count
	public Attend selectCount();
	public Attend selectAjaxCount(Attend attend);

//	출석상태 변경
	public void updateState(Attend attend);
	
//	개인 출석목록
	public Attend selectPersonAttend(int memberNo);
	
//	월별 출석 리스트
	public List<Attend> selectmonthList(Attend attend);
	
//	월별 차트
	public List<Attend> selectmonthChart(Attend attend);
	
//	일별 차트
	public List<Attend> selectTimeCount();
	
//	사용자 출석 리스트
	public List<Attend> selectAttendList(Attend attend);

//  사용자 퇴실 확인
	public Attend selectAttend(Attend attend);
	
//	사용자 출석 횟수
	public Attend selectAttendCnt(int memberNo);
}
