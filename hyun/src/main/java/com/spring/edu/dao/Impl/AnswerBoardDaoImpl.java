package com.spring.edu.dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.edu.dao.AnswerBoardDao;
import com.spring.edu.vo.AnswerBoardVo;
import com.spring.edu.vo.BoardCriteria;

@Repository
public class AnswerBoardDaoImpl implements AnswerBoardDao {
    
    @Autowired
    private SqlSessionTemplate session;
    private String namespace="answer.";
    
    @Override
    public List<AnswerBoardVo> listPaging(int brNo, BoardCriteria cri) throws Exception {
        
        Map<String,Object> map = new HashMap<>();
        map.put("brNo", brNo);
        map.put("cri", cri);
        
        return session.selectList(namespace+"listPaging",map);
    }    
  

    @Override
    public void create(AnswerBoardVo vo) throws Exception {
        session.insert(namespace+"create",vo);
    }
    
    
    @Override
    public void createRe(AnswerBoardVo vo) throws Exception {
        session.insert(namespace+"createRe",vo);        
    }


    @Override
    public void update(AnswerBoardVo vo) throws Exception {
        session.update(namespace+"update", vo);
    }

    @Override
    public void delete(int asNo) throws Exception {
        session.delete(namespace+"delete",asNo);
    }

    @Override
    public int count(int brNo) throws Exception {
        return session.selectOne(namespace+"count",brNo);
    }
    
}
