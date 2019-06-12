$("#loginBtn").click(function (){
    // 로그인 정보 - background.js 전달
    alert("전달하기 전:: "+ $("#pass").val());
    alert("전달하기 전:: "+ $("#id").val());

    chrome.runtime.sendMessage(
        {
            id: $("#id").val(),
            pass: $("#pass").val()
        },
        function (response){
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