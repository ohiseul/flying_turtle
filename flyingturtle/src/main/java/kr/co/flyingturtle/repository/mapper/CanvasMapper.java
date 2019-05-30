package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Canvas;
import kr.co.flyingturtle.repository.vo.Page;

public interface CanvasMapper {
//과목================================================
	/**과목명 전체 조회*/
	List<Canvas> selectListSubject();
	
	/** 소과목명 전체 조회*/
	List<Canvas> selectListSmallSub();
	
	/** 과목명 등록*/
	void insertSubject(Canvas canvas);
    
	/**과목명 수정*/
    void updateSubject(Canvas canvas);
	
	/** 소과목명 등록*/
	void insertSmallSubject(Canvas canvas);
	
	/** 소과목명 수정*/
	void updateSmallSubject(Canvas canvas);
	
	/** 소과목명 삭제*/
	void deleteSmallSubject(int ssbjNo);
	
//이미지================================================	
	/** 이미지 등록*/
	void insertCanvas(Canvas canvas);
	/** 이미지 전체 가져오기*/
	List<Canvas> selectCanvas(Page page);
	/** 이미지 하나 가져오기*/
	List<Canvas> selectCanvasByNo(int canNo);
	/** 이미지 수정*/
	void updateCanvas(Canvas canvas);
	/** 이미지 삭제*/
	void deleteCanvas(int canNo);
	/**이미지 과목에 맞는 총 갯수*/
	int selectCount(int ssbjNo);
//임시저장================================================		
	/** 이미지 번호에 맞는 임시저장 가져오기*/
	Canvas selectTemByNo(int saveNo);
	/** 임시저장 생성*/
	void insertTem(Canvas canvas);
	/** 임시저장 수정*/
	void updateTem(Canvas canvas);
	/** 임시저장 삭제*/
	void deleteTem(int saveNo);
}
