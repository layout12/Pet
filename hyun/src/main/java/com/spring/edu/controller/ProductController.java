package com.spring.edu.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.spring.edu.service.ProductService;
import com.spring.edu.utill.Criteria;
import com.spring.edu.utill.Paging;
import com.spring.edu.utill.ProductExcelDownload;
import com.spring.edu.vo.ProductVo;
import com.spring.edu.vo.form.productForm;

/**
  * @FileName : ProductController.java
  * @Project : 포트폴리오
  * @Date : 2018. 5. 27. 
  * @작성자 : 유현재
  * @변경이력 :
  * @프로그램 설명 : 상품 컨트롤러
  */
@Controller
public class ProductController {

	@Autowired
	private ProductService service;
	
	/**
	  * @Method Name : adminMain
	  * @작성일 : 2018. 5. 27.
	  * @작성자 : 유현재
	  * @변경이력 : 
	  * @Method 설명 : 관리자 페이지
	  * @param modelAndView
	  * @return
	  */
	@RequestMapping(value="/admin/main")
	public ModelAndView adminMain(ModelAndView modelAndView) {
		modelAndView.setViewName("admin/main.admin");
		return modelAndView;
	}
	
	/**
	  * @Method Name : productAdminList
	  * @작성일 : 2018. 5. 27.
	  * @작성자 : 유현재
	  * @변경이력 : 페이징 추가
	  * @Method 설명 : 상품 리스트
	  * @param modelAndView
	  * @return
	  */
	@RequestMapping(value="/admin/productAdmin")
	public ModelAndView productAdminList(@ModelAttribute("cri")Criteria cri, ModelAndView modelAndView) {
		modelAndView.addObject("productList", service.productPageing(cri));
		Paging paging=new Paging();
		paging.setCri(cri);
		paging.setTotalCount(service.productCount(cri));
		
		modelAndView.addObject("paging", paging);
		modelAndView.setViewName("admin/productAdminList.admin");
		return modelAndView;
	}
	
	/**
	  * @Method Name : productAdminDetail
	  * @작성일 : 2018. 5. 27.
	  * @작성자 : 유현재
	  * @변경이력 : 
	  * @Method 설명 : 상품 상세보기
	  * @param modelAndView
	  * @param pdNo
	  * @return
	  */
	@RequestMapping(value="/admin/productAdminDetail")
	public ModelAndView productAdminDetail(ModelAndView modelAndView, @RequestParam("pdNo") int pdNo) {
		ProductVo detail = service.productDetail(pdNo);
		modelAndView.addObject("productDetail",detail);
		modelAndView.setViewName("admin/productAdminDetail.admin");
		return modelAndView;
	}
	
	/**
	  * @Method Name : productWrite
	  * @작성일 : 2018. 5. 27.
	  * @작성자 : 유현재
	  * @변경이력 : 
	  * @Method 설명 : 상품 등록 페이지
	  * @param modelAndView
	  * @return
	  */
	@RequestMapping(value="/admin/productWrite")
	public ModelAndView productWrite(ModelAndView modelAndView) {
		modelAndView.setViewName("admin/productWrite.admin");
		return modelAndView;
	}
	
	/**
	  * @Method Name : productWrite
	  * @작성일 : 2018. 5. 27.
	  * @작성자 : 유현재
	  * @변경이력 : 파일 업로드 유효성처리 수정
	  * @Method 설명 : 상품 등록
	  * @param file
	  * @param request
	  * @param productVo
	  * @param result
	  * @return
	  */
	@RequestMapping(value = "/admin/productWriterAfter", method=RequestMethod.POST)
	public ModelAndView productWriteAfter(@RequestParam("productImg") MultipartFile file
	        ,@ModelAttribute @Valid productForm productVo, BindingResult result){

		/*vo에 validation 설정한것과 다를때 에러 메세지와함께 글쓰기폼으로 이동*/
		if(result.hasErrors()) {
			 ModelAndView modelAndView = new ModelAndView();
			 if (file.isEmpty()) {
			 modelAndView.addObject("imgError","이미지를 등록해주세요.");
			 }
			 modelAndView.setViewName("admin/productWrite.admin");
			 return modelAndView;
		}
		
		ModelAndView modelAndView = new ModelAndView();
		/*파일업로드*/
		if (!file.isEmpty()) {
		/*파일 이름 스트림에 담기*/
		String name = file.getOriginalFilename();
		byte[] bytes;
		try {
			bytes = file.getBytes();
			/*파일 저장경로 System.getProperty("catalina.home")부분은 톰캣 환경변수 경로입니다*/
			String rootPath = System.getProperty("catalina.home");
			File dir = new File(rootPath + File.separator + "tmpFiles");
			/*만약 폴더가 존재하지 않는다면 폴더생성*/
			if (!dir.exists())
				dir.mkdirs();
			/*서버에 파일 업로드 경로*/
			File serverFile = new File(dir.getAbsolutePath()+ File.separator + name);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			/*productImg이름으로 가져온 파일 명을 PdImg vo에 스트링으로 저장 */
		    productVo.setPdImg(file.getOriginalFilename().toString());
		    /*DB에 저장*/
		    service.productInsert(productVo);
		} catch (IOException e) {
				e.getStackTrace();
		}
			/*문제가 없을시 상품페이지로이동*/
			modelAndView.setViewName("redirect:/admin/productAdmin");
		}else {
			/*파일이 없다면 에러메세지와 함께 글쓰기폼으로 이동*/
			modelAndView.addObject("imgError","이미지를 등록해주세요.");
			modelAndView.setViewName("admin/productWrite.admin");
		}
		
	    return modelAndView;
	}
	
