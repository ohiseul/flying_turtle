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
        xhr.open("POST", "http://localhost/flyingturtle/user/memo/list.do");
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("memo=" + clickData.selectionText);
        // xhr.send();
    }
}

chrome.contextMenus.create({
    "id": "flyingturtle",
    "title": "flyturtle",
    "contexts": ["page", "selection", "image", "link"]
});

chrome.contextMenus.onClicked.addListener(clickHandler);