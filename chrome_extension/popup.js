$(function (){
    chrome.storage.local.get('id', function (local) {
        if(local.id) {
            $(".loginform").css("display", "none");
            $(".hide").css("display", "block");
            $("#loginId").text(local.id);
        }
    });

    // 과목명 불러오기
    $.ajax({
        url : "",
        
    })
    .done(function (){

    });

});

$("#loginBtn").click(function (){
    // 로그인 정보 - background.js 전달
    // alert("전달하기 전:: "+ $("#pass").val());
    // alert("전달하기 전:: "+ $("#id").val());

    // chrome.runtime.sendMessage(
    //     {
    //         id: $("#id").val(),
    //         pass: $("#pass").val()
    //     },
    //     function (response){
    //         alert(response.msg);
    // });

    /**/
    $.ajax({
        type: "POST",
        url : "http://localhost/flyingturtle/user/login/extensionlogin.do",
        data : {
            id: $("#id").val(),
            pass: $("#pass").val()
        }
    })
    .done(function (result){
        alert(result);

        // 한번 로그인하면 local storage에 저장하기
        // 페이지 로딩시 저장소에 로그인 정보가 저장된 상태인지 체크하고
        // 존재한다면 팝업창에 로그아웃이 뜨도록 구현.

        if(result != 0) {
            chrome.storage.local.set({
                'id'  : $("#id").val(),
                'pass': $("#pass").val(),
                'memberNo': result
            }, function () {
                // 화면 바꾸기
                $(".loginform").css("display", "none");
                $(".hide").css("display", "block");
                chrome.storage.local.get('id', (local) => $("#loginId").text(local.id) );
            });
        }
    });


});