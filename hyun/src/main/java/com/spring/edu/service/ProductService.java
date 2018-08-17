package com.spring.edu.service;

import java.util.List;

import com.spring.edu.utill.Criteria;
import com.spring.edu.vo.ProductVo;
import com.spring.edu.vo.form.productForm;

public interface ProductService {

	List<ProductVo> productList();
	int productInsert(productForm productVo);
	ProductVo productDetail(int pdNo);
	int productUpdate(productForm productVo);
	int productCount(Criteria cri);
	List<ProductVo> productPageing(Criteria cri);
	List<ProductVo> shopList(Criteria cri);
	int productDelete(int pdNo);
	int shopCount(Criteria cri);
}
