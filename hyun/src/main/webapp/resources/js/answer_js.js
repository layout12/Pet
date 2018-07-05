$(document).ready(function (){ 	

	// 댓글 등록일자 : 날짜/시간 2자리로 맞추기
	Handlebars.registerHelper("helperAsDate", function (timeValue) {
        var dateObj = new Date(timeValue);
        var year = dateObj.getFullYear();
        var month = dateObj.getMonth() + 1;
        var date = dateObj.getDate();
        var hours = dateObj.getHours();
        var minutes = dateObj.getMinutes();
        // 2자리 숫자로 변환
        month < 10 ? month = '0' + month : month;
        date < 10 ? date = '0' + date : date;
        hours < 10 ? hours = '0' + hours : hours;
        minutes < 10 ? minutes = '0' + minutes : minutes;
        return year + "-" + month + "-" + date + " " + hours + ":" + minutes;
    });

	//댓글 내용 : 줄바꿈/공백처리
	Handlebars.registerHelper("helperEscape", function(asContent){
		var text = Handlebars.Utils.escapeExpression(asContent);
		text = text.replace(/(\r\n|\n\r)/gm, "<br/>");
		text = text.replace(/( )/gm, "&nbsp;");
		return new Handlebars.SafeString(text);
	});	
	
	//댓글 원글과 자식글 구분처리
	Handlebars.registerHelper("fn_asIf",function(option){			
		if(this.asPrno == 0){
			return option.fn(this);
		}else{
			return option.inverse(this);
		}
	});
	
	
	//댓글 목록 함수 호출
	getPageList("/answer/list/" +brNo + "/" + page);
	
	//댓글 목록 함수 정의
	function getPageList(answerUri){  //페이지 번호를 파라미터로 전달 받음		
		//댓글의  목록 데이터를 처리
		$.getJSON(answerUri,function(data){
			printAsCount(data.paging.totalCount);
			printAnswer(data.list, $(".answerUl"), $("#template"));
			printPaging(data.paging, $(".pagination"));			
		});
	}
	
	//댓글 갯수 출력 함수
	function printAsCount(totalCount){
		var asCount = $(".answerCount");
		var collapseBox = $(".panel-group");
		
		//댓글이 없으면
		if(totalCount==0){
			asCount.html("댓글이 없습니다."+totalCount);
			return;
		}
		
		//댓글 존재 시
		asCount.html("("+totalCount+")개의 댓글이 있습니다.");
	}
		
/*	//댓글 목록 출력 함수
	function printAnswer(answerArr, targetArea, templateObj){
		var template=Handlebars.compile(templateObj.html());
		var html=template(answerArr);
		
		$(".ly12-answerLi").remove();
		targetArea.html(html);	
	}*/
	
	//댓글 목록 출력 함수
	function printAnswer(answerArr, targetArea, templateObj){
		var template=Handlebars.compile(templateObj.html());
		var html=template(answerArr);
		
		$(".ly12-answerLi").remove();
		var ta=targetArea.html(html);	
		console.log(ta);
	}
		
	//댓글 페이징 출력 함수
	function printPaging(paging, targetArea){
		var str="";
		if(paging.prev){
			str +="<li class='page-item'><a href='"+(paging.startPage-1)+"' class='page-link'>이전</a></li>";
		}
			
		for(var i=paging.startPage, len=paging.endPage; i<=len; i++){
			var strClass=paging.cri.page==i?'class=active':'';
			str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
			
		if(paging.next){
			str +="<li><a href='"+(paging.endPage + 1)+"' class='page-link'>다음</a></li>";
		}
		targetArea.html(str);		
	}
		
	//댓글 페이지 번호 클릭 시
	$(".pagination-sm").on("click","li a",function(event){
		event.preventDefault();
		page=$(this).attr("href");
		getPageList("/answer/list/" +brNo + "/" + page);
	});	
	
	//댓글 저장 버튼 클릭 시
	$("#ly12-addBtn").on("click",function(){
		
		//입력 form 선택자
		var urIdObj = $(".newUrId");
		var asConObj = $(".newAsContent");
		var urId=urIdObj.val();
		var asContent=asConObj.val();
		
		//댓글 입력처리 수행
		$.ajax({
			type : "post",
			url : "/answer/",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				brNo : brNo,
				urId : urId,
				asContent : asContent
			}),
			success : function(result){
				console.log("result : " +result);
				if(result == "regSuccess") {
					alert("댓글이 등록되었습니다.");
					page = 1;
					getPageList("/answer/list/" +brNo + "/" + page);
					urIdObj.val("");
					asConObj.val("");
				}
			}
		});
	});
	
	//댓글 "수정" 버튼 클릭 시 값 가져오기
	$(".answerUl").on("click", ".ly12-answerLi", function(event){
		var answer = $(this);
		
		$("#modAsContent").val(answer.find(".ly12-answerAsCon").text());
		$(".modTitle").val(answer.attr("data-asNo"));
	});
	
	//댓글수정 창에서 "수정완료" 클릭 시
	$("#answerModBtn").on("click", function(){
		var asNo=$(".modTitle").val();
		var asContent=$("#modAsContent").val();
		$.ajax({
			type :'patch',
			url : '/answer/update/' +brNo+'/'+asNo,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PATCH"
			},
			dataType : "text",
			data : JSON.stringify({
				asContent : asContent
			}),
			success : function(result){
				console.log("result :" +result);
				if(result == "modSuccess"){
					alert("댓글이 수정되었습니다.");
					getPageList("/answer/list/" +brNo + "/" + page);
					$("#modModal").modal("hide");					
				}
			}
		})
	});	
	
	//댓글 "추가" 버튼 클릭 시 해당 번호와 글을 가진 모달 창 뜨게 함
	$(".answerUl").on("click", ".ly12-answerLi .addBtn", function(){			
		var answer = $(this).parent();
		
		/*var asNo = answer.attr("data-asNo");*/
		var asPrno = answer.attr("data-asNo")
	
		/*$(".newAsContent2").val(answer.find(".ly12-answerAsCon").text());*/
		$(".tt").val(asPrno);		
		
		console.log("이 창의 부모번호는"+asPrno);
	});
	
	
	//댓글추가 창에서 "저장" 클릭 시
	$(".ly12-addBtn").on("click", function(){
		var asPrnoObj=$(".tt");
		var asPrno =asPrnoObj.val();
		var urId = $(".newUrId2").val();
		var asContent = $(".newAsContent2").val();
		
		$.ajax({
			type :"post",
			url : "/answer/"+ asPrno,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify({
				brNo : brNo,
				asPrno : asPrno,
				urId : urId,				
				asContent : asContent
			}),
			success : function(result){
				console.log("result :" +result);				
				if(result == "regSuccess2"){
					alert("댓글이 입력되었습니다.");					
					getPageList("/answer/list/" +brNo + "/" + page);
					$("#addModal").modal("hide");					
				}
			},error:function(request,status,error){
				console.log(JSON.stringify(data));
				/*console.log("게시번호"+brNo);
				console.log("부모번호"+asPrno);
				console.log("작성자"+urId);
				console.log("내용"+asContent);*/
				alert("에러");
			}
			
		})
	});
	
	//댓글에서 "삭제" 클릭 시
	$("#answerDelBtn").on("click",function(){
		var asNo=$(".modTitle").val();
		$.ajax({
			type : "put",
			url : "/answer/delete/" + asNo,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PATCH"
			},
			dataType : "text",
			success : function(result){
				console.log("result : " +result);
				if(result=="delSuccess") {
					alert("댓글이 삭제되었습니다.");
					getPageList("/answer/list/" +brNo + "/" + page);
					$("#delModal").modal("hide");	
				}
			}
		})
	});
	//--------------------------------------------------------------------------------------
		
});
