
$(function(){	
	/*-----------------------------------------------게시판 상세	--------------------------------*/
	//상세페이지에서 바로 전 목록페이지로 넘어갈 때 정보유지한채 넘김 
	var formObj = $("form[role='form']");
	/*console.log(formObj);*/

	//목록 버튼 클릭 시 
	$(".ly12-goList").on("click", function() {
		formObj.attr("method", "get");
		formObj.attr("action", "/review/listPaging");
		formObj.submit();
	});
	
	//수정 버튼 클릭 시 
	$(".ly12-upd").on("click",function(){
		$("#ly12-readForm").hide();
		$("#ly12-updateForm").show();
	});
	
	//수정 완료 버튼 클릭 시
	$(".ly12-updFinish").on("click",function(){
		formObj.submit();
	});
	
	//수정 취소 버튼 클릭 시
	$(".ly12-cancel").on("click",function(){
		$("#ly12-readForm").show();
		$("#ly12-updateForm").hide();
	});	

	//--------------------------------------------------------------------------------------
	
	
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