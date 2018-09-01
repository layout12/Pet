# 애견분양 웹사이트 
> **라이센스 :

> **수행기간 :** 2018.05.29. ~ 2018.08.30.

>**프로젝트 구분 :** 팀 프로젝트(2명) / 기여도 50%

>**전담 역할 :** 게시판 및 댓글 DB생성, 게시판구현, 어드민페이지 화면단

## 사이트 설명
* 강아지를 분양하기 위해 소개하고 분양 받은 후, 가입한 회원을 토대로 분양후기를 알릴 수 있는 사이트
* 관리자는 회원을 관리하고 분양할 강아지들의 목록을 관리자화면에 주기적으로 업데이트 하며 각 목록들은 엑셀로 뽑을 수 있도록 함

![pet_01](https://user-images.githubusercontent.com/34294649/44942913-17a4be00-adf7-11e8-985a-150d384ca150.png)

![github_03_04](https://user-images.githubusercontent.com/34294649/44942918-255a4380-adf7-11e8-9b0f-0d6ddeb758e3.png)

![github_06](https://user-images.githubusercontent.com/34294649/44942922-2ee3ab80-adf7-11e8-88ae-e04eaeefe95e.png)

## 개발 환경
<pre>
window 10
sts-3.9.4.RELEASE(eclipse)
Oracle 11g
Apache-tomcat-8.0.47
Spring framework
</pre>

## 구현기술 및 설명
* Spring Framework 기반
* 게시판 CRUD로 구성하고 페이징처리, 검색기능 추가
* 게시글 번호는 오라클의 rownum 기능을 사용으로 페이징 처리와 페이징을 포함한 검색기능 추가
* 회원만 글쓰기,수정이 가능하고 로그인 및 회원가입은 인터셉터 설정으로 처리
* 각 게시글에 댓글추가를 할 수 있고, 대댓글이 가능하도록 부모글(원글),자식글(원글의 댓글)의 형태를 계층적으로 표현될 수 있도록 계층형 쿼리 알고리즘으로 구현
* 댓글은 CRUD를 각각 URI형태로 자원을 요청,응답 처리하는RESTful방식을 사용
