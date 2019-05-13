window.onload = function () {
	
	document.querySelector('.img__btn').addEventListener('click', function() {
	    document.querySelector('.cont').classList.toggle('s--signup');
	});
	
	
	
	// 간편 로그인 삽입
	$("button.fb-btn").click( function() {
	    $("#simple-pass").load("patternLock.html");
	    modal("show",".modal");
	});
	
	$(".login-by-id").click(function () {
	    modal("hide", ".modal");
	    return false;
	});
	
	// 비밀번호 찾기
	$(".forgot-pass").click(function () {
	    modal("show","#forgot-form");
	});
	$("#quit").click(function () {
	    modal("hide","#forgot-form");
	    return false;
	});
	
	// 창 띄우는 함수
	function modal(comm, selector) {
	    if(comm=='show'){
	        $(selector).show();
	    } else {
	        $(selector).hide();
	    }
	};
	
	
	// =============================================================
	
	// Submit시 ======= 공백검사
	function isEmpty(ele, msg) {
	    if (ele.value == '') {
	    	$.notify(msg,"info", {position:"right"});
	    	ele.focus();
	        return true;    // 되돌아갔을때 if문이 실행되야하므로..
	    }
	    return false;
	}
	
	// 로그인 ======= 폼 검사
	function checkForm() {
	//    alert("checkForm"); //함수 호출 여부 확인
	   
	    var f = document.form;
	    var id = f.id;
	    var pass = f.pass;
	    if (isEmpty(id, "아이디를 입력하세요")) return;
	    if (isEmpty(pass, "비밀번호를 입력하세요")) return;
	    
	    f.submit();
	}
	
	
	// 회원가입 검사
	
	// 1. 중복 아이디 검사
	$("#id").blur(function () {
		if($(this).val() == '') return;
		
		if($(this).val().length < 4) {
			$.notify("아이디는 4글자 이상 입력하세요","error");
			id.select();
			return;
		}
		
		$.ajax({
			url : "/flyingturtle/login/checkid.do",
			data : "id=" + $("#id").val()
		})
		.done(function (result) {
			// console.log("result 응답 값? ", result);
			
			if(result > 0) {
				$.notify("이미 사용중인 아이디예요.","error");
				id.value = "";
				id.select();
				return;
			} else{
				$.notify("사용가능한 아이디입니다.","success");
			}
		})
	});
	
	// 2. 비밀번호 조건 체크
	$("#pass").blur(function () {
		var passVal = $(this).val();
		
		if($(this).val() == ''){
			$.notify("비밀번호를 입력해주세요","error");
			return;
		}
		
		if(passVal.length < 7) {
			$.notify("8자리 이상 입력해주세요","error");
			pass.select();
			return;
		}
		/*if(! /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,15}$/.test(pass) ){            
			$.notify('숫자+영문자+특수문자 조합으로 6자리 이상 사용해야 합니다.',"error");
			$('#pass').val('').focus();
			return;
	    }*/
		
	});
	
	//2-2. 비밀번호 일치 확인
	$("#pass1").blur(function () {
		if($(this).val() == '') return;
		if (pass.value != pass1.value) {
			$.notify("비밀번호가 일치하지 않습니다","error");
	//      pass1.value = "";
			pass1.select();
			return;
		} else {
			$.notify("비밀번호 일치","success");
		}
	});
	
	// 3. 이메일 중복 확인
	$("#email").blur(function () {
		if($(this).val() == '') return;
		$.ajax({
			url : "/flyingturtle/login/checkemail.do",
			data : "email=" + $("#email").val()
		})
		.done(function (result) {
			// console.log("result 응답 값? ", result);
			
			if(result > 0) {
				$.notify("이미 사용중인 이메일이에요.","error");
				email.value = "";
				email.select();
				return;
			} else {
				$.notify("사용가능한 이메일입니다.","success");
			}
		})
	});


}