<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>shop</title>
	<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"> -->
</head>
<body>

	<section id="topic-header">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h1>펫 분양</h1>
					<small>새로운 가족을 기다리고 있는 친구들을 만나보세요! </small>
				</div>	<!-- End of /.col-md-4 -->
				<div class="col-md-8 hidden-xs">
					<ol class="breadcrumb pull-right">
					  	<li><a href="/">Home</a></li>
					  	<li class="active">펫 분양</li>
					</ol>
				</div>	<!-- End of /.col-md-8 -->
			</div>	<!-- End of /.row -->
		</div>	<!-- End of /.container -->
	</section>	<!-- End of /#Topic-header -->



	<!-- PRODUCTS Start
    ================================================== -->

	<section id="shop">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="products-heading">
						<h2>분양대기</h2>
					</div>	<!-- End of /.Products-heading -->
					<div class="product-grid">
					    <ul>
					<c:choose>
					<c:when test="${empty productList}">
							
					  			<li>--------상품이없습니다--------</li>
					  		
					</c:when>
					<c:otherwise>
						  		<c:forEach items="${productList }" var="productList">
							        <li>
							            <div class="products">
											<a href="/product/detail?pdNo=${productList.pdNo}">
												<img src="/images/${productList.pdImg}" alt="">
											</a>
											<a href="/product/detail?pdNo=${productList.pdNo}">
												<h4>${productList.pdName }</h4>
											</a>
										</div>	<!-- End of /.products -->
							        </li>
						  		</c:forEach>
						  	</c:otherwise>
						  </c:choose>
					    </ul>
					</div>	<!-- End of /.products-grid -->

					<!-- Pagination -->
				<div class="pagination-bottom">
					<ul class="pagination">
					<li class="disabled"><a href="#">&laquo;</a></li>
				    	<c:if test="${paging.prev }">
					    	<li class="page-item">
					    		<a class="page-link" href="/product/shop${paging.makeQuery(paging.startPage - 1) }">이전</a>
					    	</li>
				    	</c:if>
				    	
				    	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="idx">
					    	<li 
					    		<c:out value="${paging.cri.page == idx?'class=active':'' }"/>>
					    			<a class="page-link" href="/product/shop${paging.makeQuery(idx)}">
					    		${idx } <span class="sr-only">(current)</span></a>
					    	</li>
					    </c:forEach>
					    
					    <c:if test="${paging.next && paging.endPage > 0 }">
					    	<li>
					    		<a class="page-link" href="/product/shop${paging.makeQuery(paging.endPage +1) }">다음</a>
					    	</li>
					    </c:if>
					    <li><a href="#">»</a></li>
				  	</ul>
				</div>
				<!--// 리스트 페이징 -->
				</div>	<!-- End of /.col-md-9 -->
				<div class="col-md-3">
					<div class="blog-sidebar">
						<div class="block">
							<h4>Categories</h4>
							<div class="list-group">
								<a href="/product/shop?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=t&keyword=웰시코기" class="list-group-item">
									<i class="fa fa-angle-right"></i>
									웰시코기
								</a>
								<a href="/product/shop?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=t&keyword=푸들" class="list-group-item">
									<i class="fa fa-angle-right"></i>
									푸들
								</a>
								<a href="/product/shop?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=t&keyword=치와와" class="list-group-item">
									<i class="fa fa-angle-right"></i>
									치와와
								</a>
								<a href="/product/shop?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=t&keyword=말티즈" class="list-group-item">
									<i class="fa fa-angle-right"></i>
									말티즈
								</a>
								<a href="/product/shop?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=t&keyword=보스턴테리어" class="list-group-item">
									<i class="fa fa-angle-right"></i>
									보스턴테리어
								</a>
							</div>
						</div>
						<div class="block">
							<img src="/resources/images/dog-ad.png" alt="">
						</div>
					</div>
				</div>	<!-- End of /.col-md-3 -->
			
			</div>	<!-- End of /.row -->
		</div>	<!-- End of /.container -->
	</section>	<!-- End of Section -->

</body>
</html>