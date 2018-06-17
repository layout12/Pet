package com.spring.edu.dao;

import java.util.List;
import com.spring.edu.vo.BoardCriteria;
import com.spring.edu.vo.ReviewVo;
import com.spring.edu.vo.SearchCriteria;

public interface ReviewDao {

	/*게시글 생성*/
	public void create(ReviewVo vo)throws Exception;
		
	/*게시글 조회*/
	public ReviewVo read(int brNo)throws Exception;
	
	/*게시글 수정*/
	public void update(ReviewVo vo)throws Exception;
	
	/*게시글 삭제*/
	public void delete(int brNo)throws Exception;
	
	/*페이지 번호에 의한 게시글*/
	public List<ReviewVo> listPaging(BoardCriteria cri)throws Exception;
	
	/*전체 게시글 반환*/
	public int countPaging(BoardCriteria cri)throws Exception;
	
	/*게시글 검색*/
	public List<ReviewVo> listSearch(SearchCriteria cri)throws Exception;
	
	/*게시글 검색 후 리스트 갯수*/
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
	/*게시글 조회수 증가*/
    public void viewCnt(int brNo)throws Exception;
}
	
