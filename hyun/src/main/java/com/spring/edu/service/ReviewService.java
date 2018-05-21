package com.spring.edu.service;

import java.util.List;

import com.spring.edu.vo.ReviewVo;

public interface ReviewService {
	List<ReviewVo> listAll() throws Exception;
}
