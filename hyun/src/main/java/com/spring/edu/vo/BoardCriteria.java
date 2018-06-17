package com.spring.edu.vo;

import lombok.Data;

@Data
public class BoardCriteria {

	/*현재 조회하는 페이지 번호*/
	private int page;
	
	/*한 페이지당 출력하는 게시물 개수*/
	private int perPageNum;
	
	public BoardCriteria() { //최초 default 생성자
		this.page=1;  //사용자가 세팅하지 않으면 기본 1
		this.perPageNum=10;  //한 페이지당 기본 10개 출력
	}
	
	public void setPage(int page) {
		if(page<=0) {
		    //0보다 작거나 같은 값을 경우 무조건 첫번째 페이지가 나오도록 1로 설정
			this.page=1;
			return;
		}
		this.page=page;
	}
	
	/*고의로 페이지당 나오는 갯수 조작 가능성에 제한을 둠*/
	public void setPerPageNum(int perPageNum) {
		if(perPageNum<=0  || perPageNum > 100) {
			this.perPageNum=10;
			return;
		}
		this.perPageNum=perPageNum;
	}
	
	/*시작 위치를 지정하기 위한 계산 공식*/
	public int getPageStart() {
	    return this.page*perPageNum-9;
	}
}
