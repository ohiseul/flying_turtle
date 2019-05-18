package kr.co.flyingturtle.repository.mapper;

import java.util.List;

import kr.co.flyingturtle.repository.vo.Video;

public interface VideoMapper {
	/*리스트*/
	List<Video> selectList();
	/*글하나*/
	Video selectByNo(int videoNo);
	/*등록*/
	void insert(Video video);
	/*수정*/
	void update(Video video);
	/*삭제*/
	void delete(int videoNo);
}
