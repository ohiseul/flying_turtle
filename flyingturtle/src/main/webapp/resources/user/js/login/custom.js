/* jQuery Pre loader
-----------------------------------------------*/
// $(window).load(function(){
//     $('.preloader').fadeOut(1000); // set duration in brackets    
// });

/* HTML document is loaded. DOM is ready. 
-------------------------------------------*/
$(document).ready(function() {
 /* Parallax section
    -----------------------------------------------*/
  function initParallax() {
    $('#intro').parallax("100%", 0.1);
    $('#overview').parallax("100%", 0.1);
  }
  initParallax();

  /* wow : 글자 애니메이션 효과
  -------------------------------*/
  new WOW({ mobile: false }).init();

});






