

$(document).ready( function() { 
    $(document).on("click", ".sideMenu", function(){
        //e.preventDefault();
        $(this).children().attr("readonly",true);

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
    // $(document).on("click",".sideMenu",function() {
    //     $(this).children().addClass("inputFocus");
    // });
});

// 과목명 더블클릭 시 수정 가능
$(".buttonList1").on("dblclick",".menuInput", function() {
    let menu = $(".menuInput").val();
    if (menu != null) {    
        $(".menuInput").attr("readonly", false);
        return;
    }
});
//소과목명 버튼 더블클릭 시 수정 가능
$(".buttonList1").on("dblclick",".smallSubject",function() {
    let smallMenu = $(".smallSubject").val();
    console.log("smallMenu",smallMenu);
    
    if(smallMenu != null){
        $(".smallSubject").attr("readonly",false);
        return;
    }

});
//소과목명 클릭 시 editorJS나와야함
$(".buttonList").on("click",".childMenu",function() {
    $(".smallSubject").attr("readonly",true);

});


var num = 0;
$(".buttonList").on("click","#addButton",function() {
    num++;    
    $(this).parent().parent().append("<li>"
    + "<button class='sideMenu'><input class='menuInput' type='text' name ='menu' placeholder='과목 작성' readonly></button>"
    +" <span class='ddBtn' id='menu"+num+"'>+</span>"
    +" <ul class='dropdown'>"
    +"</ul>"   
    +" </li>");
    $(".ddBtn").hide();
});



$("body").on("mouseover",".sideMenu",function() {
    $(this).next().show();
});
$("body").on("mouseout",".sideMenu",function() {
    $(this).next().hide();
});
$(".buttonList").on("click",".ddBtn",function() {
    $(this).next().append("<li><button class='childMenu'><input class='smallSubject' type='text' name ='menu' placeholder='소과목 작성'></button></li>")
    var $this = $(this).next().children().find('button');
    $(this).next().show();
    // // var $this = $(this).parent().find('ul');
    // // $(".dropdown button").not($this).slideUp(200);
    // $(this).next().slideDown(200);
});
