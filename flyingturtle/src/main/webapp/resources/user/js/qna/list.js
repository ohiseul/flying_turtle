/**답변글 여부로 상태값 설정*/
function qnaStatus() {
	$.ajax({
		
		
	});
}


/**Remove active class on submit**/
$('form').submit(function(e) {
  e.preventDefault();
  if ($(this).hasClass('active')) 
    $(this).removeClass('active');
});

/**Show/Hide form inputs**/
$('.search span').click(function(e) {
  
    var $parent = $(this).parent();
  
    if (!$parent.hasClass('active')) {
      
      $parent
        .addClass('active')
        .find('input:first')
        .on('blur', function() {
          if (!$(this).val().length) $parent.removeClass('active');
        }
      );
      
    }
  });


$(".search span").click(function() {
	if ($("#searchType").show()){
		$("#searchType").hide();
	}
	$("#searchType").show();
});

$("#searchButton").click(function() {
	searchList();
});

//검색버튼을 클릭할때마다 searchList()가 수행된다.
function searchList() {
	var searchType=$("#searchType[name=searchType]").val();
	var keyword = $("#search").val();
	//검색버튼을 클릭할 때마다 1번째 페이지를 보여주기 위해 현재페이지의 값을 1로 고정한다.
	window.location.href="/flyingturtle/user/qna/list.do?index=1&pageNo=1&searchType="+searchType+"&keyword="+ keyword;
}
