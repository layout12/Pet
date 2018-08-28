<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	$(function() {	
		/*검색 버튼 클릭 시 이벤트 핸들러*/
		$("#ly12-searchBtn").on("click", function(event) {
				var searchType = $("select[name=searchType]").val();
				var keyword = +encodeURIComponent($("input[name=keyword]").val());
		
				console.log("${paging.makeQuery(1)}");
		
				self.location = "/admin/productAdmin" 
				+ "?page=${cri.page}&perPageNum=${cri.perPageNum}"							
				+ "&searchType=" 
				+ searchType 
				+ "&keyword="
				+ keyword;
		});
		
		/*전체글 보기 버튼*/
		$('.btn-info').on("click", function() {
			self.location = "/admin/productAdmin";
		});
	});
	</script>
	
	<section id="topic-header">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h1>분양현황 리스트</h1>
					<p>분양대기중이거나 분양된 현황을 관리합니다.</p>					
				</div>	<!-- End of /.col-md-4 -->
			</div>	<!-- End of /.row -->
		</div>	<!-- End of /.container -->
	</section>	<!-- End of /#Topic-header -->
	
				<div class="panel panel-default">
  				<div class="panel-heading">
					<div class="row">
						<form role="form">
							<div class="col-xs-2">
								<div class="form-group">
									<select class="selectpicker form-control" name="searchType">
										<option value="t" <c:out value="${cri.searchType eq 't'?'selected':'' }"/>>이름</option>
										<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>품종</option>
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
<section id="shop">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
			<table style="width:100%" class="table table-condensed table-hover">
						  <col width="5%">
						  <col width="10%">
						  <col width="5%">
						  <col width="10%">
						  <col width="10%">
						  <col width="10%">
						  <col width="15%">
						  <col width="10%">
						  <col width="15%">
						  <col width="10%">
						  <tr style="text-align: center;">
						    <th>No</th>
						    <th>상품명</th>
						    <th>성별</th>
						    <th>품종</th>
						    <th>가격</th>
						    <th>분양여부</th>
						    <th>예방접종</th>
						    <th>생년월일</th>
						    <th>이미지</th>
						    <th>등록일</th>
						  </tr>
				<c:choose>
					<c:when test="${empty productList}">
							<tr>
					  			<td colspan="10">--------상품이없습니다--------</td>
					  		</tr>
					</c:when>
					<c:otherwise>
						  		<c:forEach items="${productList }" var="productList">
						  			<tr>
						  				<td>${productList.pdNo}</td>
						  				<td><a href="/admin/productAdminDetail?pdNo=${productList.pdNo}">${productList.pdName}</a></td>
						  				<td>${productList.pdGender}</td>
						  				<td>${productList.pdKind}</td>
						  				<td><fmt:formatNumber value="${productList.pdPrice}" pattern="#,###"/></td>
						  				<td>${productList.pdSale}</td>
						  				<td>${productList.pdVaccine}</td>
						  				<td>${productList.pdBirth}</td>
						  				<td>${productList.pdImg}</td>
						  				<td><fmt:formatDate value="${productList.pdRegdate}" pattern="yy-MM-dd"/></td>
						  			</tr>
						  		</c:forEach>
						  	</c:otherwise>
				</c:choose>
			</table>
			<input type="button" class="btn btn-success" value="상품등록" onclick="location.href='/admin/productWrite';">
			<a href="/admin/product/productExcelDownload"><img width="22px" height="22px" src="/resources/images/excellogo.png" />엑셀 다운로드</a>	
			<!-- 리스트 페이징 -->
				<div class="ly12-tblTextC">
					<ul class="pagination">
				    	<c:if test="${paging.prev }">
					    	<li class="page-item">
					    		<a class="page-link" href="/admin/productAdmin${paging.makeQuery(paging.startPage - 1) }">이전</a>
					    	</li>
				    	</c:if>
				    	
				    	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="idx">
					    	<li 
					    		<c:out value="${paging.cri.page == idx?'class=active':'' }"/>>
					    			<a class="page-link" href="/admin/productAdmin${paging.makeQuery(idx)}">
					    		${idx } <span class="sr-only">(current)</span></a>
					    	</li>
					    </c:forEach>
					    
					    <c:if test="${paging.next && paging.endPage > 0 }">
					    	<li>
					    		<a class="page-link" href="/admin/productAdmin${paging.makeQuery(paging.endPage +1) }">다음</a>
					    	</li>
					    </c:if>
				  	</ul>
				</div>
				<!--// 리스트 페이징 -->
				</div>
			</div>
		</div>	<!-- End of /.container -->
	</section>	<!-- End of Section -->	
</body>
</html>