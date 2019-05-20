

$(document).ready( function() { 
    $(document).on("click", ".sideMenu", function(){
        //e.preventDefault();
        var $this = $(this).parent().find('ul');
        $(".buttonList ul").not($this).slideUp(100);
        $this.slideToggle(200);
    });
    $(document).on("mouseover",".ddBtn",function() {
        $(this).show();
    });
    $(document).on("mouseout",".ddBtn",function() {
        $(this).hide();
    });
});

var num = 0;
$(".buttonList").on("click","#addButton",function() {
    num++;    
    $(this).parent().parent().append("<li>"
    + "<button class='sideMenu'>JAVA</button>"
    +" <span class='ddBtn' id='menu"+num+"'>+</span>"
    +" <ul class='dropdown'>"
    +"</ul>"   
    +" </li>");
    // $(".buttonList ul").hide();
    $(".ddBtn").hide();
    // 사이드과목 보이게 함
});

// $(".ddBtn").mouseout(function() {
//     $(this).hide();
// });
$("body").on("mouseover",".sideMenu",function() {
    $(this).next().show();
});
$("body").on("mouseout",".sideMenu",function() {
    $(this).next().hide();
});
$(".buttonList").on("click",".ddBtn",function() {
    $(".dropdown").append("<li><button class='childMenu'>IO</button></li>")
})


// let addButton = function() {
//     var html = "<li>"
//    + "<button class='sideMenu'>JAVA</button>"
//    +" <span class='ddBtn'>+</span>"
//    +" <ul class='dropdown'>"
//    +"</ul>"   
//    +" </li>";
// }