package com.spring.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@RequestMapping("/")
	public ModelAndView boardMain(ModelAndView modelAndView) {
		modelAndView.setViewName("/main");
		return modelAndView;
	}
}