	/**
	  * @Method Name : productUpdate
	  * @작성일 : 2018. 5. 27.
	  * @작성자 : 유현재
	  * @변경이력 : 
	  * @Method 설명 : 상품 수정페이지
	  * @param modelAndView
	  * @param pdNo
	  * @return
	  */
	@RequestMapping(value="/admin/productUpdate")
	public ModelAndView productUpdate(ModelAndView modelAndView, @RequestParam("pdNo") int pdNo) {
		ProductVo detail = service.productDetail(pdNo);
		modelAndView.addObject("productDetail",detail);
		modelAndView.setViewName("admin/productUpdate.admin");
		return modelAndView;
	}
	
	/**
	  * @Method Name : productUpdateAfter
	  * @작성일 : 2018. 5. 27.
	  * @작성자 : 유현재
	  * @변경이력 : 파일 업로드 유효성처리 수정
	  * @Method 설명 : 상품 수정
	  * @param file
	  * @param request
	  * @param productVo
	  * @param result
	  * @return
	  */
	@RequestMapping(value = "/admin/productUpdateAfter", method=RequestMethod.POST)
	public ModelAndView productUpdateAfter(@RequestParam("productImg") MultipartFile file
	        ,HttpServletRequest request
	        ,@ModelAttribute @Valid productForm productVo, BindingResult result)  {
	     
		if(result.hasErrors()) {
			 ModelAndView modelAndView = new ModelAndView();
			 if (file.isEmpty()) {
				 modelAndView.addObject("imgError","이미지를 등록해주세요.");
				 }
			 modelAndView.setViewName("admin/productUpdate.admin?pdNo="+productVo.getPdNo());
			 return modelAndView;
		}
		ModelAndView modelAndView = new ModelAndView();
		if (!file.isEmpty()) {
		String name = file.getOriginalFilename();
		byte[] bytes;
		try {
			bytes = file.getBytes();
			String rootPath = System.getProperty("catalina.home");  
			File dir = new File(rootPath + File.separator + "tmpFiles");
			if (!dir.exists())
				dir.mkdirs();

			File serverFile = new File(dir.getAbsolutePath()+ File.separator + name);
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
			stream.write(bytes);
			stream.close();
			productVo.setPdImg(file.getOriginalFilename().toString());
		    service.productUpdate(productVo);
		} catch (IOException e) {
			e.printStackTrace();
			
		}
			modelAndView.setViewName("redirect:/admin/productAdmin.admin");
		}else {
			if(productVo.getPdImg()==""){
				modelAndView.addObject("imgError","이미지를 등록해주세요.");
				modelAndView.setViewName("admin/productUpdate.admin?pdNo="+productVo.getPdNo());
			}else {
				service.productUpdate(productVo);
				modelAndView.setViewName("redirect:/admin/productAdmin.admin");
			}

		}

	    return modelAndView;
	}
	
	/**
	  * @Method Name : productExcelDownload
	  * @작성일 : 2018. 5. 27.
	  * @작성자 : 유현재
	  * @변경이력 : 
	  * @Method 설명 : 상품리스트 엑셀 다운로드
	  * @param model
	  * @return
	  */
	@RequestMapping(value="/admin/product/productExcelDownload")
	public View productExcelDownload(Model model) {
		List<ProductVo> List = service.productList(); 
		/*엑셀 다운로드 메서드에 모델에 담은 값*/
		model.addAttribute("List", List);
		
		return (View) new ProductExcelDownload();
	}
	
	/**
	  * @Method Name : productDelete
	  * @작성일 : 2018. 7. 3.
	  * @작성자 : 유현재
	  * @변경이력 : 
	  * @Method 설명 : 상품 분양 완료
	  * @param modelAndView
	  * @param pdNo
	  * @return
	  */
	@RequestMapping(value="/admin/productDelete")
	public ModelAndView productDelete(ModelAndView modelAndView, @RequestParam("pdNo") int pdNo) {
		service.productDelete(pdNo);
		modelAndView.setViewName("redirect:/admin/productAdmin");
		return modelAndView;
	}
	
	/**
	  * @Method Name : productDetail
	  * @작성일 : 2018. 7. 2.
	  * @작성자 : 유현재
	  * @변경이력 : 
	  * @Method 설명 : 상품 상세보기
	  * @param modelAndView
	  * @param pdNo
	  * @return
	  */
	@RequestMapping(value="/product/detail")
	public ModelAndView productDetail(ModelAndView modelAndView, @RequestParam("pdNo") int pdNo) {
		ProductVo detail = service.productDetail(pdNo);
		modelAndView.addObject("productDetail",detail);
		modelAndView.setViewName("/product/productDetail");
		return modelAndView;
	}
	/**
	  * @Method Name : productList
	  * @작성일 : 2018. 7. 2.
	  * @작성자 : 유현재
	  * @변경이력 : 
	  * @Method 설명 : 상품 리스트
	  * @param cri
	  * @param modelAndView
	  * @return
	  */
	@RequestMapping(value="/product/shop")
	public ModelAndView productList(@ModelAttribute("cri")Criteria cri, ModelAndView modelAndView) {
		cri.setPerPageNum(9);
		modelAndView.addObject("productList", service.shopList(cri));
		Paging paging=new Paging();
		paging.setCri(cri);
		paging.setTotalCount(service.shopCount(cri));
		modelAndView.addObject("paging", paging);
		modelAndView.setViewName("/product/shop");
		return modelAndView;
	}
	

}
