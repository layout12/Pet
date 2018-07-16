package com.spring.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.edu.service.AnswerBoardService;
import com.spring.edu.vo.AnswerBoardVo;
import com.spring.edu.vo.BoardCriteria;
import com.spring.edu.vo.BoardPaging;

@RestController
@RequestMapping("/answer")
public class AnswerBoardController {
    
    @Autowired
    private AnswerBoardService service;
    
    /**
      * @Method Name : register
      * @작성일 : 2018. 6. 4.
      * @작성자 : 이엄지
      * @Method 설명 :댓글 입력(ResponseEntity : 데이터 + statusCode)
      * @param vo
      * @return
      */
    @RequestMapping(value="",method=RequestMethod.POST)
    public ResponseEntity<String> register(@RequestBody AnswerBoardVo vo){
        
        ResponseEntity<String> entity=null;
        try {
            service.create(vo);
            entity=new ResponseEntity<String>("regSuccess",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
        }
        return entity;
    }
    
    /**
      * @Method Name : registerRe
      * @작성일 : 2018. 7. 6.
      * @작성자 : 이엄지
      * @Method 설명 : 댓글의 댓글추가 입력
      * @param asNo
      * @param vo
      * @return
      */
    @RequestMapping(value="/{brNo}/{asNo}",method= RequestMethod.POST)
    public ResponseEntity<String> registerRe(@PathVariable("brNo") int brNo, @PathVariable("asNo") int asNo, @RequestBody AnswerBoardVo vo){
        
        ResponseEntity<String> entity=null;
        try {           
            service.createRe(vo);
            entity=new ResponseEntity<String>("regSuccess2",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
        }
        return entity;
    }    
 
    /**
      * @Method Name : listPaging
      * @작성일 : 2018. 6. 11.
      * @작성자 : 이엄지
      * @Method 설명 : 페이징이 포함된 리스트
      *              RequestMapping에 있는 uri에 pathVariable어노테이션에 있는 변수를 포함해서 url형태를 만듬
      * @param brNo
      * @param page
      * @return
      */
    @RequestMapping(value="/list/{brNo}/{page}",method=RequestMethod.GET)
    public ResponseEntity<Map<String,Object>> listPaging(@PathVariable("brNo") int brNo, @PathVariable("page") int page){
        
        ResponseEntity<Map<String,Object>> entity=null;
        
        try {
           
            //BoardCriteria : 현재 조회하는 페이지와 한페이지에 나오는 게시물 수를 정의한 모델객체
            BoardCriteria cri = new BoardCriteria(); 
            cri.setPage(page);
            
            List<AnswerBoardVo> list = service.listPaging(brNo, cri);
            int answerCount=service.count(brNo);
            
            //BoardPaging : 전체 게시물 토대로 계산된 페이징 범위를 계산한 모델객체
            BoardPaging paging=new BoardPaging();
            paging.setCri(cri);
            paging.setTotalCount(answerCount);
            
            Map<String,Object> map=new HashMap<>();            
            map.put("list", list);
            map.put("paging", paging);            
                  
            entity=new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
            
        } catch (Exception e) {
            e.printStackTrace();
            entity=new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
        }
        
        return entity;
    }

    /**
      * @Method Name : update
      * @작성일 : 2018. 6. 5.
      * @작성자 : 이엄지
      * @Method 설명 : 댓글 수정
      * @param asNo
      * @param vo
      * @return
      */
    @RequestMapping(value="/update/{brNo}/{asNo}", method= RequestMethod.PATCH)
    public ResponseEntity<String> update(@PathVariable("asNo") int asNo, @RequestBody AnswerBoardVo vo){
        
        ResponseEntity<String> entity=null;
        try {
            vo.setAsNo(asNo);
            service.update(vo); 
            
            entity=new ResponseEntity<String>("modSuccess",HttpStatus.OK);
        }catch (Exception e) {
            e.printStackTrace();
            entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
        }
        
        return entity;
    }
    
    /**
      * @Method Name : delete
      * @작성일 : 2018. 6. 5.
      * @작성자 : 이엄지
      * @Method 설명 : 댓글 삭제(완전 삭제가 아닌 삭제여부를 (asEn) 'N'으로 변경
      * @param asNo
      * @return
      */
    @RequestMapping(value="/delete/{asNo}", method= {RequestMethod.PUT,RequestMethod.PATCH})
    public ResponseEntity<String> delete(@PathVariable("asNo") int asNo){
        ResponseEntity<String> entity=null;
        try {
            service.delete(asNo);
            entity=new ResponseEntity<String>("delSuccess",HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity=new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
        }
        
       return entity; 
    }
    

}
