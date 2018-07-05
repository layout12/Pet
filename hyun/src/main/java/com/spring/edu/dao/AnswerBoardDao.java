package com.spring.edu.dao;

import java.util.List;

import com.spring.edu.vo.AnswerBoardVo;
import com.spring.edu.vo.BoardCriteria;

public interface AnswerBoardDao {

    /*페이지 번호에 의한 댓글 리스트*/
    public List<AnswerBoardVo> listPaging(int brNo, BoardCriteria cri) throws Exception;
    
    /*댓글 생성*/
    public void create(AnswerBoardVo vo) throws Exception;
    
    /*댓글추가 생성*/
    public void createRe(AnswerBoardVo vo) throws Exception;
    
    /*댓글 수정*/
    public void update(AnswerBoardVo vo) throws Exception;
    
    /*댓글 삭제*/
    public void delete(int asNo) throws Exception;
    
    /*댓글 전체갯수*/
    public int count(int brNo) throws Exception;
    
    
}
