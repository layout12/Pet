package com.spring.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@RequestMapping("/")
	public ModelAndView boardMain(ModelAndView modelAndView) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>메인페이지접속");
		modelAndView.setViewName("/home");
		return modelAndView;
	}
	@RequestMapping("/board/shop")
	public ModelAndView boardShop(ModelAndView modelAndView) {
		modelAndView.setViewName("/board/shop");
		return modelAndView;
	}
}
