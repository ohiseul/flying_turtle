$(document).ready(function () {
	/**	로그인/회원가입 창 슬라이드	*/
	document.querySelector('.img__btn').addEventListener('click', function() {
		document.querySelector('.cont').classList.toggle('s--signup');
	});

	$(".val-msg").hide();	// 메세지 숨기기
	
	// 이벤트 설정
	$("#id").keyup(checkId);
	$("#pass").keyup(checkPass);
	$("#checkPass").keyup(checkPass);
	$("#email").keyup(checkEmail);
});


//이메일 요휴성검사 정규식
var Regexemail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;

//검사해야 할 엘리먼츠 값
var $id = $("#id");
var $pass = $("#pass");
var $checkPass = $("#pass1");
var $email = $("#email");
var $name = $("#name");


function checkId() {
	if($id.val().length < 4 || $id.val().length == 0) {
		alert("check I D 4글자 이상 호출");
    	$id.focus();
        return false;
    }
	
	let flag = isUniqued("/flyingturtle/user/signup/checkid.do", "#id");
	alert(flag());
};



function checkPass() {
	if($pass.length < 8) {
		alert("check P a s s 8글자 이상 호출");
		$pass.focus();
		return false;
	}
	
	if( $pass.val() != $checkPass.val() ) {
		console.log("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
		$pass.val("");
		$checkPass.focus();
		return false;
    }
	
	$checkPass.next().hide();
};

function checkEmail() {
	// alert("check E m a i l 호출");
	
	if($email.length == 0 || !Regexemail.test($.trim($email.val())) ) {
    	console.log("이메일을 입력해주세요");
    	$email.next().show();
    	$email.focus();
    	return false;
    }
	
	if( isUniqued("/flyingturtle/user/signup/checkemail.do", $("#email")) ) {
    	$email.next().show();
    	return false;
    }
	
	$email.next().hide();
};


// 회원가입 등록
function checkForm() {
	if(checkId && checkPass && checkEmail) {
		swal({
			  title: "Sweet!",
			  text: "Here's a custom image.",
			  imageUrl: 'thumbs-up.jpg'
		});
		document.form.submit();
	} else {
		alert("다시 입력해 주세요.");
		return false;
	}
}

//function uniqueId() {
//	let flag = isUniqued("/flyingturtle/user/signup/checkid.do", "#id");
//	alert(flag());
//	
//	if( isUniqued("/flyingturtle/user/signup/checkid.do", "#id") ) {
//		console.log("아이디 중복체크 함수 호출");
//		// 중복된 아이디일때 실행
//		$id.next().show();
//		return false;
//	}
//	$id.next().hide();
//}

// AJAX 중복검사
function isUniqued(url, selector) {
	console.log("AJAX 중복검사 함수 호출 ------------------------------------");
	console.log("매개변수 : ", selector );
	console.log("------------------------------------ 검사 값 : ", $(selector).val() );
	
	$.ajax({
		url : url,
		data : $(selector).attr("name") + "=" + $(selector).val()
	})
	.done(function (result) {
		console.log("result 응답 값 -- " , result);
		
		if(result == 0) {
			$(selector).next().hide();
			console.log(" 사용 가능 -- result == 0");
			console.log("=====================================================");
			return function(){ return false; };
		} else {
			$(selector).next().show();
			console.log(" 중복 -- result 있음 ");
			console.log("=====================================================");
			return function(){ return true;};
		}
	});
};
