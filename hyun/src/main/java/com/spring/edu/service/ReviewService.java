package com.spring.edu.service;

import java.util.List;

import com.spring.edu.vo.ReviewVo;

public interface ReviewService {
	
	/*게시글 객체 리스트*/
	List<ReviewVo> listAll() throws Exception;
	
	/*게시글 생성*/
	public void regist(ReviewVo vo)throws Exception;
	
	/*게시글 조회*/
	/*게시글 수정*/
	/*게시글 삭제*/
}


