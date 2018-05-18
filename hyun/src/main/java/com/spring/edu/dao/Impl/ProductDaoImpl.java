package com.spring.edu.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.edu.dao.ProductDao;
import com.spring.edu.vo.ProductVo;
@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SqlSessionTemplate session;
	private String namespace ="product.";
	
	@Override
	public List<ProductVo> productList() {
		List<ProductVo> list = session.selectList(namespace+"productList");
		return list;
	}
	

}
