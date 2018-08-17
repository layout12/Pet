package com.spring.edu.vo;

import lombok.Data;

@Data
public class ScheduleVo {
	
	/*스케줄번호*/
	private int scheNo;
	
	/*회원아이디*/
	private String urId;
	
	/*상품번호*/
	private int pdNo;
	
	/*상품이름*/
	private String pdName;
	
	/*상품분양유무*/
	private String pdSale;
	
	/*상품분양일*/
	private String pdSaleDate;
	
	/*상품분양시간*/
	private int pdSaleTime;
	
	/*상품분양장소*/
	private String pdSaleAddr;
	
	/*상품분양메모*/
	private String pdSaleContent;

}
