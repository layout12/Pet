<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DOG CAT</title>
<style type="text/css">
	#ly12-updateForm{display:none;}
</style>
<script type="text/javascript">
	$(function(){		
		
		/*상세페이지에서 바로 전 목록페이지로 넘어갈 때 정보유지한채 넘김 */
			var formObj = $("form[role='form']");
			console.log(formObj);
	
			/*목록 버튼 클릭 시 */
			$(".ly12-goList").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/review/listPaging");
				formObj.submit();
			});
			
			/*수정 버튼 클릭 시 */
			$(".ly12-upd").on("click",function(){
				$("#ly12-readForm").hide();
				$("#ly12-updateForm").show();
			});
			
			/*수정 완료 버튼 클릭 시*/
			$(".ly12-updFinish").on("click",function(){
				formObj.submit();
			});
			
			/*수정 취소 버튼 클릭 시*/
			$(".ly12-cancel").on("click",function(){
				$("#ly12-readForm").show();
				$("#ly12-updateForm").hide();
			});		
	
		});
</script>
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
			<!-- 게시판 상세글 및 수정-->
			<div class="row ly12-mgB65">
				<!-- 게시판 상세글 영역-->
				<div id="ly12-readForm">
					<form role="form" method="post" action="/review/delete">									
						<input type="hidden" name="page" value="${cri.page }">
						<input type="hidden" name="perPageNum" value="${cri.perPageNum }">	
						<input type="hidden" name="brNo" value="${read.brNo }">	
						<input type="hidden" name="searchType" value="${cri.searchType }">
						<input type="hidden" name="keyword" value="${cri.keyword }">
											
						<div class="col-md-12">					
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label">번호</label>
									<div class="col-sm-10">
		      							<p class="form-control-static">${read.brNo }</p>
		    						</div>						
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">작성자</label>
									<div class="col-sm-10">
		      							<p class="form-control-static">${read.urId }</p>
		    						</div>						
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">작성일</label>
									<div class="col-sm-10">
										<p class="form-control-static"><fmt:formatDate value="${read.brDate }" pattern="yyyy.MM.dd" /></p>
									</div>
								</div>						
								<div class="form-group">
									<label class="col-sm-2 control-label">제목</label>
									<div class="col-sm-10">
		      							 <p class="form-control-static">${read.brTitle }</p>
		    						</div>						
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">내용</label>
									<div class="col-sm-10">
		      							 <p class="form-control-static">${read.brContent }</p>
		    						</div>						
								</div>
							</div>	
							<button type="button" class="btn btn-warning ly12-upd">수정</button>
							<button type="submit" class="btn btn-danger">삭제</button>
							<button type="submit" class="btn btn-primary ly12-btnR ly12-goList">목록</button>				
						</div>						
					</form>
				</div>
				<!--// 게시판 상세글 영역-->
				<!-- 게시판 수정 영역-->
				<div id="ly12-updateForm">
					<form role="form" method="post">					
						<input type="hidden" name="page" value="${cri.page }">
						<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
						<input type="hidden" name="brNo" value="${read.brNo }">
						<input type="hidden" name="searchType" value="${cri.searchType }">
						<input type="hidden" name="keyword" value="${cri.keyword }">
						
						<div class="col-md-12">					
							<div class="form-horizontal">
								<div class="form-group">
									<label class="col-sm-2 control-label">번호</label>
									<div class="col-sm-10">
		      							<p class="form-control-static">${read.brNo }</p>
		    						</div>						
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">작성자</label>
									<div class="col-sm-10">
		      							<p class="form-control-static">${read.urId }</p>
		    						</div>						
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">작성일</label>
									<div class="col-sm-10">
										<p class="form-control-static"><fmt:formatDate value="${read.brDate }" pattern="yyyy.MM.dd" /></p>
									</div>
								</div>						
								<div class="form-group">
									<label class="col-sm-2 control-label">제목</label>
									<div class="col-sm-10">
		      							 <input type="text" name="brTitle" class="form-control" value="${read.brTitle }">
		    						</div>						
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">내용</label>
									<div class="col-sm-10">
		      							 <textarea name="brContent" class="form-control" rows="3">${read.brContent }</textarea>
		    						</div>						
								</div>
							</div>	
							<button type="submit" class="btn btn-primary ly12-updFinish">수정완료</button>
							<button type="button" class="btn btn-warning ly12-cancel">취소</button>
						</div>						
					</form>
				</div>
				<!--// 게시판 수정 영역-->
			</div>			
			<!--// 게시판 글쓰기-->			
		</div>
	</section>
</body>
</html>