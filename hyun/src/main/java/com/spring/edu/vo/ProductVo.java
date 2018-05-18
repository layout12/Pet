package com.spring.edu.vo;

import java.util.Date;
import lombok.Data;

@Data
public class ProductVo {
	
	/*상품번호*/
	private int pdNo;
	
	/*상품이름*/
	private String pdName;

	/*상품성별*/
	private String pdGender;
	
	/*상품품종*/
	private String pdKind;
	
	/*상품가격*/
	private int pdPrice;
	
	/*상품분양유무*/
	private String pdSale;
	
	/*상품예방접종*/
	private String pdVaccine;
	
	/*상품생년월일*/
	private String pdBirth;
	
	/*상품이미지*/
	private String pdImg;
	
	/*상품등록일*/
	private Date pdRegdate;
	

}
