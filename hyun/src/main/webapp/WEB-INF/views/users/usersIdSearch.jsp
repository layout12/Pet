<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<style type="text/css">

.form-signin {
	max-width: 580px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
}

.form-control {
	font-size: 16px;
	height: auto;
	padding: 10px;
}

input[type="text"] {
	margin-bottom: -1px;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

input[type="password"] {
	margin-bottom: 20px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

</style>

</head>
<body>
	<div>
		<c:choose>
			<c:when test="${empty success}">		
					<h1 style="text-indent: 15px; font-weight: bold; text-align: center;">아이디 찾기</h1>
					<hr style="margin-top: 5px; margin-bottom: 5px;">
					<form action="/user/idSearch">
						<div class="form-signin" id="searchId">
						<input type="text" id="urPhone" name="urPhone" style="width: 400px; margin: auto;" class = "form-control" placeholder="전화번호">
						<br>
						<input type="text" id="urEmail" name="urEmail" style="width: 400px; margin: auto;" class = "form-control" placeholder="이메일">
						<br>
						<button style="width:200px; margin: auto;" class="btn btn-lg btn-primary btn-block" type="submit">아이디 찾기</button>
						<h3 style="font-weight: bold;">${erorr}</h3>
						</div>
					</form>
			</c:when>
			<c:otherwise>
						<div class="form-signin" id="searchIdRes" style="text-align: center;">
							<h3 style="font-weight: bold;">${erorr}${success}</h3>
							<br>
							<button onclick="/" class="btn btn-lg btn-primary">메인으로</button>
							<button onclick="location.href='/users/pwSearchForm'" class="btn btn-lg btn-primary">비밀번호 찾기</button>
						</div>
			</c:otherwise>
		</c:choose>
	</div>



</body>
</html>