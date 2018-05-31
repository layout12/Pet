<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DOG CAT</title>
<script type="text/javascript">
	$(function() {	
		/*수정,삭제 완료 후 공통 메시지*/
		var result='${msg}';
		
		if(result=='success'){
			alert("처리가 완료되었습니다.");
		};
			
		/*검색 버튼 클릭 시 이벤트 핸들러*/
		$("#ly12-searchBtn").on("click", function(event) {
				var searchType = $("select[name=searchType]").val();
				var keyword = +encodeURIComponent($("input[name=keyword]").val());
	
				console.log("${paging.makeQuery(1)}");
	
				self.location = "listPaging" 
				+ "?page=${cri.page}&perPageNum=${cri.perPageNum}"							
				+ "&searchType=" 
				+ searchType 
				+ "&keyword="
				+ keyword;
		});
		
		/*전체글 보기 버튼*/
		$('.btn-info').on("click", function() {
			self.location = "/review/listPaging";
		});
		/*글쓰기 버튼*/
		$('#ly12-newBtn').on("click", function(evt) {
			self.location = "register";
		});
	
	});
</script>
</head>
<body>
	<section id="ly12_board-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="products-heading">
						<h2>Review 게시판</h2>
					</div>
				</div>
			</div>
			<!-- 검색영역 -->
			<div class="panel panel-default">
  				<div class="panel-heading">
					<div class="row">
						<form role="form">
							<div class="col-xs-2">
								<div class="form-group">
								<!-- value에 관한 코드 
									  → n=검색조건없음/t=제목검색/c=내용검색/w=작성자검색/tc=제목이나 내용으로 검색/cw=내용이나 작성자로 검색/tcw=제목또는내용또는 작성자로 검색 -->
									<select class="selectpicker form-control" name="searchType">
										<option value="t" <c:out value="${cri.searchType eq 't'?'selected':'' }"/>>제목</option>
										<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>내용</option>
										<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>작성자</option>
										<option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':'' }"/>>제목or내용</option>
										<option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':'' }"/>>내용or작성자</option>
										<option value="tcw"	<c:out value="${cri.searchType eq 'tcw'?'selected':'' }"/>>제목or내용or작성자</option>
									</select>
								</div>
							</div>
							<div class="col-xs-4 ly12-pdL5">
								<div class="form-group">
									<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }" class="form-control" placeholder="검색어를 입력하세요">
								</div>
							</div>
							<div class="col-xs-1">
								<div class="form-group">
									<button id="ly12-searchBtn" class="btn btn-default">검색</button>
								</div>								
							</div>
						</form>
						<div class="col-xs-1">
							<button class="btn btn-info">전체글</button>
						</div>
					</div>					
					
					
				</div>
			</div>
			<!--// 검색영역 -->

			<!-- 게시판 리스트-->
			<div class="row ly12-mgB65">
				<div class="col-md-12 ly12-tblTextC">
					<table class="table table-hover">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>	
						<thead class="thead-light ly12-th">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty listAll }">
									<tr>
										<td colspan="5">---작성된 글이 없습니다-----</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${listAll }" var="listAll">
									<tr>
										<td>${listAll.brNo }</td>
										<td><a href="/review/read${paging.makeSearch(paging.cri.page)}&br_no=${listAll.brNo }">${listAll.brTitle }</a></td>
										<td>${listAll.urId}</td>
										<td><fmt:formatDate value="${listAll.brDate }" pattern="yyyy.MM.dd" /></td>
										<td>${listAll.brHits }</td>	
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<button id="ly12-newBtn" class="btn btn-primary ly12-btnR">글쓰기</button>
				
				<!-- 리스트 페이징 -->
				<div class="ly12-tblTextC">
					<ul class="pagination">
				    	<c:if test="${paging.prev }">
					    	<li class="page-item">
					    		<a class="page-link" href="listPaging${paging.makeSearch(paging.startPage - 1) }">이전</a>
					    	</li>
				    	</c:if>
				    	
				    	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="idx">
					    	<li 
					    		<c:out value="${paging.cri.page == idx?'class=active':'' }"/>>
					    			<a class="page-link" href="listPaging${paging.makeSearch(idx)}">
					    		${idx } <span class="sr-only">(current)</span></a>
					    	</li>
					    </c:forEach>
					    
					    <c:if test="${paging.next && paging.endPage > 0 }">
					    	<li>
					    		<a class="page-link" href="listPaging${paging.makeSearch(paging.endPage +1) }">다음</a>
					    	</li>
					    </c:if>
				  	</ul>
				</div>
				<!--// 리스트 페이징 -->
			</div>
			<!--// 게시판 리스트-->
		</div>
	</section>
</body>
</html>

