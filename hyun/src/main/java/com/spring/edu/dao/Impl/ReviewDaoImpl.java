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
		session.insert(namespace+"create",vo);
	}
	
	@Override
	public ReviewVo read(int brNo) throws Exception {
		return session.selectOne(namespace+"read",brNo);
	}
	
	@Override
	public void update(ReviewVo vo) throws Exception {
		session.update(namespace+"update",vo);
	}

	@Override
	public void delete(int brNo) throws Exception {
		session.delete(namespace+"delete",brNo);
	}

	@Override
	public List<ReviewVo> listAll() throws Exception {
		return session.selectList(namespace+"listAll");
		
	}

	
}
