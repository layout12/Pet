package com.spring.edu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.edu.service.ReviewService;
import com.spring.edu.vo.BoardCriteria;
import com.spring.edu.vo.BoardPaging;
import com.spring.edu.vo.ReviewVo;

@Controller
@RequestMapping("/review/*")
public class ReviewController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService service;
	
	/*게시글 페이징 적용*/
	@RequestMapping(value="/listPaging", method=RequestMethod.GET)
	public void listAll(@ModelAttribute("cri")BoardCriteria cri, Model model)throws Exception{
		logger.info(cri.toString());
		logger.info("리스트가 모두 보여짐..페이징도....");
		model.addAttribute("listAll", service.listPaging(cri));
		
		BoardPaging paging=new BoardPaging();
		paging.setCri(cri);
		paging.setTotalCount(service.countPaging(cri));
		
		model.addAttribute("paging", paging);
	}
	
	/*게시글  입력 폼*/
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerForm(ReviewVo vo, Model model)throws Exception{
		logger.info("입력 폼...........");
	}
	
	/*게시글 입력 완료*/
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String regist(ReviewVo vo, RedirectAttributes rttr)throws Exception{
		logger.info("입력");
		logger.info(vo.toString());		
		service.regist(vo);
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/review/listPaging";
	}
	
	/*게시글 조회*/
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("br_no")int brNo, @ModelAttribute("cri") BoardCriteria cri, Model model)throws Exception{
		model.addAttribute("read",service.read(brNo));
	}
	
	/*게시글 수정 폼*/
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public void updateForm(int brNo, @ModelAttribute("cri") BoardCriteria cri, Model model)throws Exception {
		model.addAttribute("update", service.read(brNo));
	}
	
	/*게시글 수정 완료*/
	@RequestMapping(value="/read", method=RequestMethod.POST)
	public String update(ReviewVo vo, BoardCriteria cri, RedirectAttributes rttr)throws Exception{
		logger.info("수정");
		
		service.update(vo);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","success");
		return "redirect:/review/listPaging";
	}
	
	/*게시글 삭제(완전 삭제가 아닌 삭제여부를(brEn) 'N'으로 변경*/
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(int brNo, @ModelAttribute("cri") BoardCriteria cri, RedirectAttributes rttr)throws Exception{
		logger.info("삭제?");
		service.delete(brNo);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addFlashAttribute("msg","success");
		return "redirect:/review/listPaging";
	}
}
