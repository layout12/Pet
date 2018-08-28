<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	
	<title>펫하우스 관리자화면</title>
    
    <!-- CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  	<!-- JS -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>
    <script src="/resources/vendor/raphael/raphael.min.js"></script>
    <script src="/resources/dist/js/sb-admin-2.js"></script>
</head>

<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">펫하우스 관리자화면</a>
			</div>
			<!-- /.navbar-header -->
			<tiles:insertAttribute name="admin-top" />
			<tiles:insertAttribute name="admin-side" />
		</nav>
		 <div id="page-wrapper">
			<tiles:insertAttribute name="admin-body"/> 
		</div>
	</div>
</body>		  
</html>