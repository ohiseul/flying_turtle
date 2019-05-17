$(document).ready(function () {
	/**	로그인/회원가입 창 슬라이드 버튼	*/
	document.querySelector('.img__btn').addEventListener('click', function() {
		document.querySelector('.cont').classList.toggle('s--signup');
	});
	$(".val-msg").hide();	// 메세지 숨기기
	
	$("#form").submit(function (e) {
		e.preventDefault();
		
		$(".val-msg").hide();	// 메세지 숨기기

		//검사해야 할 엘리먼츠 값
		var $id = $("#id").val();
		var $pass = $("#pass").val();
		var $checkPass = $("#pass1").val();
		var $email = $("#email").val();
		var $name = $("#name").val();
		
		console.log("아이디 : ", $id);
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
		
		swal({
			  title: "성공!",
			  text: "회원가입 성공",
			  imageUrl: 'thumbs-up.jpg'
		});
		
		$(this).unbind('submit').submit();
	});
});


function error() {
	swal({
		  title: "실 패!",
		  text: "당신은 거북이가 될 수 없습니다...bye...",
		  imageUrl: 'thumbs-up.jpg'
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
