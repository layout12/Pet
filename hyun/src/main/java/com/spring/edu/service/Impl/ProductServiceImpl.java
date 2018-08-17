package com.spring.edu.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.edu.dao.ProductDao;
import com.spring.edu.service.ProductService;
import com.spring.edu.utill.Criteria;
import com.spring.edu.vo.ProductVo;
import com.spring.edu.vo.form.productForm;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao dao;
	
	@Override
	public List<ProductVo> productList() {
		return dao.productList();
	}

	@Override
	public int productInsert(productForm productVo) {
		return dao.productInsert(productVo);
	}

	@Override
	public ProductVo productDetail(int pdNo) {
		return dao.productDetail(pdNo);
	}

	@Override
	public int productUpdate(productForm productVo) {
		return dao.productUpdate(productVo);
	}

	@Override
	public int productCount(Criteria cri) {
		return dao.productCount(cri);
	}

	@Override
	public List<ProductVo> productPageing(Criteria cri) {
		return dao.productPageing(cri);
	}

	@Override
	public List<ProductVo> shopList(Criteria cri) {
		return dao.shopList(cri);
	}

	@Override
	public int productDelete(int pdNo) {
		return dao.productDelete(pdNo);
	}

	@Override
	public int shopCount(Criteria cri) {
		return dao.shopCount(cri);
	}



}
