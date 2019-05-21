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
