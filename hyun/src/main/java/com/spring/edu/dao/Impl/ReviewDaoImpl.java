package com.spring.edu.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.edu.dao.ReviewDao;
import com.spring.edu.vo.ReviewVo;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSessionTemplate session;
	private String namespace="review.";

	@Override
	public void create(ReviewVo vo) throws Exception {
		
	}

	@Override
	public ReviewVo read(Integer br_no) throws Exception {
		return null;
	}

	@Override
	public void update(ReviewVo vo) throws Exception {
		
	}

	@Override
	public void delete(Integer br_no) throws Exception {
		
	}

	@Override
	public List<ReviewVo> listAll() throws Exception {
		List<ReviewVo> list = session.selectList(namespace+"listAll");
		return list;
	}
	
}
