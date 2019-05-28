package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Canvas;

public interface CanvasMapper {
	// 과목명 전체 조회
	List<Canvas> selectListSubject();
	
	// 소과목명 전체 조회
	List<Canvas> selectListSmallSub();
	
	// 과목명 등록
	void insertSubject(Canvas canvas);
    
	//과목명 수정
    void updateSubject(Canvas canvas);
	
	// 소과목명 등록
	void insertSmallSubject(Canvas canvas);
	
	// 소과목명 수정
	void updateSmallSubject(Canvas canvas);
	
	// 소과목명 삭제
	void deleteSmallSubject(int ssbjNo);
}
