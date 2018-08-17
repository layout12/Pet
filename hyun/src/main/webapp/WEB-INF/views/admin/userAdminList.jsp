<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(function() {	
	/*검색 버튼 클릭 시 이벤트 핸들러*/
	$("#ly12-searchBtn").on("click", function(event) {
			var searchType = $("select[name=searchType]").val();
			var keyword = +encodeURIComponent($("input[name=keyword]").val());
	
			console.log("${paging.makeQuery(1)}");
	
			self.location = "/admin/userAdminList" 
			+ "?page=${cri.page}&perPageNum=${cri.perPageNum}"							
			+ "&searchType=" 
			+ searchType 
			+ "&keyword="
			+ keyword;
	});
	
	/*전체글 보기 버튼*/
	$('.btn-info').on("click", function() {
		self.location = "/admin/userAdminList";
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="topic-header">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h1>UserAdminList</h1>
					<p>userList</p>
				</div>	<!-- End of /.col-md-4 -->
			</div>	<!-- End of /.row -->
		</div>	<!-- End of /.container -->
	</section>	<!-- End of /#Topic-header -->
	
<section id="shop">
				<div class="panel panel-default">
  				<div class="panel-heading">
					<div class="row">
						<form role="form">
							<div class="col-xs-2">
								<div class="form-group">
									<select class="selectpicker form-control" name="searchType">
										<option value="t" <c:out value="${cri.searchType eq 't'?'selected':'' }"/>>아이디</option>
										<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>전화번호</option>
										<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>주소</option>
										
									</select>
								</div>
							</div>
							<div class="col-xs-4 ly12-pdL5">
								<div class="form-group">
									<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }" class="form-control" placeholder="검색어를 입력하세요">
								</div>
							</div>
							<div class="col-xs-1">
								<div class="form-group">
									<button id="ly12-searchBtn" class="btn btn-default">검색</button>
								</div>								
							</div>
						</form>
						<div class="col-xs-1">
							<button class="btn btn-info">전체글</button>
						</div>
					</div>					
					
					
				</div>
			</div>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
          <div class="esconde" id="opdRetro">
            <table class="table table-striped table-hover ">
            <thead>
                <tr class="bg-primary">
                    <th>회원번호</th>
                    <th>회원아이디</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>주소</th>
                    <th>가입일</th>
                    <th>탈퇴일</th>
                    <th>등급</th>
                    <th>탈퇴여부</th>
                </tr>
            </thead>
            <tbody> <!-- para abrir em outra aba adicionar target="_blank" -->
            				<c:choose>
					<c:when test="${empty userList}">
							<tr>
					  			<td colspan="8">--------유저가 없습니다.--------</td>
					  		</tr>
					</c:when>
					<c:otherwise>
						  		<c:forEach items="${userList }" var="userList">
						  			<tr>
						  				<td>${userList.urNo}</td>
						  				<td><a href="#">${userList.urId}</a></td>
						  				<td>${userList.urPhone}</td>
						  				<td>${userList.urEmail}</td>
						  				<td>${userList.urAddr}</td>
						  				<td><fmt:formatDate value="${userList.urRegdate}" pattern="yy-MM-dd"/></td>
						  				<td><fmt:formatDate value="${userList.urDropdate}" pattern="yy-MM-dd"/></td>
						  				<td>${userList.urGrade}</td>
									    <td>
									    <select name="urYn">
									      <option <c:if test="${userList.urYn == 'Y'}">checked</c:if>>Y</option>
									      <option <c:if test="${userList.urYn == 'N'}">checked</c:if>>N</option>
									    </select>
									    </td>
						  			</tr>
						  		</c:forEach>
						  	</c:otherwise>
				</c:choose>
				</tbody>
				</table>
				</div>
				<!-- 리스트 페이징 -->
				<div class="ly12-tblTextC">
					<ul class="pagination">
				    	<c:if test="${paging.prev }">
					    	<li class="page-item">
					    		<a class="page-link" href="/admin/userAdminList${paging.makeQuery(paging.startPage - 1) }">이전</a>
					    	</li>
				    	</c:if>
				    	
				    	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="idx">
					    	<li 
					    		<c:out value="${paging.cri.page == idx?'class=active':'' }"/>>
					    			<a class="page-link" href="/admin/userAdminList${paging.makeQuery(idx)}">
					    		${idx } <span class="sr-only">(current)</span></a>
					    	</li>
					    </c:forEach>
					    
					    <c:if test="${paging.next && paging.endPage > 0 }">
					    	<li>
					    		<a class="page-link" href="/admin/userAdminList${paging.makeQuery(paging.endPage +1) }">다음</a>
					    	</li>
					    </c:if>
				  	</ul>
				</div>
				<!--// 리스트 페이징 -->
				</div>
			</div>
		</div>	<!-- End of /.container -->
	</section>	<!-- End of Section -->	
</body>
</html>