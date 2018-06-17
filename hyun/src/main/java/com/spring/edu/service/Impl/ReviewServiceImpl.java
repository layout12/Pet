package com.spring.edu.service.Impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.edu.dao.ReviewDao;
import com.spring.edu.service.ReviewService;
import com.spring.edu.vo.AnswerBoardVo;
import com.spring.edu.vo.BoardCriteria;
import com.spring.edu.vo.ReviewVo;
import com.spring.edu.vo.SearchCriteria;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    private ReviewDao dao;

    @Override
    public void regist(ReviewVo vo) throws Exception {
        dao.create(vo);
    }

    @Override
    public ReviewVo read(int brNo) throws Exception {
        return dao.read(brNo);
    }

    @Override
    public void update(ReviewVo vo) throws Exception {
        dao.update(vo);
    }

    @Override
    public void delete(int brNo) throws Exception {
        dao.delete(brNo);
    }

    @Override
    public List<ReviewVo> listPaging(BoardCriteria cri) throws Exception {
        return dao.listPaging(cri);
    }  

    @Override
    public int countPaging(BoardCriteria cri) throws Exception {
        return dao.countPaging(cri);
    }

    @Override
    public List<ReviewVo> listSearch(SearchCriteria cri) throws Exception {
        return dao.listSearch(cri);
    }

    @Override
    public int listSearchCount(SearchCriteria cri) throws Exception {
        return dao.listSearchCount(cri);
    }

    @Override
    public void viewCnt(int brNo, HttpSession session) throws Exception {       
        dao.viewCnt(brNo);
    };


}
