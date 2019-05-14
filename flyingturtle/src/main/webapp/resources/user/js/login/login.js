$(document).ready(function () {
	
	//	로그인/회원가입 창 슬라이드
	document.querySelector('.img__btn').addEventListener('click', function() {
		document.querySelector('.cont').classList.toggle('s--signup');
	});

	//메세지 숨기기
	$(".val-msg").hide();
	
});

	// 	간편 로그인 창
	$("button.fb-btn").click( function() {
	    $("#simple-pass").load("patternLock.html");
	    modal("show",".modal");
	});
	// 	간편 로그인 창 닫기
	$(".login-by-id").click(function () {
	    modal("hide", ".modal");
	    return false;
	});
	
	// 	비밀번호 찾기 창
	$(".forgot-pass").click(function () {
	    modal("show","#forgot-form");
	});
	// 	비밀번호 찾기 창 닫기
	$("#quit").click(function () {
	    modal("hide","#forgot-form");
	    return false;
	});
	
	
	// 공백검사
	function isEmpty(ele) {
		console.log("공백 검사");
		console.log("ele" , ele);
	    if (ele.val() != '') {
	    	$(ele).next().hide();
	    	return false;
	    }
	    $(ele).next().show();
	    ele.focus();
	    return true;
	}
	
	function dologin() {
		if( isEmpty($("#id")) ) return false;
		if( isEmpty($("#pass")) ) return false;
		
		document.login-form.submit();
	}
	
