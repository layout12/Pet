package com.spring.edu.controller;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.edu.service.ProductService;
import com.spring.edu.service.ScheduleService;
import com.spring.edu.vo.ProductVo;
import com.spring.edu.vo.ScheduleVo;
import com.spring.edu.vo.UsersVo;


/**
  * @FileName : ScheduleController.java
  * @Project : hyun
  * @Date : 2018. 6. 19. 
  * @작성자 : 이열
  * @변경이력 :
  * @프로그램 설명 :
  */
@Controller
public class ScheduleController {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private ScheduleService serviceSchedule;
	
	/**
	  * @Method Name : productSchedule
	  * @작성일 : 2018. 6. 19.
	  * @작성자 : 이열
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param modelAndView
	  * @return
	  */
	@RequestMapping(value="/admin/productSchedule")
	public ModelAndView productSchedule(ModelAndView modelAndView) {
		List<ScheduleVo> list = serviceSchedule.scheduleList();
		modelAndView.addObject("scheduleList",list);
		modelAndView.setViewName("admin/productSchedule.admin");
		return modelAndView;
	}

	@RequestMapping(value="/admin/ScheduleInsertForm", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> ScheduleInsertForm(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<UsersVo> list = serviceSchedule.userId();
		map.put("userList",list);
		List<ProductVo> pList = service.productList();	
		map.put("productList",pList);
		
		return map;
	}
	@ResponseBody
	@RequestMapping(value="/admin/insertSchedule", method=RequestMethod.POST)
	public ResponseEntity<String> insertSchedule(ScheduleVo scheduleVo, HttpServletResponse response){
		
		ResponseEntity<String> entity= null;
		serviceSchedule.scheduleInsert(scheduleVo);
		entity= new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		return entity;
		
	}
	@ResponseBody
	@RequestMapping(value="/admin/selectSchedulePdName", method=RequestMethod.POST, produces="application/text; charset=utf8")
	public String selectSchedulepdNo(HttpServletRequest request, HttpServletResponse response,@RequestParam int pdNo) throws Exception {
		int selectPdNo=pdNo;	
		String selectPdName = serviceSchedule.productName(selectPdNo);
		return selectPdName;
		
	}
	
}
