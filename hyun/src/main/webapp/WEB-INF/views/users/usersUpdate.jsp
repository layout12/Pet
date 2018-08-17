<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원수정</title>
<script type="text/javascript" src="/resources/js/usersupdate.js"></script>
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

<div id="userjoinForm" >

<div class = "wrapper">
	<form:form action="/users/updateAfter" class = "form-signin" method="post" >
		<h1 class = "form-signin-heading">회원수정</h1>
			<input type="hidden" name="urNo" value="${detail.urNo }">
			<input type="text" class="form-control id" name="urId" readonly="readonly" value="${detail.urId }">
			<br>
			
			<input type="password" class="form-control"  name="urPw" id="urPw" oninput="wordChk(this.value)" placeholder="비밀번호 입력 영문자와 숫자로 6~12자리까지 ">
			<br>
			
			<input type="password" class="form-control"  name="urPwch"  id="urPwch" oninput="checkPwd()" placeholder="비밀번호를 확인해주세요" >
			<br>
			
			<input type="text" class="form-control"  name="urPhone" id="urPhone" oninput="phoneChk(this.value)" placeholder="'-'를 제외한 전화번호를 입력해주세요 " value="${detail.urPhone }">
			<br>
			
			<input type="text" class="form-control" name="urEmail" id="urEamil" oninput="emailChk(this.value)" placeholder="EMAIL을 입력해주세요" value="${detail.urEmail }">
			<br>
			
			<input type="text" class="form-control" onclick="goPopup(this)" readonly="readonly" id="urAddr" name="urAddr" placeholder="주소 입력을 위해 클랙해주세요" value="${detail.urAddr }">
			
			<input type="submit" value="수정" class = "btn btn-lg btn-primary signupbtn" disabled="disabled">
			<input type="button" value="취소" class= "btn btn-lg btn-primary cancelbtn" onclick="location.href='/users/detail?urNo=${detail.urNo }'">
	</form:form>
</div>
</div>

</body>

</html>