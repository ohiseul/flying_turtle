$(document).ready( function() {
	// css 추가
	$('head').append(`<script src='https://static.codepen.io/assets/editor/live/console_runner-1df7d3399bdc1f40995a35209755dcfd8c7547da127f6469fd81e5fba982f6af.js'></script>
            <script src='https://static.codepen.io/assets/editor/live/css_reload-5619dc0905a68b2e6298901de54f73cefe4e079f65a75406858d92924b4938bf.js'></script>
            <link rel="canonical" href="https://codepen.io/novae/pen/uGrIf" />
            <link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/counseling/list.css">`
	);
});

$(document).ready(function () {
    
    $('body').on("click", ".larg div h3", function () {
      if ($(this).children('span').hasClass('close')) {
        $(this).children('span').removeClass('close');
      } else
      {
        $(this).children('span').addClass('close');
      }
      $(this).parent().children('p').slideToggle(250);
    });
  
    $('body').on("click", "nav ul li a", function () {
      var title = $(this).data('title');
      $('.title').children('h2').html(title);
    });
  });
            //# sourceURL=pen.js