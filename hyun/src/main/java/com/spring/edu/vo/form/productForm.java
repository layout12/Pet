package com.spring.edu.vo.form;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class productForm {
	
	/*상품번호*/
	private Integer pdNo;
	
	/*상품이름*/
	@NotEmpty(message="이름을 입력해주세요.")
	private String pdName;

	/*상품성별*/
	@NotEmpty(message="성별을 선택해주세요.")
	private String pdGender;
	
	/*상품품종*/
	@NotEmpty(message="품종을 입력해주세요.")
	private String pdKind;
	
	/*상품가격*/
	@NotNull(message="가격을 입력해주세요.")
	private Integer pdPrice;
	
	/*상품분양유무*/
	@NotEmpty(message="분양유무를 선택해주세요.")
	private String pdSale;
	
	/*상품예방접종*/
	@NotEmpty(message="예방접종을 선택해주세요.")
	private String pdVaccine;
	
	/*상품생년월일*/
	@NotEmpty(message="생년월일을 입력해주세요.")
	private String pdBirth;
	
	/*상품이미지*/
	private String pdImg;
	
	/*상품등록일*/
	private Date pdRegdate;

}
