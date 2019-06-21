// 서버 연결
var xhr = new XMLHttpRequest();
var memberNo;
chrome.storage.local.get('memberNo', (local) => {memberNo = local.memberNo});

// 복사 내용 db 저장
function clickHandler(clickData) {
    // alert("복사시 memberNo :: "+ memberNo);

    if (clickData.menuItemId == 'flyingturtle') {
        // alert(clickData.selectionText);
        
        xhr.onreadystatechange = function () {
            if(xhr.readyState == 4) {
                if(xhr.status == 200) {
                    alert("복사 성공! 내 메모장에서 확인하세요");
                }
            }
        };

        xhr.open("POST", "http://localhost/flyingturtle/user/memo/copy.do");
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.send("memberNo=" + memberNo + "&content=" + clickData.selectionText);
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