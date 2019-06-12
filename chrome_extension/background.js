// 서버 연결
var xhr = new XMLHttpRequest();
xhr.onreadystatechange = function () {
    if(xhr.readyState == 4) {
        if(xhr.status == 200) {
            alert("성공");
        }
    }
}

// id,pass + memberNo 가져오기
chrome.runtime.onMessage.addListener(
    function (request, sender, sendResponse){
        alert("전달 후 :: " + request.id + request.pass);

        xhr.open("POST", "http://localhost/flyingturtle/user/login/extensionlogin.do");
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send({
            id: request.id,
            pass: request.pass
        });
        sendResponse({msg: "success"});  // popup.js에 응답
    }
);

// 복사 내용 db 저장
function clickHandler(clickData) {
    if (clickData.menuItemId == 'flyingturtle') {
        // alert(clickData.selectionText);

        xhr.open("POST", "http://localhost/flyingturtle/user/memo/copy.do");
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("content=" + clickData.selectionText);
        // xhr.send();
    }
}

// 오른쪽클릭 메뉴 생성
chrome.runtime.onInstalled.addListener(function () {
    chrome.contextMenus.create({
        "id": "flyingturtle",
        "title": "flyingturtle",
        "contexts": ["page", "selection", "image", "link"]
    });
});

chrome.contextMenus.onClicked.addListener(clickHandler);