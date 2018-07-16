<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DOG</title>
	<script type="text/javascript">
	$(function(){	
	/*-----------------------------------------------게시판 등록	--------------------------------*/
	//전역변수
	var oEditors=[];
	
	//스마트에디터 프레임생성
	nhn.husky.EZCreator.createInIFrame({
		oAppRef:oEditors,
		elPlaceHolder : "ly12-editor",
		sSkinURI: "/resources/editor/SmartEditor2Skin.html",
		htParams:{
			//툴바 사용 여부(true:사용 / false:사용하지 않음)
			bUseToolbar : true,
			//입력창 크기 조절바 사용 여부(true:사용 / false:사용하지 않음)
			bUserVerticalResize : true,
			//모드 탭(Editor | HTML | TEXT) 사용여부(true:사용 /false:사용하지 않음)
			bUseModeChanger : true,
			fOnBeforeUnload : function(){
				
			}
		},
		fOnAppLoad : function(){
			oEditors.getById["ly12-editor"].exec("PASTE_HTML", [""]);
		},
		fCreator : "createSEditor2"
	});
	
	//에디터에서 작성한 데이터 전송하기
	$("#regSave").click(function(){
		//id가 editor인 textarea에 에디터에서 대입
		oEditors.getById["ly12-editor"].exec("UPDATE_CONTENTS_FIELD",[]);
		//폼 submit
		$("#regForm").submit();
	});
	
	//-----------------------------------------------------------------------------------------*/
	});
	</script>
	<script src="/resources/js/board_js.js" type="text/javascript"></script>
	<script src="/resources/editor/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>

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
				<form role="form" method="post" id="regForm">
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
	      							 <textarea id="ly12-editor" class="ly12-editor" name="brContent" class="form-control" rows="3" placeholder="내용을 입력해주세요"></textarea>
	    						</div>						
							</div>
						</div>	
						<button type="submit" id="regSave" class="btn btn-primary">등록</button>
						<button type="reset" class="btn btn-default ly12-btnR ly12-cancel" onclick="location.href='listPaging'">취소</button>				
					</div>						
				</form>
			</div>			
			<!--// 게시판 글쓰기-->			
		</div>
	</section>
</body>
</html>