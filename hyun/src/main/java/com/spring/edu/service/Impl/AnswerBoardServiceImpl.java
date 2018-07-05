package com.spring.edu.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.edu.dao.AnswerBoardDao;
import com.spring.edu.service.AnswerBoardService;
import com.spring.edu.vo.AnswerBoardVo;
import com.spring.edu.vo.BoardCriteria;

@Service
public class AnswerBoardServiceImpl implements AnswerBoardService{
    
    @Autowired
    private AnswerBoardDao dao;

    @Override
    public List<AnswerBoardVo> listPaging(int brNo, BoardCriteria cri) throws Exception {
        return dao.listPaging(brNo,cri);
    }

    @Override
    public int count(int brNo) throws Exception {
        return dao.count(brNo);
    }
 
    @Override
    public void create(AnswerBoardVo vo) throws Exception {
        dao.create(vo);
    }     

    @Override
    public void createRe(AnswerBoardVo vo) throws Exception {
        dao.createRe(vo);
    }

    @Override
    public void update(AnswerBoardVo vo) throws Exception {
        dao.update(vo);
    }

    @Override
    public void delete(int asNo) throws Exception {
        dao.delete(asNo);
    }    


    
}
