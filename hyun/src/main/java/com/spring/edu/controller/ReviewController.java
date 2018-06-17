package com.spring.edu.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.edu.service.ReviewService;
import com.spring.edu.vo.BoardPaging;
import com.spring.edu.vo.ReviewVo;
import com.spring.edu.vo.SearchCriteria;

/**
  * @FileName : ReviewController.java
  * @Project : hyun
  * @Date : 2018. 5. 30. 
  * @작성자 : 이엄지
  * @프로그램 설명 :
  */
@Controller
@RequestMapping("/review/*")
public class ReviewController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService service;	
	
	/**
	  * @Method Name : listAll
	  * @작성일 : 2018. 5. 30.
	  * @작성자 : 이엄지
	  * @Method 설명 : 게시글 리스트
	  * @param scri
	  * @param model
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/listPaging", method=RequestMethod.GET)
	public String listAll(@ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception{
		logger.info(cri.toString());
		logger.info("리스트가 모두 보여짐..페이징도....");
		model.addAttribute("listAll", service.listSearch(cri));
		
		BoardPaging paging=new BoardPaging();
		paging.setCri(cri);
		paging.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("paging", paging);
		return "/review/listPaging";
	}
	
	/**
	  * @Method Name : registerForm
	  * @작성일 : 2018. 5. 30.
	  * @작성자 : 이엄지
	  * @Method 설명 : 게시글 생성 폼
	  * @param vo
	  * @param model
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String registerForm(ReviewVo vo, Model model)throws Exception{
	   	logger.info("입력 폼...........");
		return "/review/register";
	}
	
	/**
	  * @Method Name : regist
	  * @작성일 : 2018. 5. 30.
	  * @작성자 : 이엄지
	  * @Method 설명 :게시글 생성 완료
	  * @param vo
	  * @param rttr
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String regist(ReviewVo vo, RedirectAttributes rttr)throws Exception{
		logger.info("입력");
		logger.info(vo.toString());		
		service.regist(vo);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/review/listPaging";
	}
	
	/**
	  * @Method Name : read
	  * @작성일 : 2018. 5. 30.
	  * @작성자 : 이엄지
	  * @Method 설명 : 게시글 조회
	  * @param brNo
	  * @param cri
	  * @param model
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public ModelAndView read(@RequestParam("br_no")int brNo, @ModelAttribute("cri") SearchCriteria cri, HttpSession session)throws Exception{
	    service.viewCnt(brNo, session);
	    ModelAndView mv=new ModelAndView();
	    mv.setViewName("/review/read");
	    mv.addObject("read", service.read(brNo));
	    return mv;
	}
	
	/**
	  * @Method Name : updateForm
	  * @작성일 : 2018. 5. 31.
	  * @작성자 : 이엄지
	  * @Method 설명 : 게시글 수정 폼
	  * @param brNo
	  * @param cri
	  * @param model
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String updateForm(int brNo, @ModelAttribute("cri") SearchCriteria cri, Model model)throws Exception {
		model.addAttribute("read", service.read(brNo));
		return "redirect:/review/read";
	}

	/**
	  * @Method Name : update
	  * @작성일 : 2018. 5. 31.
	  * @작성자 : 이엄지
	  * @Method 설명 : 게시글 수정 완료
	  * @param vo
	  * @param cri
	  * @param rttr
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/read", method=RequestMethod.POST)
	public String update(ReviewVo vo, SearchCriteria cri, RedirectAttributes rttr)throws Exception{
		logger.info("수정");
		
		service.update(vo);
		
		//URL 뒤에 붙여서 보냄(GET방식으로 받는 것과 동일)
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    
	    //addFlashAttribute는 세션에 잠시 담았다가 redirect 후 소멸
		rttr.addFlashAttribute("msg","success");
		logger.info(rttr.toString());
		return "redirect:/review/listPaging";
	}
	
	/**
	  * @Method Name : delete
	  * @작성일 : 2018. 5. 31.
	  * @작성자 : 이엄지
	  * @Method 설명 : 게시글 삭제(완전 삭제가 아닌 삭제여부를(brEn) 'N'으로 변경
	  * @param brNo
	  * @param cri
	  * @param rttr
	  * @return
	  * @throws Exception
	  */
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(int brNo, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr)throws Exception{
		logger.info("삭제?");
		service.delete(brNo);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		rttr.addFlashAttribute("msg","success");
		return "redirect:/review/listPaging";
	}
}
