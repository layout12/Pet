package com.spring.edu.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerBoardVo {

    /*댓글 번호*/
    private int asNo;
    
    /*댓글이 달릴 게시판 번호*/
    private int brNo;
    
    /*댓글의 댓글이 달릴 부모번호*/
    private int asPrno;
    
    /*댓글 아이디*/
    private String urId;
    
    /*댓글 내용*/
    private String asContent;
    
    /*댓글 날짜*/
    private Date asDate;
    
    /*댓글 수정 날짜*/
    private Date asUpdate;
    
    /*댓글 삭제여부*/
    private char asEn;    

}
