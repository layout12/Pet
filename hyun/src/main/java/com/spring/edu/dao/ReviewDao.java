package com.spring.edu.dao;

import java.util.List;

import com.spring.edu.vo.ReviewVo;

public interface ReviewDao {

	/*게시글 생성*/
	public void create(ReviewVo vo)throws Exception;
		
	/*게시글 조회*/
	public ReviewVo read(int brNo)throws Exception;
	
	/*게시글 수정*/
	public void update(ReviewVo vo)throws Exception;
	
	/*게시글 삭제*/
	public void delete(int brNo)throws Exception;
	
	/*게시글 객체 리스트*/
	List<ReviewVo> listAll()throws Exception;
	
}
