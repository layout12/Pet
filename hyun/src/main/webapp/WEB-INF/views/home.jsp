<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- SLIDER Start
    ================================================== -->


	<section id="slider-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="slider" class="nivoSlider">
				    	<img src="/resources/images/slider.jpg" alt="" />
				    	<img src="/resources/images/slider1.jpg" alt=""/>
				    	<img src="/resources/images/slider2.jpg" alt="" />
					</div>	<!-- End of /.nivoslider -->
				</div>	<!-- End of /.col-md-12 -->
			</div>	<!-- End of /.row -->
		</div>	<!-- End of /.container -->
	</section> <!-- End of Section -->

		<!-- PRODUCTS Start
    ================================================== -->

	<section id="products">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="products-heading">
						<h2>새로운 펫소개</h2>
					</div>
				</div>
			</div>
			<div class="row">
			<c:choose>
					<c:when test="${empty productList}">
							
					  			<div>--------상품이없습니다--------</div>
					  		
					</c:when>
					<c:otherwise>
						  		<c:forEach items="${productList }" var="productList">
									<div class="col-md-3">
										<div class="products">
											<a href="/product/detail?pdNo=${productList.pdNo}">
												<img src="/images/${productList.pdImg}" alt="">
											</a>
											<a href="/product/detail?pdNo=${productList.pdNo}">
												<h4>${productList.pdName }</h4>
											</a>
										</div>	<!-- End of /.products -->
									</div>	<!-- End of /.col-md-3 -->
						  		</c:forEach>
						  	</c:otherwise>
						  </c:choose>
			</div>	<!-- End of /.row -->
		</div>	<!-- End of /.container -->
	</section>	<!-- End of Section -->


</body>
</html>