$(function (){
    chrome.storage.local.get(['id', 'memberNo'],function (local) {
        // 로그인 상태 체크
        if(local.id) {
            $(".loginform").css("display", "none");
            $(".hide").css("display", "block");
            $("#loginId").text(local.id);
            $("#memberNo").val(local.memberNo);
            
            // 과목명 불러오기
            $.ajax({
                url : "http://localhost/flyingturtle/user/memo/subject.do",
                data : { memberNo : local.memberNo },
                dataType : "json"
            })
            .done(function (result){
                let list;
                for (let sbj of result) {
                    list += `<option value="${sbj.sbjNo}">${sbj.subjectName}</option>`
                }
                $("#subject").append(list);
            });
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