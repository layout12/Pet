<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>펫 하우스</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<!-- Css -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/css/nivo-slider.css" type="text/css" />
	<link rel="stylesheet" href="/resources/css/owl.carousel.css">
	<link rel="stylesheet" href="/resources/css/owl.theme.css">
	<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/css/style.css">
	<link rel="stylesheet" href="/resources/css/responsive.css">

	
	<!-- 게시판용 css추가 -->
	<link rel="stylesheet" href="/resources/css/board.css">
	
	<!-- product용 css추가 -->
	<link rel="stylesheet" href="/resources/css/product.css">
	<!-- jS -->
	<script src="/resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/resources/js/jquery.nivo.slider.js" type="text/javascript"></script>
	<script src="/resources/js/owl.carousel.min.js" type="text/javascript"></script>
	<script src="/resources/js/jquery.nicescroll.js"></script>
	<script src="/resources/js/jquery.scrollUp.min.js"></script>
	<script src="/resources/js/main.js" type="text/javascript"></script>
	


</head>
<body>

	<tiles:insertAttribute name="top" />
	<tiles:insertAttribute name="body"/>
	<tiles:insertAttribute name="footer" />
</body>
</html>