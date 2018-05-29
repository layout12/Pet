package com.spring.edu.service;

import java.util.List;

import com.spring.edu.vo.BoardCriteria;
import com.spring.edu.vo.ReviewVo;

public interface ReviewService {	

	/*게시글 생성*/
	public void regist(ReviewVo vo)throws Exception;
	
	/*게시글 조회*/
	public ReviewVo read(int brNo)throws Exception;
	
	/*게시글 수정*/
	public void update(ReviewVo vo)throws Exception;
	
	/*게시글 삭제*/
	public void delete(int brNo)throws Exception;
	
	/*페이지 번호에 의한 게시글*/
	public List<ReviewVo> listPaging(BoardCriteria cri) throws Exception;
	
	/*전체 게시글 반환*/
	public int countPaging(BoardCriteria cri)throws Exception;
	
}


