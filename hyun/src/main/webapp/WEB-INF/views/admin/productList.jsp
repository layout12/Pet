<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="100%">
			  <col width="10%">
			  <col width="10%">
			  <col width="10%">
			  <col width="10%">
			  <col width="10%">
			  <col width="10%">
			  <col width="10%">
			  <col width="10%">
			  <col width="10%">
			  <col width="10%">
			  <tr style="text-align: center;">
			    <th>No</th>
			    <th>상품명</th>
			    <th>성별</th>
			    <th>품종</th>
			    <th>가격</th>
			    <th>분양여부</th>
			    <th>예방접종</th>
			    <th>생년월일</th>
			    <th>이미지</th>
			    <th>등록일</th>
			  </tr>
	<c:choose>
		<c:when test="${empty productList}">
				<tr>
		  			<td colspan="10">--------상품이없습니다--------</td>
		  		</tr>
		</c:when>
		<c:otherwise>
			  		<c:forEach items="${productList }" var="productList">
			  			<tr>
			  				<td>${productList.pNo}</td>
			  				<td>${productList.pName}</td>
			  				<td>${productList.pGender}</td>
			  				<td>${productList.pKind}</td>
			  				<td>${productList.pPrice}</td>
			  				<td>${productList.pSale}</td>
			  				<td>${productList.pVaccine}</td>
			  				<td>${productList.pBirth}</td>
			  				<td>${productList.pImg}</td>
			  				<td>${productList.pRegdate}</td>
			  			</tr>
			  		</c:forEach>
			  	</c:otherwise>
	</c:choose>
</table>
</body>
</html>