package com.spring.edu.vo;

import java.util.Date;
import lombok.Data;

@Data
public class ReviewVo {
	
	/*게시판 번호*/
	private int br_no;
	
	/*게시판 아이디*/
	private String ur_id;
	
	/*게시판 제목*/
	private String br_title;
	
	/*게시판 내용*/
	private String br_content;
	
	/*게시판 날짜*/
	private Date br_date;
	
	/*게시판 조회수*/
	private int br_hits;
	
	/*게시판 부모번호(답글을 위한)*/
	private int br_prno;
	
	/*게시판 삭제여부*/
	private char br_en;
}
