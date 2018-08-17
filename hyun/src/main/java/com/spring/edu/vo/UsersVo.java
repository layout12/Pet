package com.spring.edu.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UsersVo {
	
	/*회원번호*/
	private int urNo;
	
	/*회원아이디*/
	private String urId;
	
	/*회원비밀번호*/
	private String urPw;
	
	/*회원전화번호*/
	private String urPhone;
	
	/*회원이메일*/
	private String urEmail;
	
	/*회원주소*/
	private String urAddr;
	
	/*회원등록일*/
	private Date urRegdate;
	
	/*회원삭제일*/
	private Date urDropdate;
	
	/*회원등급*/
	private String urGrade;
	
	/*회원탈퇴여부*/
	private String urYn;

}
