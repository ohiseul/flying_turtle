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