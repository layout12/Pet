package com.spring.edu.dao.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.edu.dao.ProductDao;
import com.spring.edu.utill.Criteria;
import com.spring.edu.vo.ProductVo;
import com.spring.edu.vo.form.productForm;
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

	@Override
	public int productInsert(productForm productVo) {
		int res = session.insert(namespace+"productInsert", productVo);
		return res;
	}

	@Override
	public ProductVo productDetail(int pdNo) {
		ProductVo res = session.selectOne(namespace+"productDetail", pdNo);
		return res;
	}

	@Override
	public int productUpdate(productForm productVo) {
		int res = session.update(namespace+"productUpdate", productVo);
		return res;
	}

	@Override
	public int productCount(Criteria cri) {
		int res =session.selectOne(namespace+"productCount",cri);
		return res;
	}

	@Override
	public List<ProductVo> productPageing(Criteria cri) {
		List<ProductVo> res =session.selectList(namespace+"productPageing",cri);
		return res;
	}

	@Override
	public List<ProductVo> shopList(Criteria cri) {
		List<ProductVo> res =session.selectList(namespace+"shopPageing",cri);
		return res;
	}

	@Override
	public int productDelete(int pdNo) {
		return session.update(namespace+"productDelete",pdNo);
	}

	@Override
	public int shopCount(Criteria cri) {
		return session.selectOne(namespace+"shopCount",cri);
	}

	
	

}
