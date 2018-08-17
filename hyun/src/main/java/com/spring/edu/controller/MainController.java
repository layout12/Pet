package com.spring.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.edu.service.ProductService;
import com.spring.edu.utill.Criteria;

@Controller
public class MainController {
	
	@Autowired
	private ProductService service;

	/**
	  * @Method Name : Main
	  * @작성일 : 2018. 7. 2.
	  * @작성자 : 유현재
	  * @변경이력 : 
	  * @Method 설명 : 메인페이지
	  * @param cri
	  * @param modelAndView
	  * @return
	  */
	@RequestMapping("/")
	public ModelAndView Main(@ModelAttribute("cri")Criteria cri, ModelAndView modelAndView) {
		cri.setPerPageNum(8);
		modelAndView.addObject("productList", service.shopList(cri));
		modelAndView.setViewName("/home");
		return modelAndView;
	}

}
