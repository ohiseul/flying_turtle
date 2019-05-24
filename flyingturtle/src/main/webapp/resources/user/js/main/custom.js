
 /* jQuery Pre loader
  -----------------------------------------------*/
$(window).on("load", function(){
});
$('.preloader').fadeOut(1000); // set duration in brackets    

/* Istope Portfolio
-----------------------------------------------*/
jQuery(document).ready(function($){

  if ( $('.iso-box-wrapper').length > 0 ) { 

      var $container = $('.iso-box-wrapper'), 
          $imgs = $('.iso-box img');

      $container.imagesLoaded(function () {

        $container.isotope({
        layoutMode: 'fitRows',
        itemSelector: '.iso-box'
        });

        $imgs.on('load',function(){
          $container.isotope('reLayout');
        });

      });

      //filter items on button click

      $('.filter-wrapper li a').click(function(){

          var $this = $(this), filterValue = $this.attr('data-filter');

      $container.isotope({ 
        filter: filterValue,
        animationOptions: { 
            duration: 750, 
            easing: 'linear', 
            queue: false, 
        }                
      });             

      // don't proceed if already selected 

      if ( $this.hasClass('selected') ) { 
        return false; 
      }

      var filter_wrapper = $this.closest('.filter-wrapper');
      filter_wrapper.find('.selected').removeClass('selected');
      $this.addClass('selected');

        return false;
      }); 

  }

});


$(document).ready(function(){
            
    "use strict";

//    $('.menu-container').each(function(index) {
//        $(this).find('.circle').attr('menu-link', index);
//        $(this).find('.list-menu').clone().appendTo('body').attr('menu-link', index);
//    });
//
//    $('.menu-container .circle').click(function() {
//        var linkedVideo = $('section').closest('body').find('.list-menu[menu-link="' + $(this).attr('menu-link') + '"]');
//        linkedVideo.toggleClass('reveal-modal');
//       
//    });

    $('section').closest('body').find('.close-iframe').click(function() {
        $(this).closest('.list-menu').toggleClass('reveal-modal');
    });
    

  /* wow
  -------------------------------*/
  new WOW({ mobile: false }).init();

  });

