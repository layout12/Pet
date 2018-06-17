package com.spring.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.edu.service.AnswerBoardService;
import com.spring.edu.vo.AnswerBoardVo;
import com.spring.edu.vo.BoardCriteria;
import com.spring.edu.vo.BoardPaging;

@Controller
@RequestMapping("/answer/*")
public class testController {
    private static final Logger logger=LoggerFactory.getLogger(ReviewController.class);
    
    @Autowired
    private AnswerBoardService service;

    @RequestMapping(value="/answer", method=RequestMethod.GET)
    public String ajaxTest() {
        return "/answer/answer";
    }
}
