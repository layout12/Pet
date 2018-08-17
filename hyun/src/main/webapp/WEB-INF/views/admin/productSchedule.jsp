<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel='stylesheet' type='text/css' href='/resources/css/theme.css' />
<link rel='stylesheet' type='text/css' href='/resources/css/fullcalendar.css' />
<script type='text/javascript' src='/resources/js/sojaeji.js'></script>
<script type='text/javascript' src='/resources/js/jquery.js'></script>
<script type='text/javascript' src='/resources/js/jquery-ui-custom.js'></script>
<script type='text/javascript' src='/resources/js/fullcalendar.min.js'></script>
<script type='text/javascript'>

	$(document).ready(function() {
	 	$("#showForm").hide();
		$("#showSelect").hide(); 
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		
		$('#calendar').fullCalendar({
		
			theme: true,
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: true,
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, d-d+1),
					end: new Date(y, m, d-d+2)
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},

			]
		});
		$(".fc-day-number").mouseover(function(){
			var monthPa=$(this).parents().attr("class").split('fc-not-today')[0].split('fc-other-')[1];		
			if(monthPa=="month "){
				$(".fc-day-number").css("cursor","default");
			}else{
				$(".fc-day-number").css("cursor","pointer");
			}  
		});
		
		$(".fc-other-month").children(".fc-day-number").mouseover(function(){
			$(".fc-other-month").children(".fc-day-number").unbind("click");
		});
		
		$(".fc-day-number").click(function(){
	 		$.ajax({
				type: "POST",
				url: "/admin/ScheduleInsertForm",
				success: function(result){ 
					var userObj =result.userList;
					var productObj =result.productList;
					$.each(userObj, function(key,val){
						var str=JSON.stringify(val.urId);
						var urList=str.replace(/^"(.*)"$/, '$1');
							$("#urId").append('<option>' + urList + '</option>');
					});
					$.each(productObj, function(key,val){
						var pdNoList=JSON.stringify(val.pdNo);
							$("#pdNo").append('<option>' + pdNoList + '</option>');
					});
					$("#showForm").show();
					$("#showSelect").show();
				}
	
	 		});
		
	 		var soloYear = $(".fc-header-title").text().split(' ')[1];
			var soloMonth = $(".fc-header-title").text().split(' ')[0];
			var soloDay = $(this).text();
			switch(soloMonth){
				case "January": 
					var soloMonth=1;
				break;
				case "February": 
					var soloMonth=2;
				break;
				case "March": 
					var soloMonth=3;
				break;
				case "April": 
					var soloMonth=4;
				break;
				case "May": 
					var soloMonth=5;
				break;
				case "June": 
					var soloMonth=6;
				break;
				case "July": 
					var soloMonth=7;
				break;
				case "August": 
					var soloMonth=8;
				break;
				case "September": 
					var soloMonth=9;
				break;
				case "October": 
					var soloMonth=10;
				break;
				case "November": 
					var soloMonth=11;
				break;
				case "December": 
					var soloMonth=12;
				break;			
			}
			$("#selectPdDate").val(soloYear+"년"+soloMonth+"월"+soloDay+"일");	
	
		});
	}); 
	
	function pdNoDisplay(param){
		var pdNo = param;
		$.ajax({
			type: "POST",
			url: "/admin/selectSchedulePdName?pdNo="+pdNo,
			success: function(result){
				var pdName=result;
				$("#selectPdName").val(pdName)
			},		
			error: function(){		
				alert("전송실패");
			}
		});	
	}; 
	
 	function formSubmit(){
		var params = $("#showForm").serialize();
		$.ajax({
			type: "POST",
			url: "/admin/insertSchedule",
			data:params,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType:"html",
			success: function(result){
				if(result=="SUCCESS")
				alert("스케줄 입력이 완료되었습니다.");
				window.location.reload();
			}	
		});
	};
	
	function totalAddr(){
		var addr1=$("#sido").val();
		var addr2=$("#gugun").val();
		var addr3=$("#dong").val();
		var totalAddr=addr1+addr2+addr3;
		$("#pdSaleAddr").val(totalAddr);
	}
	
</script>
<style type='text/css'>

	body {
		margin-top: 40px;
		text-align: center;
		font-size: 13px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		}

	#calendar {
		width: 900px;
		margin: 0 auto;
		}

</style>
</head>
<body>

<div id='calendar'></div>


<form name="showForm" id="showForm">

<input type="text" id="selectPdDate" name="pdSaleDate" readonly="readonly">
<select name="pdNo" onchange="pdNoDisplay(this.value)" id="pdNo"></select>
<input type="text" id="selectPdName" name="pdName" readonly="readonly">
<select name="urId" id="urId"></select>

<select name="pdSaleTime">
	<option value=1>10시~11시</option>
	<option value=2>11시~12시</option>
	<option value=3>12시~13시</option>
	<option value=4>13시~14시</option>
	<option value=5>14시~15시</option>
	<option value=6>15시~16시</option>
	<option value=7>16시~17시</option>
	<option value=8>17시~18시</option>
</select>


<input type="hidden" name="pdSaleAddr" id="pdSaleAddr">
<textarea name="pdSaleContent">여기는 메모공간</textarea>
<input type="button" value="ajax 폼 전송" onclick="formSubmit();">
</form>

<fieldset id="showSelect">
	<select name="sido" id="sido" onchange="totalAddr()"></select>
	<select name="gugun" id="gugun" onchange="totalAddr()"></select>
	<select name="dong" id="dong" onchange="totalAddr()"></select>
</fieldset>
<script type="text/javascript">
new sojaeji('sido', 'gugun', 'dong');
</script>
</body>
</html>

