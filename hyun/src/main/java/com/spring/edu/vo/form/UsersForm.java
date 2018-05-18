package com.spring.edu.vo.form;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class UsersForm {

	   /*회원번호*/
	   private Integer uNo;
	   
	   /*회원아이디*/
	   @NotEmpty(message="아이디를 입력해주세요.")
	   private String uId;
	   
	   /*회원비밀번호*/
	   @NotEmpty(message="비밀번호를 입력해주세요.")
	   private String uPw;
	   
	   /*회원전화번호*/
	   @NotEmpty(message="전화번호를 입력해주세요.")
	   private String uPhone;
	   
	   /*회원이메일*/
	   @NotEmpty(message="이메일을 입력해주세요.")
	   private String uEmail;
	   
	   /*회원주소*/
	   @NotEmpty(message="주소를 입력해주세요.")
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
