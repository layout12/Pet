
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function userPwSearch() {
		var urId = $("#urId").val();
		var urEmail = $("#urEmail").val();
	    
	    
		if (urId == "" || urId == null) {
			alert("ID를 입력해주시기바랍니다.");
			return false;
		}
		if (urEmail == "" || urEmail == null) {
			alert("이메일을 입력해주시기바랍니다.");
			return false;
		}
				
		$("#search").prop("disabled",true);

		$.ajax({
			url:"/users/pwSearch",
			data:"urId="+urId +"&urEmail="+urEmail,
			success : function(data){
				if(data == 'false'){
				alert(data);
				$("#search").prop("disabled",false);
				}else{
					alert("임시 비밀번호를 발송하엿습니다 비밀번호를 변경해 주시기 바랍니다.");
					$("#search").prop("disabled",false);
					location.href="/";
			}
			},
			erorr:function(){
				alert("에러");
				$("#search").prop("disabled",false);
			}
			
		})
		


	}
</script>
<title>비밀번호 찾기</title>
<style type="text/css">

.wrapper {
	margin-top: 300px;
	margin-bottom: 80px;
}

.form-signin {
	max-width: 580px;
	padding: 15px 35px 45px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, 0.1);
	.
	form-signin-heading
	,
	.checkbox
	{
	margin-bottom
	:
	30px;
}

.checkbox {
	font-weight: normal;
}

.form-control {
	position: relative;
	font-size: 16px;
	height: auto;
	padding: 10px;
	@
	include
	box-sizing(border-box);
	&:
	focus
	{
	z-index
	:
	2;
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
</style>
</head>
<body>
	<div id="area">
		<hr>
		<h3 class="form-signin-heading" style="text-align: center;">비밀번호 찾기</h3>

		<div class="form-signin">
			아이디 <input type="text" class="form-control" name="urId" id="urId"
				placeholder="아이디를 입력해주세요">
			이메일
				<input class="form-control" name="urEmail" id="urEmail" type="text"
				placeholder="이메일을 입력해주세요">
			<br>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				style="clear: both" onclick="userPwSearch()" id="search">비밀번호 찾기</button>
		</div>


	</div>

</body>
</html>