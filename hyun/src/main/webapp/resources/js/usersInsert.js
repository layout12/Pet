var idCheck = 0;
var pwdCheck = 0;
var emailCheck = 0;
var phoneCheck = 0;
var div ="";
// 아이디 체크하여 가입버튼 비활성화, 중복확인.
$(function() {

	//아이디 중복 체크
	$("#urId").focusin(function() {
		$("#urId").css("background-color", "white");
	})
	$("#urId").focusout(function() {

		var inputed = $("#urId").val();
		$.ajax({
			data : "column=UR_ID&val=" + inputed,
			url : "/users/UdundantInspection",
			success : function(data) {
				if (inputed == "" && data == '0') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#urId").css("background-color", "#FFCECE");
					idCheck = 0;
				} else if (data == '0') {
					$("#urId").css("background-color", "#B0F6AC");
					idCheck = 1;
					if (idCheck == 1 && pwdCheck == 1) {
						$(".signupbtn").prop("disabled", false);
						$(".signupbtn").css("background-color", "#4CAF50");
						signupCheck();
					}
				} else if (data != '1') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#urId").css("background-color", "#FFCECE");
					idCheck = 0;
				}
			},
			error : function() {
				alert("id 중복검사 실패")
			}
		});
	})
	//번호 중복체크
	$("#urPhone").focusin(function() {
		$("#urPhone").css("background-color", "white");
	})
	$("#urPhone").focusout(function() {
		/*var phoneNum = /[0-9]/;;
		if (phoneNum.test($("#u_phone").val())) {
			alert(phoneNum.test($("#u_phone").val()))
			$("#urPhone").css("background-color", "#B0F6AC");
		} else {
			alert(phoneNum.test($("#u_phone").val()))
			$("#urPhone").css("background-color", "#FFCECE");
			return false;
		}*/
		var inputed = $("#urPhone").val();

		$.ajax({
			data : "column=UR_PHONE&val=" + inputed,
			url : "/users/UdundantInspection",
			success : function(data) {
				if (inputed == "" && data == '0') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#urPhone").css("background-color", "#FFCECE");
					phoneCheck = 0;
				} else if (data == '0') {
					$("#urPhone").css("background-color", "#B0F6AC");
					phoneCheck = 1;
					if (phoneCheck == 1 && pwdCheck == 1) {
						$(".signupbtn").prop("disabled", false);
						$(".signupbtn").css("background-color", "#4CAF50");
						signupCheck();
					}
				} else if (data != '1') {
					$(".signupbtn").prop("disabled", true);
					$(".signupbtn").css("background-color", "#aaaaaa");
					$("#urPhone").css("background-color", "#FFCECE");
					phoneCheck = 0;
				}
			},
			error : function() {
				alert("phone 중복검사 실패")
			}
		});
	})

	//메일 중복체크
	$("#urEmail").focusin(function() {
		$("#urEmail").css("background-color", "white");
	})
	$("#urEmail").focusout(function() {
				var emailCo = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/i;
				if (emailCo.test($("#urEmail").val())) {
					$("#urEamil").css("background-color", "#B0F6AC");
				} else {
					$("#urEmail").css("background-color", "#FFCECE");
					return false;
				}

				var inputed = $("#urEmail").val();
				$.ajax({
					data : "column=UR_EMAIL&val=" + inputed,
					url : "/users/UdundantInspection",
					success : function(data) {
						if (inputed == "" && data == '0') {
							$(".signupbtn").prop("disabled",true);
							$(".signupbtn").css("background-color","#aaaaaa");
							$("#urEmail").css("background-color","#FFCECE");
							emailCheck = 0;
						} else if (data == '0') {
							$("#urEmail").css("background-color","#B0F6AC");
							emailCheck = 1;
							if (emailCheck == 1
								&& pwdCheck == 1) {
								$(".signupbtn").prop("disabled", false);
								$(".signupbtn").css("background-color","#4CAF50");
								signupCheck();
							}
						} else if (data != '1') {
							$(".signupbtn").prop("disabled",true);
							$(".signupbtn").css("background-color","#aaaaaa");
							$("#urEmail").css("background-color","#FFCECE");
							emailCheck = 0;
						}
					},
					error : function() {
						alert("email 중복검사 실패")
					}
				});
			})

})

function wordChk(str) {
	var idReg = /^.*(?=^.{6,12}$)(?=.*\d)(?=.*[a-zA-Z]).*$/;
	if (idReg.test($("#urPw").val())) {

		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#urPw").css("background-color", "#B0F6AC");
	} else if (!idReg.test($("#urId").val())) {
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#urPw").css("background-color", "#FFCECE");
	}

}

function checkPwd() {
	$("#urPw").focusin(function() {
		$("#u_pwch").css("background-color", "white").val("");
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
	})
	var inputed = $('#urPw').val();
	var reinputed = $('#urPwch').val();
	if (reinputed == "") {
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#urPwch").css("background-color", "#FFCECE");
	} else if (inputed == reinputed) {
		$("#urPwch").css("background-color", "#B0F6AC");
		pwdCheck = 1;
		if (idCheck == 1 && pwdCheck == 1) {
			$(".signupbtn").prop("disabled", false);
			$(".signupbtn").css("background-color", "#4CAF50");
			signupCheck();
		}
	} else if (inputed != reinputed) {
		pwdCheck = 0;
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
		$("#u_pwch").css("background-color", "#FFCECE");
	}
}



function signupCheck() {
	var phone = $("#urPhone").val();
	var email = $("#urEmail").val();
	var addr = $("#urAddr").val();
	if (email == "" || phone == "" || addr == "") {
		$(".signupbtn").prop("disabled", true);
		$(".signupbtn").css("background-color", "#aaaaaa");
	} 
}

$(".cancelbtn").click(function() {
	$(".id").val(null);
	$(".pass").val('');
	$(".signupbtn").prop("disabled", true);
	$(".signupbtn").css("background-color", "#aaaaaa");
});

function goPopup(e) {
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제
	// 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	 div  = $(e).parent().parent().parent().attr('id');
	var pop = window.open("/users/juso", "pop",
		"width=570,height=420, scrollbars=yes, resizable=yes");

// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제
// 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
// var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes,
// resizable=yes");
}

function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, zipNo) {
	if (div == "userjoinForm") {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		$("#urAddr").val(roadFullAddr); // 도로명주소 전체

		$(".signupbtn").prop("disabled", false);
		$(".signupbtn").css("background-color", "#4CAF50");
		signupCheck();
	}else{
		$("#urAddr").val(roadFullAddr); // 도로명주소 전체
	}
	

}


