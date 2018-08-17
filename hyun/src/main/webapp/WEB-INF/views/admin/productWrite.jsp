<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section id="topic-header">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h1>ProductWrite</h1>
					<p>WriteForm</p>
				</div>	<!-- End of /.col-md-4 -->
			</div>	<!-- End of /.row -->
		</div>	<!-- End of /.container -->
	</section>	<!-- End of /#Topic-header -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-9">

<form:form modelAttribute="productForm" name="productForm" action="/admin/productWriterAfter" method="post" enctype="multipart/form-data">

	<fieldset>
	
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="nama">이름</label>  
		  <div class="col-md-8">
		  <input name="pdName" type="text" placeholder="이름을 입력해주세요" class="form-control input-md">
		  <span class="help-block"><form:errors path="pdName" /></span>  
		  </div>
		</div>
		
		<!-- Select Basic -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="jenis kelamin">성별</label>
		  <div class="col-md-8">
		    <select name="pdGender" class="form-control">
		      <option>남</option>
		      <option>여</option>
		    </select>
		    <span class="help-block"><form:errors path="pdGender" /></span> 
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="No HP/WA/BBM">품종</label>  
		  <div class="col-md-8">
		  <input name="pdKind" type="text" placeholder="품종을 입력해주세요." class="form-control input-md">
		  <span class="help-block"><form:errors path="pdKind" /></span>  
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label">가격</label>  
		  <div class="col-md-8">
		  <input name="pdPrice" type="text" placeholder="가격을 입력해주세요." class="form-control input-md">
		  <span class="help-block"><form:errors path="pdPrice" /></span>  
		  </div>
		</div>
		
		<!-- Select Basic -->
		<div class="form-group">
		  <label class="col-md-4 control-label">분양 유무</label>
		  <div class="col-md-8">
		    <select name="pdSale" class="form-control">
		      <option>Y</option>
		      <option>N</option>
		    </select>
		    <span class="help-block"><form:errors path="pdSale" /></span> 
		  </div>
		</div>
		
		<!-- Select Basic -->
		<div class="form-group">
		  <label class="col-md-4 control-label">예방접종</label>
		  <div class="col-md-8">
		    <select name="pdVaccine" class="form-control">
		      <option>1차예방접종완료</option>
		      <option>2차예방접종완료</option>
		    </select>
		    <span class="help-block"><form:errors path="pdVaccine" /></span> 
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label">생일</label>  
		  <div class="col-md-8">
		  <input name="pdBirth" type="text" placeholder="생일을 입력해주세요." class="form-control input-md">
		  <span class="help-block"><form:errors path="pdBirth" /></span>  
		  </div>
		</div>
		
		<!-- File Button --> 
		<div class="form-group">
		  <label class="col-md-4 control-label" for="SIM">파일</label>
		  <div class="col-md-8">
		    <input id="productImg" name="productImg" class="input-file" type="file">
		    <span class="help-block">${imgError}</span>  
		  </div>
		</div>
		
		<!-- Button -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="kirim">등록</label>
		  <div class="col-md-8">
		  	<input type="submit" class="btn btn-success" value="상품등록" />
		  	<a class="btnnew noty" onclick="javascript:history.back();">등록취소</a>
		  </div>
		</div>
	
	</fieldset>
</form:form>
				</div>
			</div>
		</div>	<!-- End of /.container -->
	</section>	<!-- End of Section -->	
</body>
</html>