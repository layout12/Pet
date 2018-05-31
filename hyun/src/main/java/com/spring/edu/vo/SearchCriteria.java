package com.spring.edu.vo;

import lombok.Data;

@Data
public class SearchCriteria extends BoardCriteria{
	
	/*검색 조건*/
	private String searchType;
	
	/*검색 키워드*/
	private String keyword;
}
