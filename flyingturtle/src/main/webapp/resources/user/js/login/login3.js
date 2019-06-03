
$(document).ready(function () {
	$(".val-msg").hide();	// 메세지 숨기기

	/**	로그인/회원가입 창 슬라이드 버튼	*/
	document.querySelector('.img__btn').addEventListener('click', function() {
		document.querySelector('.cont').classList.toggle('s--signup');
	});
	
	$("#login-form").submit(function (e) {
		e.preventDefault();
		
		checkId( $("#id").val() );
		checkPass( $("#pass").val() );
		
		$.ajax({
			type : "POST",
			url : "login.do",
			data : {
				id : $("#login-id").val(),
				pass : $("#login-pass").val()
			}
		})
		.fail(function () {
			swal("아이디와 비밀번호를 확인 해 주세요!", {
				  buttons: false,
				  timer: 2000,
			});
		});
		
		$(this).unbind('submit').submit();
	});
	
	
	
	$("#form").submit(function (e) {
		e.preventDefault();
		
		$(".val-msg").hide();	// 메세지 숨기기

		//검사해야 할 엘리먼츠 값
		var $id = $("#id").val();
		var $pass = $("#pass").val();
		var $checkPass = $("#pass1").val();
		var $email = $("#email").val();
		var $name = $("#name").val();
		var $patternPass = $("#form input[name='patternPass']").val();
		alert($patternPass);
		
		return;
		
		console.log("아이디 : ", $id);
		console.log("패턴비번 : ", $patternPass);
		let rtn = beUnique("/flyingturtle/user/signup/checkid.do", "id", $id);
		console.log("반환값 : ", rtn);
		
		// submit 할때 체크하는거면 ajax한번에 보내라
		// 근데 입력시 바로바로 체크하는게 맞는거야
		beUnique("/flyingturtle/user/signup/checkid.do", "id", $id);
		beUnique("/flyingturtle/user/signup/checkemail.do", "email", $email)

		if (checkId($id) || checkPass($pass, $checkPass) || 
			checkEmail($email) || checkName($name)) {
			return error();
		}
		
		swal("반가워요!", {
			  buttons: false,
			  timer: 2000,
		});
		
		$(this).unbind('submit').submit();
	});
	
		
	/* ******************************패턴 로그인****************************** */
	lock = new PatternLock('#patternContainer');

	// 회원가입 참조
	lock2 = new PatternLock('#joinPatternContainer');
	
	$("#pattern-form").submit(function (e) {		
		var patVal = lock.getPattern();
		if ($(".login-id").val() == "" || patVal == "") {
			swal("아이디와 비밀번호를 확인 해 주세요!", {
				  button: false,
				  timer: 2000,
			});
			e.preventDefault();
			return;
		}		
		
		$("input[name='patternPass']").val(patVal);
		
	});
	
	
	/*
	 * 회원가입 간편 비밀번호 설정 파트
	 */

	$("#joinPassConfirm").click(function () {
		if (lock2.getPattern().length < 6) {
			swal("6개 이상 선택하세요", {
				  buttons: false,
				  timer: 2000,
			});
			return;
		}
		$("#form input[name='patternPass']").val( lock2.getPattern() );
		$("#patternMsg").text("패턴이 설정되었습니다.");
		Modal("#joinPatternPass");
	});
	
	$("#joinPassReset").click(function () {
		lock2.reset();
	});
	$("#joinPassClose").click(function () {
		lock2.reset();
		Modal("#joinPatternPass");
	});
	
	
	
	
	
	$("#reset").click(function () {
		lock.reset();
	});
	$("#lock").click(function () {
		lock.disable();
	});
	$("#unlock").click(function () {
		lock.enable();
	});
	
	$('#patternContainer').mouseup(function () {
		var patVal = lock.getPattern()
		// alert(patVal);
	});
	
	
	
	
	
});




function error() {
	swal("다시 확인해 주세요!", {
		  buttons: false,
		  timer: 2000,
	});
}

//이메일 요휴성검사 정규식
var Regexemail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;

function checkId(id) {
	if(id.length < 4 || id.length == 0) {
		//alert("check I D 4글자 이상 호출");
		$("#id").next().show();
		$("#id").focus();
        return true;
    }
};

function checkPass(pass, checkPass) {
	if(pass.length < 8) 
	{
		//alert("check P a s s 8글자 이상 호출");
		$("#pass").next().show();
		$("#pass").focus();
		return true;
	}
	
	if( pass != checkPass ) 
	{
		$("#pass1").val("");
		$("#pass1").next().show();
		$("#pass1").focus();
		return true;
    }
};

function checkEmail(email) {
//	alert("check E m a i l 호출");
	
	if(email.length == 0 || !Regexemail.test($.trim(email)) ) {
    	$("#email").next().show();
    	$("#email").focus();
    	return true;
    }
};

function checkName(name) {
	// alert("check Name 호출");
	
	if(name.length == 0) {
		$("#name").next().show();
		$("#name").focus();
		return true;
	}
};


function patternPass(patternPass) {
	// alert("check patternPass 호출");
	
	if(patternPass.length < 6) {
		$("#patternPass").next().show();
		$("#patternPass").focus();
		return true;
	}
};

// AJAX 중복검사
function beUnique(url, ele, val) {
	console.log("AJAX 중복검사 함수 호출 -------------------");
	console.log("중복검사 매개변수 : ", ele);
	console.log("------------------ 검사 값 : ", val );
	
	let eleID = "#"+ele;
	let flag = false;
	
	$.ajax({
		type : "POST",
		url : url,
		async : false,	// 동기화
		data : $(eleID).attr("name") + "=" + val
	})
	.done(function (result) {
		console.log("result 응답 값 -- " , result);
		
		if(result > 0) {
			console.log(" 중복 -- result 있음 ");
			
			flag = true;
			console.log("flag:: ", flag);

			$(eleID).next().next().show();
			console.log("========================");
			return function () { return flag; };
		}
		console.log(" 사용 가능 -- result == 0");
		console.log("========================");
		return flag;
	});
	
	
	
	
	
	
};




// Modal div show or hide
function Modal(ele) {
	$(ele).toggle();
}


