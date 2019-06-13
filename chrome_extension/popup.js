$(function (){
    chrome.storage.local.get(['id', 'memberNo'],function (local) {
        // 로그인 상태 체크
        if(local.id) {
            $(".loginform").css("display", "none");
            $(".hide").css("display", "block");
            $("#loginId").text(local.id);
        }
    });
});

// 로그인 정보 저장
$("#loginBtn").click(function (){

    $.ajax({
        type: "POST",
        url : "http://localhost/flyingturtle/user/login/extensionlogin.do",
        data : {
            id: $("#id").val(),
            pass: $("#pass").val()
        }
    })
    .done(function (result){
        if(result != 0) {
            chrome.storage.local.set({
                'id'  : $("#id").val(),
                'pass': $("#pass").val(),
                'memberNo': result
            }, function () {
                $(".loginform").css("display", "none");
                $(".hide").css("display", "block");
                chrome.storage.local.get('id', (local) => $("#loginId").text(local.id) );
            });
        } else {
            alert("아이디와 비밀번호를 확인해 주세요");
        }
    });

});

// 로그인 정보 삭제
$("#logoutBtn").click(function (){
    chrome.storage.local.clear(function (){
        var err = chrome.runtime.lastError;
        if(err) console.error(err);

        $(".loginform").css("display", "block");
        $(".hide").css("display", "none");
    });
});