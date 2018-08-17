<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="resume">
    <header class="page-header">
    <h1 class="page-title">상세 보기</h1>
    <small> <i class="fa fa-clock-o"></i>등록일</small><br/>
    <small> <i class="fa fa-clock-o"></i><fmt:formatDate value="${productDetail.pdRegdate}" pattern="yy-MM-dd"/></small>
  </header>
<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-offset-1 col-md-10 col-lg-offset-2 col-lg-8">
    <div class="panel panel-default">
      <div class="panel-heading resume-heading">
        <div class="row">
          <div class="col-lg-12">
            <div class="col-xs-12 col-sm-4">
              <figure>
                <img class="img-circle img-responsive" alt="" src="/images/${productDetail.pdImg}">
              </figure>
            </div>

            <div class="col-xs-12 col-sm-8">
              <ul class="list-group">
                <li class="list-group-item">${productDetail.pdName}</li>
                <li class="list-group-item">${productDetail.pdGender}</li>
                <li class="list-group-item">${productDetail.pdKind}</li>
                <li class="list-group-item"><fmt:formatNumber value="${productDetail.pdPrice}" pattern="#,###"/></li>
                <li class="list-group-item">${productDetail.pdSale}</li>
                <li class="list-group-item">${productDetail.pdVaccine}</li>
                <li class="list-group-item">${productDetail.pdBirth}</li>
              </ul>
              <input type="button" class="btn btn-primary" value="수정" onclick="location.href='/admin/productUpdate?pdNo=${productDetail.pdNo}';">
              <input type="button" class="btn btn-success" value="분양완료" onclick="location.href='/admin/productDelete?pdNo=${productDetail.pdNo}';">
			  <a class="btnnew noty" onclick="javascript:history.back();">뒤로가기</a>
            </div>
          </div>
        </div>
      </div>
     </div>
    </div>
   </div>
  </div>
</body>
</html>