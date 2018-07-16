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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/js/board_js.js" type="text/javascript"></script>
<script src="/resources/js/answer_js.js" type="text/javascript"></script>
<script type="text/javascript">
	var brNo =${read.brNo};  //현재 게시글 번호	
	var page=1; //댓글 페이지 번호 초기화 
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
			<!-- 게시판 상세글,수정,댓글-->
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
									<label class="col-sm-2 control-label">조회수</label>
									<div class="col-sm-10">
		      							<p class="form-control-static">${read.brHits }</p>
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
				
				<!---------------------------------------- 댓글 영역-------------------------------------------------------- -->
				<!-- 댓글리스트와 댓글 페이칭(토글가능) -->
				<div class="col-md-12 panel-group" style="margin-top:20px;">	
					<div class="panel panel-default">
						<div class="panel-heading">	
							<h4 class="panel-title">							
						 		<a data-toggle="collapse" data-target="#collapseOne" href="#collapseOne"><span class="answerCount"></span></a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<!--댓글입력 -->				
								<h4><i class="far fa-comment-dots"></i>&nbsp;댓글을 남겨주세요.</h4>					 
								<div>						
									<p>
										<input type="text" class="form-control newUrId" name="urId" placeholder="이름을 입력해주세요"/>
									</p>
									<textarea class="form-control newAsContent" rows="3" name="asContent" placeholder="댓글을 남겨주세요"></textarea>
									<button id="ly12-addBtn" class="btn btn-primary ly12-addBtn">저장</button>
								</div>
								<!--// 댓글입력 -->
												
								<!-- 댓글리스트 -->			
								<ul id="answer" class="answerUl">
									
								</ul> 
								<script id="template" type="text/x-handlebars-template">
									{{#each .}}
										{{#fn_asIf}}
											<li class="ly12-answerLi page-item" data-asNo={{asNo}} data-prNo={{asPrno}}>
												<span class="ly12-answerUrId"><i class="fas fa-user-circle"></i>&nbsp;{{urId}}</span>
												<a href="#" class="pull-right delBtn" data-target="#delModal" data-toggle="modal">
													<small><i class="fa fa-times">삭제</i></small>
												</a>										
												<a href="#" class="pull-right modBtn" data-target="#modModal" data-toggle="modal" style="padding-right:10px;">
													<small><i class="fa fa-edit">수정</i></small></a>									
												<span style="color:#777;"><small>{{helperAsDate asDate}}</small></span>	
												<div class="ly12-answerAsCon">{{helperEscape asContent}}</div>
												<button type="button" class="btn btn-default btn-xs ly12-mgR5 addBtn" data-target="#addModal" data-toggle="modal">댓글쓰기</button>
											</li>
										{{else}}
											<li class="ly12-answerLi page-item ly12-answerRe" data-asNo={{asNo}} data-prNo={{asPrno}}>
												<span class="ly12-answerUrId"><i class="fas fa-user-circle"></i>&nbsp;{{urId}}</span>
												<a href="#" class="pull-right delBtn" data-target="#delModal" data-toggle="modal">
													<small><i class="fa fa-times">삭제</i></small>
												</a>										
												<a href="#" class="pull-right modBtn" data-target="#modModal" data-toggle="modal" style="padding-right:10px;">
													<small><i class="fa fa-edit">수정</i></small></a>									
												<span style="color:#777;"><small>{{helperAsDate asDate}}</small></span>	
												<div class="ly12-answerAsCon">{{helperEscape asContent}}</div>
												<button type="button" class="btn btn-default btn-xs ly12-mgR5 addBtn" data-target="#addModal" data-toggle="modal">댓글쓰기</button>
											</li>
										{{/fn_asIf}}
									{{/each}}
								</script>	
								<!--// 댓글리스트 -->	
							</div>					
							<!-- 댓글 페이징 -->
							<div class="panel-footer ly12-tblTextC" style="background-color:#fff;">
								<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
							</div>
							<!--//댓글 페이징 -->	
						</div>						
					</div>
				</div>
				<!--//댓글리스트와 댓글 페이칭(토글가능) -->
								
				<!-- 수정 모달창 -->
				<div class="modal fade" id="modModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- header -->
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">&times;</button>
								<h5>댓글 수정하기<input type="hidden" class="modTitle"/></h5>
							</div>
							<!-- body -->
							<div class="modal-body" data-asNo>
								<textarea id="modAsContent" class="form-control" rows="3"></textarea>
							</div>
							<!-- footer -->
							<div class="modal-footer">
								<button type="button" id="answerModBtn" class="btn btn-success">수정완료</button>
								<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!--// 수정 모달창 -->
				
				<!-- 삭제 모달창 -->
				<div class="modal fade" id="delModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- header -->
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">&times;</button>
								<h5>댓글 삭제하기<input type="hidden" class="modTitle"/></h5>
							</div>
							<!-- body -->
							<div class="modal-body" data-asNo>
								<p>댓글을 삭제하시겠습니까?</p>
								<input type="hidden" class="modTitle"/>
							</div>
							<!-- footer -->
							<div class="modal-footer">
								<button type="button" id="answerDelBtn" class="btn btn-danger">네. 삭제합니다</button> 
								<button type="button" class="btn btn-default pull-left" data-dismiss="modal">아니요</button>
							</div>
						</div>
					</div>
				</div>
				<!--// 삭제 모달창 -->	
				
				<!-- 댓글추가 모달창 -->
				<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- header -->
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close" aria-hidden="true">&times;</button>
								<h5>댓글 쓰기
								<input type="hidden" class="modTitle"/><input type="hidden" /></h5>
							</div>
							<!-- body -->
							<div class="modal-body" data-asNo  data-prNo>
								<p><input type="text" class="form-control newUrId2" name="urId" placeholder="이름을 입력해주세요"/></p>
								<textarea name="asContent" class="form-control newAsContent2" rows="3" placeholder="댓글을 남겨주세요"></textarea>
							</div>
							<!-- footer -->
							<div class="modal-footer">
								<button type="button" id="ly12-addBtn" class="btn btn-success ly12-addBtn-new">저장</button>
								<button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				<!--// 댓글추가  모달창 -->	
	
				<!----------------------------------------// 댓글 영역-------------------------------------------------------- -->
	
			</div>	
			<!--// 게시판 상세글,수정,댓글-->		
		</div>	
	</section>
</body>
</html>