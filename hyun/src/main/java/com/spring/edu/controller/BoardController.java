package com.spring.edu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/doA")
	public void doA() {
		logger.info("doA.......");
	}
	
	@RequestMapping("/doB")
	public void doB() {
		logger.info("doB.......");
	}
}
