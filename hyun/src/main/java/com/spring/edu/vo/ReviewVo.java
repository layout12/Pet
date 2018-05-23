package com.spring.edu.vo;

import java.util.Date;
import lombok.Data;

@Data
public class ReviewVo {
	
	/*게시판 번호*/
	private int brNo;
	
	/*게시판 아이디*/
	private String urId;
	
	/*게시판 제목*/
	private String brTitle;
	
	/*게시판 내용*/
	private String brContent;
	
	/*게시판 날짜*/
	private Date brDate;
	
	/*게시판 조회수*/
	private int brHits;
	
	/*게시판 부모번호(답글을 위한)*/
	private int brPrno;
	
	/*게시판 삭제여부*/
	private char brEn;
	
}

