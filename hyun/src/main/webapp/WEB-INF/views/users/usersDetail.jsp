<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보</title>
<style type="text/css">
.wrapper {	
	margin-top: 100px;
  margin-bottom: 80px;
}

.form-signin {
  max-width: 380px;
  padding: 15px 35px 45px;
  margin: 0 auto;
  background-color: #eee;
  border: 1px solid;
  border-color: #eee;  

  .form-signin-heading,
	.checkbox {
	  margin-bottom: 30px;
	}

	.checkbox {
	  font-weight: normal;
	}

	.form-control {
	  position: relative;
	  font-size: 16px;
	  width: 680;
	  height: auto;
	  padding: 10px;
		@include box-sizing(border-box);

		&:focus {
		  z-index: 2;
		}
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
}
.form-signin-heading{
text-align: center;


}

</style>

</head>
<body>

<div class = "wrapper">
	<form:form action="/users/delete" class = "form-signin" method="post" >
		<h1 class = "form-signin-heading">회원 정보</h1>
			<input type="hidden" name="urNo" value="${detail.urNo }">
			<input type="text" class="form-control id" id="urId" readonly="readonly" value="${detail.urId }">
			<br>
			<input type="text" class="form-control id" id="urId" readonly="readonly" value="${detail.urPhone }">
			<br>
			<input type="text" class="form-control id" id="urId" readonly="readonly" value="${detail.urEmail }">
			<br>
			<input type="text" class="form-control id" id="urId" readonly="readonly" value="${detail.urAddr }">
			<br>
			<input type="button" value="수정" class = "btn btn-lg btn-primary signupbtn" onclick="location.href='/users/updateForm?urNo=${detail.urNo }'">
			<input type="submit" value="탈퇴" class= "btn btn-lg btn-primary cancelbtn" onclick="location.href='/users/delete?urNo=${detail.urNo }'">
	</form:form>
</div>

</body>

</html>