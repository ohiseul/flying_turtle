function ckSDate() {
  alert("날짜확인함수");
  return true;
}

function moveRegist() {
  location.href = "adAssRegist.do";
}

function prePage() {
  location.href = "assList.html?reqIndex=${thisPage-1}";
}

function nextPage() {
  location.href = "assList.html?reqIndex=${thisPage+1}";
}

function ckForm(type) {
  if ($("#title").val() == "") {
    alert("제목을 입력하세요");
    $("#title").focus();
    return false;
  }

  if ($("#startDate").val() == "") {
    alert("시작 날짜를 입력하세요");
    $("#startDate").focus();
    return false;
  }

  if ($("#endDate").val() == "") {
    alert("종료 날짜를 입력하세요");
    $("#endDate").focus();
    return false;
  }

  if ($("#content").val() == "") {
    alert("내용을 입력하세요");
    $("#content").focus();
    return false;
  }

  if ($("#startDate").val() > $("#endDate").val()) {
    alert("종료날짜가 시작날짜보다 빠릅니다.");
    $("#endDate").focus();
    return false;
  }

  if (confirm("과제를 " + (!type ? "수정" : "등록") + " 하시겠습니까?")) {
    return true;
  }

  return false;
}

function moveList() {
  location.href = "assList.html";
}
function modifyAss(no) {
  location.href = "assBfModify.do?no=" + no;
}

function deleteAss(no) {
  if (confirm("삭제 하시겠습니까?")) {
    location.href = "assDelete.do?no=" + no;
  }
}

function popUp(type, no, id) {
  switch (type) {
    case "O":
      window.open(
        "assUserDetail.do?no=" + no + "&id=" + id, // 팝업창에 띄울 페이지 주소
        "제출 상세", // 팝업창에 이름 설정
        "width=600, height=500, resizable=no"
      );
      break;
  }
}
