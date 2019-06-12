$("#loginBtn").click(function (){
    // 아이디값 storage에 저장
    let loginId = $("#id").val();
    alert("아이디 ", loginId);
    chrome.runtime.sendMessage(loginId, function (response){
        alert(response.msg);
    });
});

/*
alert("1");
chrome.tabs.executeScript({
    file: "background.js"
});

function clickHandler() {
    alert('great');
}

chrome.contextMenus.create({
    "id": "qwertyuiop",
    "title": "flyturtle",
    "contexts": ["page", "selection", "image", "link"]
});
chrome.contextMenus.onClicked.addListener(clickHandler);
*/