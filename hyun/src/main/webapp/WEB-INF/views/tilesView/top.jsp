<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>  
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<!-- TOP HEADER Start
    ================================================== -->
	
	<section id="top">
		<div class="container">
			<div class="row">
				<div class="col-md-3 clearfix" style="float:right">
					<ul class="login-cart" style="display:inline">
						<c:choose>
							<c:when test="${empty login.urId}">
								<li style="float:right;">
									<a data-toggle="modal" data-target="#myModal" href="#">	로그인</a>
									<a href="/users/usersInsert">회원가입</a>
								</li>
							</c:when>
							<c:when test="${login.urGrade eq 'admin'}">
								<li>
									<a href="/admin/productAdmin" target="_blank">관리자</a>
									<a href="/users/logout">로그아웃</a>
									<a href="/users/detail?urNo=${login.urNo }">회원정보</a>
								</li>
							</c:when>
							<c:otherwise>
								 <li style="width:105%">
								  	<a>	${login.urId }</a>
									<a href="/users/logout">로그아웃</a>
									<a href="/users/detail?urNo=${login.urNo }">회원정보</a>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div> <!-- End Of /.row -->
		</div>	<!-- End Of /.Container -->
		<!-- MODAL Start================================================== -->
<script type="text/javascript">
$(document).ready(function (){		
	$('#save').click(function(){
		var formData =$('#login_form').serialize();
		$.ajax({
			type:'POST',
			url:'/users/login',
			data: formData,
			success: function (data) {
	            if (data.UrYn) {
	            	alert("로그인 되었습니다");
	                location.reload();
	            } else {
	            	$("#message").html("<p style='color:red'>아이디 또는 비밀번호가 잘못되었습니다.</p>");
	            }    
	        }
		});
	});

});
</script>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
		    	<div class="modal-content">
		    		<div class="modal-header">
		        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        		<h4 class="modal-title" id="myModalLabel">로그인</h4>
		      		</div>
			      	<div class="modal-body clearfix">
			      		<%-- <form action="/users/login" method="post" id="login_form" class="std"> --%>
			      		<form id="login_form" class="std">
							<fieldset>
								<h3>로그인</h3>
								<div class="form_content clearfix">
									<p class="text">
									<label for="email">아이디</label>
									<span><input placeholder="아이디를 입력해주세요" type="text" id="email" name="urId" value="" class="account_input"></span>
									</p>
									<p class="text">
									<label for="passwd">비밀번호</label>
										<span><input placeholder="비밀번호를 입력해주세요" type="password" id="passwd" name="urPw" value="" class="account_input"></span>
									</p>
									<p class="lost_password">
										<a href="/users/idSerachForm" class="popab-password-link">비밀 번호 찾기</a>
									</p>
									<p class="submit">
										<button type="button" id="save" class="btn btn-success">Log in</button>
									</p>
									<div id="message"></div>
								</div>
							</fieldset>
						</form>
						<div id="create-account_form" class="std">
							<fieldset>
								<h3>회원가입</h3>
								<div class="form_content clearfix">
								<br/><br/>
									<h4>바로 회원이 되어보세요 !</h4>
								<br/><br/>
									<p class="submit">
										<a href="/users/usersInsert" class="btn btn-primary">회원 가입</a>
									</p>
								</div>
							</fieldset>
						</div>
			      	</div>
			      	<div class="modal-footer">
			        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			      	</div>
		    	</div>
		  	</div>
		</div>	
	</section>  <!-- End of /Section -->

	


	<!-- LOGO Start
    ================================================== -->
	
	<header>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<a href="/">
						<img src="/resources/images/logo.png" alt="logo">
					</a>
				</div>	<!-- End of /.col-md-12 -->
			</div>	<!-- End of /.row -->
		</div>	<!-- End of /.container -->
	</header> <!-- End of /Header -->

	


	<!-- MENU Start
    ================================================== -->

	<nav class="navbar navbar-default">
		<div class="container">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		    </div> <!-- End of /.navbar-header -->

		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      	<ul class="nav navbar-nav nav-main">
		        	<!-- <li class="active"><a href="/">HOME</a></li> -->
		        	<li><a href="#">펫 하우스 소개</a></li>
					<li><a href="/product/shop">펫 분양</a></li>
					<li><a href="/review/listPaging">분양후기</a></li>
					<li><a href="#">질문과답변</a></li>
					<li><a href="#">오시는길</a></li>
					<!-- End of /.dropdown -->

					
		        </ul> <!-- End of /.nav-main -->
		    </div>	<!-- /.navbar-collapse -->
		</div>	<!-- /.container-fluid -->
	</nav>	<!-- End of /.nav -->