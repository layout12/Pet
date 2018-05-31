<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DOG CAT</title>
</head>
<body>
	<section id="ly12_board-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="products-heading">
						<h2>Review 게시판</h2>
					</div>
				</div>
			</div>
			<!-- 게시판 글쓰기-->
			<div class="row ly12-mgB65">
				<form role="form" method="post">
					<div class="col-md-12">					
						<div class="form-horizontal">
							<div class="form-group">
								<label class="col-sm-2 control-label">작성자</label>
								<div class="col-sm-10">
	      							<input type="text" name="urId" class="form-control">
	    						</div>						
							</div>											
							<div class="form-group">
								<label class="col-sm-2 control-label">제목</label>
								<div class="col-sm-10">
	      							 <input type="text" name="brTitle" class="form-control" placeholder="제목을 입력해주세요">
	    						</div>						
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">내용</label>
								<div class="col-sm-10">
	      							 <textarea name="brContent" class="form-control" rows="3" placeholder="내용을 입력해주세요"></textarea>
	    						</div>						
							</div>
						</div>	
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="reset" class="btn btn-default ly12-btnR ly12-cancel" onclick="location.href='listPaging'">취소</button>				
					</div>						
				</form>
			</div>			
			<!--// 게시판 글쓰기-->			
		</div>
	</section>
</body>
</html>