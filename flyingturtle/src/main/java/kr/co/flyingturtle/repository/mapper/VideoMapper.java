package kr.co.flyingturtle.repository.mapper;

import java.util.List;
import java.util.Map;

import kr.co.flyingturtle.repository.vo.Page;
import kr.co.flyingturtle.repository.vo.Video;
import kr.co.flyingturtle.repository.vo.VideoCom;

public interface VideoMapper {
	/*리스트*/
	List<Video> selectList(Page page);
	/*글하나*/
	Video selectByNo(int videoNo);
	/*등록*/
	void insert(Video video);
	/*수정*/
	void update(Video video);
	/*삭제*/
	void delete(int videoNo);
/*비디오 주소를 얻어오기 위한 것*/	
	List<Video> selectListAddr(Page page);
	
	int selectCount();
	void viewCntPlus();
	


//댓글===============================================
		/*댓글리스트*/
		List<VideoCom> listCom(int videoNo);
		/*댓글 하나*/
		VideoCom selectComByNo(int comNo);
		/*댓글 등록*/
		void insertCom(VideoCom videoNo);
		/*댓글 수정*/
		void updateCom(VideoCom videoNo);
		/*댓글 삭제*/
		void deleteCom(int comNo);
		
}
