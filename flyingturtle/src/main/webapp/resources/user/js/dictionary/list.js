window.onload = function() {
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/dictionary/list.css">');
};

$(".buttonList ul").hide();
$(".buttonList>li>.sideMenu").click(function(){
  //e.preventDefault();
  var $this = $(this).parent().find('ul');
  $(".buttonList ul").not($this).slideUp(100);
  $this.slideToggle(200);
});