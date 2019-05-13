$(document).ready(function () {
	/**	로그인/회원가입 창 슬라이드	*/
	document.querySelector('.img__btn').addEventListener('click', function() {
		document.querySelector('.cont').classList.toggle('s--signup');
	});

	//메세지 숨기기
	$(".val-msg").hide();
});

function checkForm() {
	var RegexEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i; //이메일 요휴성검사
	
	var $id = $("#id");
    var userid = $("#id").val();
    var userpwd = $("#pass").val();
    var inputPwdCfm = $("#pass1").val();
    var email = $("#email").val();
    var username = $("#name").val();
    
    if(userid.length < 4 || userid.length == 0) {
    	console.log("아이디를 입력해 주세요");
    	$id.next().show();
    	$("#id").focus();
        return false;
    } else {
    	$id.next().hide();
    	$id.next().next().hide();
    }
    
    if( isUniqued("/flyingturtle/signup/checkid.do", $("#id")) ) {
    	console.log("중복된 아이디 입니다.");
    	return false;
    } else {
    	$id.next().hide();
    	$id.next().next().hide();
    }
    
    if(userpwd.length < 8) {
        console.log("비밀번호를 입력해 주세요"); 
        $("#pass").next().show();
        $("#pass").focus();
        return false;
    } else {
    	$("#pass").next().hide();
    	$("#pass").next().next().hide();
    }

    if(userpwd != inputPwdCfm) {
        console.log("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
        $("#pass1").next().show();
        $("#pass1").focus();
        return false;
    }  else {
    	$("#pass1").next().hide();
    	$("#pass1").next().next().hide();
    }
 
    if(email.length == 0 || !RegexEmail.test($.trim($("#email").val())) ) {
    	console.log("이메일을 입력해주세요");
    	$("#email").next().show();
    	$("#email").focus();
    	return false;
    } else {
    	$("#email").next().hide();
    	$("#email").next().next().hide();
    }

    if( isUniqued("/flyingturtle/signup/checkemail.do", $("#email")) ) {
    	$("#email").next().show();
    	console.log("중복된 이메일 입니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    	return false;
    } else {
    	$("#email").next().hide();
    	$("#email").next().next().hide();
    }
    
    if(username.length == 0) {
        console.log("이름을 입력해주세요");
        $("#name").next().show();
        $("#name").focus();
        return false;
    } else $("#name").next().hide();
    
    document.form.submit();
}


//중복검사 : 아이디, 이메일
function isUniqued(url, selector) {
	console.log("중복 검사-------------------------------------");
	console.log("파라미터 값 : ", $(selector).val());
	console.log("파라미터명 : ", selector.attr("name"));
	
	$.ajax({
		url : url,
		data : selector.attr("name") + "=" + $(selector).val()
	})
	.done(function (result) {
		if(result > 0) {
			console.log("중복된 아이디 :: result > 0");
			selector.next().next().show(); 	// 2번째 span문구 출력
			return true;
		} else {
			console.log("사용 가능 아이디 ::: result == 0");
			return false;
		}
	});
};
