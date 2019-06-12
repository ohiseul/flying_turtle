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

//메뉴==================================================================================================
$( function() {


	/**과목추가*/
$(".buttonList").on("click","#addButton",function() {
	
		      $.ajax({
		         url:"/flyingturtle/user/video/subjectwrite.do",
		         success:function(result){
		        	 $(".buttonList").append("<li>"
		        			 + "<button class='sideMenu'><input class='menuInput' data-sbjNo='"
		        			 +result
		        			 +"' type='text' name ='menu' placeholder='과목 작성' ></button>"
		        			 +`<div style="width: 30px; display: inline-block;float: right;border-color: aqua;z-index: 1000;"><a style="color:#fff;z-index: 1001;" href="<c:url value="/user/video/list.do?subjectNo=${sbj.subjectNo}"/>">go</a></div>`
		        			 +" </li>");
		         }
		      });
		   });



$(".buttonList1").on("keydown",".menuInput",function(key) {
		console.log($(this).val());
		var no = $(this).attr("data-sbjno");
		  console.log("no"+no);
	    var menu = $(this).val();  
	    console.log("menu"+menu);
	    console.log("일단 더블클릭으로 왔다");
	    if(key.keyCode == 13) {
		      $.ajax({
		         url:"/flyingturtle/user/video/subjectupdate.do",
		         data:{"subjectName":$(this).val(),"subjectNo":no},
		         dataType:"json",
		         success:function(result){
		        	
			         html ="";
			         html +=`<li>
			            <img id="addButton" src="/flyingturtle/resources/images/add.png" />
			            </li>`;
			         for(let i=0; i < result.length ; i++) {
			            html +=`
			        <div class='sideMenu'>
					<input style="width: 60px; display: inline-block;" type='text' name ='menu' class='menuInput' value="`+result[i].subjectName+`" data-sbjno="`+result[i].subjectNo+`" />
					<div style="width: 30px; display: inline-block;float: right;border-color: aqua;z-index: 1000;"><a style="color:#fff;z-index: 1001;" href="<c:url value="/user/video/list.do?subjectNo=${sbj.subjectNo}"/>">go</a></div>
			                  </div>`;
			         }
			         $(".buttonList").html(html);
		         }
		      });
	    }

	});


});

/* 검색버튼 js */

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