<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#ly12-answerMod{position:absolute; top:50%; left:50%; width:300px; height:100px; margin:-50px 0 0 -150px; padding:10px; z-index : 1000; background-color:gray;}
</style>
<script type="text/javascript">
	$(function(){
		var brNo = 45;
		getPageList(1);
		/*선택된 게시판 글에 달린 댓글의 리스트를 json으로 가져와서 유동적으로 html로 뿌려줌*/		
		function getAllList(){			
		
			$.getJSON("/answer/list/" + brNo, function(data) {
				
				var str="";
				console.log(data.length);
				
				$(data).each(
					function(){
						str +="<li data-asNo='"+this.asNo+"' class='answerLi'>"
						    + this.asNo + ":" + this.asContent
						    + "<button>수정</button></li>";
					});
				$("#answer").html(str);
			});
		
		}
		
		/*선택한 페이지의 리스트 가져오기*/
		function getPageList(page){
			$.getJSON("/answer/list/" + brNo + "/" + page, function(data){
				console.log(data.list.length);
				
				var str="";
				
				$(data.list).each(function(){
					str +="<li data-asNo='"+this.asNo+"' class='page-item answerLi'>"
					    + this.asNo +":" + this.asContent
					    + "<button>수정</button></li>";
				});
				
				$("#answer").html(str);
				printPaging(data.paging);
			});
		}
		
		/*댓글 리스트 페이징*/
		function printPaging(paging){
			var str="";
			
			if(paging.prev){
				str += "<li class='page-item'>"
					+   "<a href='"+(paging.startPage-1)+"' class='page-link'> 이전 </a>"
					+   "<li>";
			}
			
			for(var i=paging.startPage, len = paging.endPage; i<=len; i++){
				var strClass= paging.cri.page == i? 'class=active':'';
				str += "<li "+strClass+">"
					+  "<a href='"+i+"' class='page-link'>"+i+""
					+ "<span class='sr-only'>(current)</span></a>"
				    + "</li>";
			}
			
			if(paging.next){
				str +="<li>"
				    +"<a href='"+(paging.endPage + 1)+"' class='page-link'>다음</a>"
				    +"</li>";				
			}
			$('.pagination').html(str);
		}
		/*페이징 버튼 클릭시 이벤트*/
		var answerPage=1;
		
		$(".pagination").on("click","li a", function(event){
			event.preventDefault(); /*a태그의 기본동작을 중단(현재 클릭된 페이지의 번호에 있을 때)*/
			answerPage = $(this).attr("href");
			getPageList(answerPage);
		});
		
		/*댓글 입력 버튼 클릭 시 글 추가되면서 댓글리스트 불러오기*/
		$("#ly12-addBtn").on("click",function(){
			
			var urId = $("#urId").val();
			var asContent = $("#asContent").val();
			
			$.ajax({
				type:'post',
				url: '/answer',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType:'text',
				/*stringify() : json객체를 String으로 변환(@RequestBody의 vo객체와 매핑을 위해서)*/
				data:JSON.stringify({
					brNo:brNo,
					urId:urId,
					asContent:asContent					
				}),
				success :function(result){
					if(result == 'success'){
						alert("등록되었습니다.");
						getAllList();
					}
				}
			});
		});
		
		/*댓글 수정 버튼 클릭 시 해당 번호와 글을 가진 모달 창 뜨게 함*/
		$("#answer").on("click", ".answerLi button", function(){
			var answer = $(this).parent();
			
			var asNo = answer.attr("data-asNo");
			var asContent = answer.text();
			
			$(".ly12-modal-title").html(asNo);
			$("#modAsContent").val(asContent);
			$("#ly12-answerMod").show("slow");			
		});
		
		/*모달 창 뜨면 내용 수정 후 성공여부*/
		$("#ly12-answerModBtn").on("click", function(){
			var asNo = $(".ly12-modal-title").html();
			var asContent = $("#modAsContent").val();
			
			$.ajax({
				type:'patch',
				url:'/answer/update/'+brNo+'/'+asNo,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PATCH"
				},
				data:JSON.stringify({asContent:asContent}),
				dataType:'text',
				success:function(result){
					console.log("result: " + result);
					if(result == 'success'){
						alert("수정 되었습니다.");
						$("#ly12-answerMod").hide("slow");
						getAllList();
					}
				}
			});
		});
		
		/*모달 창 뜨면 내용 삭제 후 성공여부*/
		$("#ly12-answerDelBtn").on("click", function(){
			var asNo = $(".ly12-modal-title").html();
			
			$.ajax({
				type:'patch',
				url:'/answer/delete/'+asNo,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PATCH"
				},
				dataType:'text',
				success:function(result){
					console.log("result: " + result);
					if(result == 'success'){
						alert("삭제 되었습니다.");
						$("#ly12-answerMod").hide("slow");
						getAllList();
					}
				}
			});
		});
		
	});
</script>
</head>
<body>

	<h2>Ajax Test Page</h2>
	<div>
		<div>작성자 : <input type="text" name="urId" id="urId"></div>
		<div>댓글내용 : <input type="text"  name="asContent" id="asContent"></div>
		<button id="ly12-addBtn">댓글입력</button>
	</div>
	<!-- 수정 모달창 -->
	<div id="ly12-answerMod" style="display:none;">
		<div class="ly12-modal-title"></div>
		<div>
			<input type="text" id="modAsContent">
		</div>
		<div>
			<button type="button" id="ly12-answerModBtn">수정</button>
			<button type="button" id="ly12-answerDelBtn">삭제</button>
			<button type="button" id="ly12-answerCloseBtn">닫기</button>
		</div>
	</div>
	<!--// 수정 모달창 -->
	<ul id="answer"></ul>
	
	<!-- 페이징 -->
	<div class="ly12-tblTextC">
		<ul class="pagination"></ul>
	</div>
	<!--// 페이징 -->
	

	<section id="ly12_board-area">
		<div class="container">
		댓글 영역
		<div class="row ly12-mgB65">
			<div class="col-md-8">
				<h2 id="comments">댓글을 남겨주세요</h2>
				<textarea class="form-control" rows="3"></textarea>
				<br>
				<button class="btn btn-default">저장</button>
				리스트 lv1
				<div class="col-md-12 col-md-offset-0">
					<div style="font-weight:500; font-size:1.2em;">
						<p>내용내용</p>
					</div>
					<p style="padding:10px 0;">
						<span style="forumName">작성자</span>
						<span style="color:#777;">작성날짜</span>
						<a href="#">댓글쓰기</a>
						댓글추가창
						<blockquote>
							<textarea class="form-control"></textarea>
							<br>
							<button class="btn btn-default">저장</button>
						</blockquote>
						// 댓글추가창

					</p>
					<hr>
				</div>
				// 리스트 lv1
				리스트 lv2
				<div class="col-md-11 col-md-offset-0">
					<div style="font-weight:500; font-size:1.2em;">
						<p>내용내용</p>
					</div>
					<p style="padding:10px 0;">
						<span style="forumName">작성자</span>
						<span style="color:#777;">작성날짜</span>
						<a href="#">댓글쓰기</a>
						댓글추가창
						<blockquote>
							<textarea class="form-control"></textarea>
							<br>
							<button class="btn btn-default">저장</button>
						</blockquote>
						// 댓글추가창
					</p>
					<hr>
				</div>
				// 리스트
			</div>
		</div>
		//댓글 영역 
		</div>
	</section>

</body>
</html>