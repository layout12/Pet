<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DOG CAT</title>
<script type="text/javascript">
	var result='${msg}';
	
	if(result=='success'){
		alert("처리가 완료되었습니다.");
	}
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
			<!-- 게시판 리스트-->
			<div class="row ly12-mgB65">
				<div class="col-md-12 ly12-tblTextC">
					<table class="table table-hover">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>	
						<thead class="thead-light ly12-th">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty listAll }">
									<tr>
										<td colspan="5">---작성된 글이 없습니다-----</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${listAll }" var="listAll">
									<tr>
										<td>${listAll.brNo }</td>
										<td><a href="/review/read${paging.makeQuery(paging.cri.page)}&br_no=${listAll.brNo }">${listAll.brTitle }</a></td>
										<%-- <td><a href="/review/read?br_no=${listAll.brNo}">${listAll.brTitle }</a></td> --%>
										<td>${listAll.urId}</td>
										<td><fmt:formatDate value="${listAll.brDate }" pattern="yyyy.MM.dd" /></td>
										<td>${listAll.brHits }</td>	
									</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<button type="button" class="btn btn-primary ly12-btnR" onclick="location.href='/review/register'">글쓰기</button>
				
				<!-- 리스트 페이징 -->
				<div class="ly12-tblTextC">
					<ul class="pagination">
				    	<c:if test="${paging.prev }">
					    	<li class="page-item">
					    		<a class="page-link" href="listPaging${paging.makeQuery(paging.startPage - 1) }">이전</a>
					    	</li>
				    	</c:if>
				    	
				    	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="idx">
					    	<li 
					    		<c:out value="${paging.cri.page == idx?'class=active':'' }"/>>
					    			<a class="page-link" href="listPaging${paging.makeQuery(idx)}">
					    		${idx } <span class="sr-only">(current)</span></a>
					    	</li>
					    </c:forEach>
					    
					    <c:if test="${paging.next && paging.endPage > 0 }">
					    	<li>
					    		<a class="page-link" href="listPaging${paging.makeQuery(paging.endPage +1) }">다음</a>
					    	</li>
					    </c:if>
				  	</ul>
				</div>
				<!--// 리스트 페이징 -->
			</div>
			<!--// 게시판 리스트-->
		</div>
	</section>
</body>
</html>

