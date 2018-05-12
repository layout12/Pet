package com.spring.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@RequestMapping("/")
	public ModelAndView main(Model model, ModelAndView modelAndView) {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>메인페이지접속");
		modelAndView.setViewName("index");
		
		return modelAndView;
	}
	
}
