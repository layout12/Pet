package com.spring.edu.vo.form;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class UsersForm {

	   /*회원번호*/
	   private Integer urNo;
	   
	   /*회원아이디*/
	   @NotEmpty(message="아이디를 입력해주세요.")
	   private String urId;
	   
	   /*회원비밀번호*/
	   @NotEmpty(message="비밀번호를 입력해주세요.")
	   private String urPw;
	   
	   /*회원전화번호*/
	   @NotEmpty(message="전화번호를 입력해주세요.")
	   private String urPhone;
	   
	   /*회원이메일*/
	   @NotEmpty(message="이메일을 입력해주세요.")
	   private String urEmail;
	   
	   /*회원주소*/
	   @NotEmpty(message="주소를 입력해주세요.")
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
