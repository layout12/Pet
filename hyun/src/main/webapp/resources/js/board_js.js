
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
	
	

	
});