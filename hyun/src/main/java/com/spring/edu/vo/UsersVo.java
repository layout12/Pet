package com.spring.edu.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UsersVo {
	
	/*회원번호*/
	private int uNo;
	
	/*회원아이디*/
	private String uId;
	
	/*회원비밀번호*/
	private String uPw;
	
	/*회원전화번호*/
	private String uPhone;
	
	/*회원이메일*/
	private String uEmail;
	
	/*회원주소*/
	private String uAddr;
	
	/*회원등록일*/
	private Date uRegdate;
	
	/*회원삭제일*/
	private Date uDropdate;
	
	/*회원등급*/
	private String uGrade;
	
	/*회원탈퇴여부*/
	private String uYn;

}
