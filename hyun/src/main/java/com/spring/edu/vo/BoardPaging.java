package com.spring.edu.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class BoardPaging {

    /* 전체 페이지 수 */
    private int totalCount;

    /* 첫번째 페이지 수 */
    private int startPage;

    /* 마지막 페이지 수 */
    private int endPage;

    /* 이전 페이지 */
    private boolean prev;

    /* 다음 페이지 */
    private boolean next;

    /* 한번에 보여지는 페이징 번호 범위(1~10,11~20...) */
    private int displayPageNum = 10;

    /* 화면에 보여지는 게시물 기준 vo객체 */
    private BoardCriteria cri;
    

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;

        calcData();
    }

    private void calcData() {
        /* 끝페이지 = (현재페이지 / 한번에 출력되는 게시물)* 한번에 출력되는 게시물 */
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

        /* 시작페이지 = (끝페이지-한번에 출력되는 게시물)+1 -> 1,11,21..이런식으로 시작 */
        startPage = (endPage - displayPageNum) + 1;

        /* 전체 페이지 번호 수 = 전체게시물/한페이지당 출력하는 게시물 */
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage == 1 ? false : true;
        next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
    }

    /* path나 query에 해당하는 문자열들을 추가해서 원하는 URI를 생성 -> page=3&perPageNum=10이런식으로 뺄거임 */
    /* listPaging.jsp 목록에 해당 메소드 호출 (주소형태:현재 페이지& 한페이지당 나오는 리스트개수)*/
    public String makeQuery(int page) {
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("perPageNum", cri.getPerPageNum()).build();
        return uriComponents.toUriString();
    }

    /* listPaging.jsp 목록에 해당 메소드 호출 (주소형태:현재페이지&한페이지당 나오는 리스트 개수&검색유형&검색어)*/
    public String makeSearch(int page) {
        UriComponents uriComponents= UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("perPageNum", cri.getPerPageNum())
                .queryParam("searchType", ((SearchCriteria) cri).getSearchType())
                .queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword())).build();
        return uriComponents.toUriString();
    }

    private String encoding(String keyword) {
        if (keyword == null || keyword.trim().length() == 0) {
            return "";
        }
        try {
            return URLEncoder.encode(keyword, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }
}
