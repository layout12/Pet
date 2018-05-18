<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>UsersInsert</title>
<script type="text/javascript">
//전송버튼
$("#savebutton").click(function(){

	var form = document.usersForm;
    form.submit();

});
</script>
</head>
<body>

	<form:form modelAttribute="usersForm" name="usersForm"
		action="/users/insertAfter" method="post">
		<h3>회원 가입</h3>
		<input placeholder="아이디를 입력해주세요" type="text" name="uNo"/>
		<form:errors path="uId" />
		<br>
		<input placeholder="비밀번호를 입력해주세요" type="text" name="uPw"/>
		<form:errors path="uPw" />
		<br>
		<input placeholder="전화번호를 입력해주세요" type="text" name="uPhone"/>
		<form:errors path="uPhone" />
		<br>
		<input placeholder="이메일을 입력해주세요" type="text" name="uEmail"/>
		<form:errors path="uEmail" />
		<br>
		<input placeholder="주소를 입력해주세요" type="text" name="uAddr"/>
		<form:errors path="uAddr" />
		<br>
		<!-- <button class="btn btn-primary">회원 가입</button> -->
		<input id="savebutton" type="submit" value="회원가입">
	</form:form>

</body>
</html>