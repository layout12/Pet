package com.spring.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.edu.service.ProductService;
import com.spring.edu.vo.ProductVo;

@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	
	@RequestMapping(value="/admin/product")
	public ModelAndView boardShop(ModelAndView modelAndView) {
		List<ProductVo> list =service.productList();
		modelAndView.addObject("productList",list);
		modelAndView.setViewName("/admin/productList");
		return modelAndView;
	}
}
