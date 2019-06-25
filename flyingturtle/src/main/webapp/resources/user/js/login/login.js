$(function () {
	
	$("#login-form").validate({
		rules: {
			id : { required: true },
			pass: { required: true }
		},
		messages: {
			id: { required: "아이디를 입력하세요." },
			pass: { required: "비밀번호를 입력하세요." }
		},
		errorElement: 'span',
		errorClass: 'error-msg',
		validClass: 'valid',
		submitHandler: function () {
			$.ajax({
				url : "/flyingturtle/user/login/login.do",
				type: 'post',
				data: { id: $('#login-id').val(), pass: $('#login-pass').val() }
			})
			.done( (result) => {
				if(result == 1) {
					location.href = "/flyingturtle/user/login/loginsuccess.do";
					return;
				};
				Swal.fire({
					type: 'error',
					title: '아이디와 비밀번호를 확인해 주세요',
				});
			});
		},
		invalidHandler: function(event, validator) {
			error();
		}
	});
	
	$("#form").validate({
		rules: {
			id : {
				required: true,
				minlength: 4,
				remote: {
					url : "/flyingturtle/user/signup/checkid.do",
					data: { id : function(){ return $("#id").val();} }
				}
			},
			pass: { required: true, minlength: 8 },
			pass1: { required: true, equalTo: '#pass' },
			name: { required: true },
			email: {
				required: true,
				email: true,
				remote: {
					url : "/flyingturtle/user/signup/checkemail.do",
					data: { email : function(){ return $("#email").val();} }
				}
			},
			birthDate : {
				dateISO: true
			}
		},
		messages: {
			id: {
				required: "아이디를 입력하세요.",
				minlength : "4글자 이상 입력하세요",
				remote: "중복된 아이디입니다."
			},
			pass: {
				required: "비밀번호를 입력하세요.",
				minlength : "8자 이상 입력하세요."
			},
			pass1: {
				required: "비밀번호를 입력하세요.",
				equalTo: '비밀번호가 일치하지 않습니다.'
			},
			name: { required: "이름을 입력하세요." },
			email: {
				required: "이메일을 입력하세요",
				email: "이메일 형식에 맞게 입력하세요",
				remote: "중복된 이메일입니다."
			},
			birthDate : {
				date: "알맞은 생년월일을 입력하세요"
			}
		},
		errorElement: 'span',
		errorClass: 'error-msg',
		validClass: 'valid',
		invalidHandler: function(event, validator) {
			error();
		}
	});
});


$(document).ready(function () {
	/**	로그인/회원가입 창 슬라이드 버튼	*/
	document.querySelector('.img__btn').addEventListener('click', function() {
		document.querySelector('.cont').classList.toggle('s--signup');
	});

	/* ******************************패턴 로그인****************************** */
	lock = new PatternLock('#patternContainer');

	// 회원가입 참조
	lock2 = new PatternLock('#joinPatternContainer');
	
	$("#pattern-form").submit(function (e) {		
		var patVal = lock.getPattern();
		if ($(".login-id").val() == "" || patVal == "") {
			Swal.fire("아이디와 비밀번호를 확인 해 주세요!", {
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
			Swal.fire("6개 이상 선택하세요!", {
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

function patternPass(patternPass) {
	if(patternPass.length < 6) {
		$("#patternPass").next().css("display", "block");
		$("#patternPass").focus();
		return true;
	}
};

// error
function error() {
	Swal.fire({
		title: '다시 확인해 주세요!',
		showConfirmButton: false,
		timer: 500
	});
};

// Modal page show or hide
function Modal(ele) {
	$(ele).toggle();
};