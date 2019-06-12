// id,pass + memberNo 가져오기
chrome.runtime.onMessage.addListener(
    function (request, sender, sendResponse){
        alert(request.loginId);
        sendResponse({msg: "success"});  // 응답을 보냄
    }
);

function clickHandler(clickData) {
    if (clickData.menuItemId == 'flyingturtle') {
        alert(clickData.selectionText);

        let xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if(xhr.readyState == 4) {
                if(xhr.status == 200) {
                    alert("성공");
                }
            }
        }
        xhr.open("POST", "http://localhost/flyingturtle/user/memo/copy.do");
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("content=" + clickData.selectionText);
        // xhr.send();
    }
}

chrome.contextMenus.create({
    "id": "flyingturtle",
    "title": "flyingturtle",
    "contexts": ["page", "selection", "image", "link"]
});

chrome.contextMenus.onClicked.addListener(clickHandler);