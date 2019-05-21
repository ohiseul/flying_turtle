window.onload = function() {
	$('head').append(`<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/list.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />`);
};

//=======================================

	       

$(
function() {

//live search box
$('.search-row input').on('keyup', function() {
 var value = $(this).val();
 var patt = new RegExp(value, "i");
 console.log(patt)
 $('#music').find('.active-item').each(function() {
    if (!($(this).find('td').text().search(patt) >= 0)) {
       $(this).not('.myHead').hide();
    }
    if (($(this).find('td').text().search(patt) >= 0)) {
       $(this).show();
    }

 });
});



//play video

$('.wrapper').on('click','.playBtn', function(){
 var videoId    =   $(this).parents('tr').attr('data-url')
 var videoWidth = $('.video_body').width(),
    videoHeight = $('.video_body').height(),
    iframe = $('<iframe width="'
              + videoWidth
              + '" height="'
              + videoHeight
              + '" src="https://www.youtube.com/embed/'
              + videoId
              + '" frameborder="0" allowfullscreen></iframe>');
 $('.video_body').html(iframe);
 $('.video_box').fadeIn(500)
 $('body').addClass('modal-open');
});

$('.modal-close').click(function(){
 $('.video_box').fadeOut(500)
 $('body').removeClass('modal-open');
})



	});

/**
Remove active class on submit
**/
$('form').submit(function(e) {
e.preventDefault();
if ($(this).hasClass('active')) 
  $(this).removeClass('active');
});

/**
Show/Hide form inputs
**/
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

/*$(document).on("click","#searchButton",function(e){
	e.preventDefault();
	var url="list.do";
	url = url + "?keyword="+$("#search").val();
	location.href= url;
	console.log(url);
});*/


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
	window.location.href="/flyingturtle/user/video/list.do?pageNo=1&searchType="+searchType+"&keyword="+ keyword;
}
