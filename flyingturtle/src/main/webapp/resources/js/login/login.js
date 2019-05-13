window.onload = function () {
	
	document.querySelector('.img__btn').addEventListener('click', function() {
	    document.querySelector('.cont').classList.toggle('s--signup');
	});

	//메세지 숨기기
	$(".val-msg").hide();

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
// =============================================================================================
$("#form").submit(function () {
	
	// 1. 아이디
	if(isEmpty($("#id"))) return false;
	
	// 글자 수 검사
	let $length = $(this).val().length;
	if( $length < 4) {
		$(this).next().show();
		return false;
	} else {
		$(this).next().hide();
	};
	
	// 중복 검사
	if( isUniqued("/flyingturtle/signup/checkid.do", $(this)) ) return false;
	
	// 2. 비밀번호 조건 체크
//	isEmpty($("#pass"));
//	
//	var passVal = $(this).val();
//	if( passVal.length >  7) {
//		$(this).next().hide();
//		return;
//	} else {
//		$(this).next().show();
//	}
	
})
	
	
}
// =============================================================

	// 창 띄우기
	function modal(comm, selector) {
	    if(comm=='show'){
	        $(selector).show();
	    } else {
	        $(selector).hide();
	    }
	};
	
	// 공백검사
	function isEmpty(ele) {
		console.log("공백 검사");
		console.log("ele" , ele);
	    if (ele.val() == '') {
	    	$(ele).next().show();
	    	ele.focus();
	        return true;
	    }
    	$(ele).next().hide();
    	return false;
	}
	
	// 중복검사 : 아이디, 이메일
	function isUniqued(url, selector) {
		console.log("중복 검사");
		console.log("selector value : ", $(selector).val());
		console.log("::::::::::::: ", selector.attr("name"));
		
		$.ajax({
			url : url,
			data : selector.attr("name") + "=" + $(selector).val()
		})
		.done(function (result) {
			console.log("result 응답 값 === ", result);
			
			if(result > 0) {
				// 중복시
				console.log("result > 0 임");
				selector.next().next().show(); 	// 2번째 span문구 출력
				return true;
			}
			console.log("result == 0 ");
			$(this).next().next().hide();
			return false;
		})
	};
	
	
	
	
	
//	//2-2. 비밀번호 일치 확인
//	$("#pass1").blur(function () {
//		isEmpty($(this));
//		
//		if (pass.value != pass1.value) {
//			$(this).next().show();
//	//      pass1.value = "";
////			pass1.select();
//			return;
//		} else {
//			$(this).next().hide();
//		}
//	});
//	
//	// 3. 이메일 중복 확인
//	$("#email").blur(function () {
//		isEmpty($(this));
//		
//		$.ajax({
//			url : "/flyingturtle/signup/checkemail.do",
//			data : "email=" + $("#email").val()
//		})
//		.done(function (result) {
//			// console.log("result 응답 값? ", result);
//			
//			if(result > 0) {
//				$(this).next().show();
//				email.value = "";
////				email.select();
//				return;
//			} else {
//				$(this).next().hide();
//			}
//		})
//	});

