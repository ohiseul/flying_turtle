window.onload = function() {
	$('head').append(`<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/admin/css/dictionary/list.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/list.css">
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

//메뉴==================================================================================================
$( function() {

	   $("main").hide();
	   //등록된 과목명 불러오기
	   getSubjectList();
	   

	// 처음 로딩 시 전체 메뉴 목록 가져오기
	function getSubjectList(){
	   
	   $.ajax({
	        url:"user/video/menulist.do",
	        dataType:"json",
	      success:function(result) {
//	         alert("전체 목록");
	         console.dir(result);
	         
	         html ="";
	         html +=`<li>
	            <img id="addButton" src="/flyingturtle/resources/images/add.png" />
	            </li>`;
	         for(let i=0; i < result.length ; i++) {
	            html +=`<li>
	                     <div class='sideMenu'><input class='menuInput' data-sbjNo="`+result[i].subjectNo+`" type='text' name ='menu'  value="`+result[i].subjectName+`"></div>
	                  </li>`;
	         }
	         $(".buttonList").html(html);
	      }
	   });
	}
	
	
$(".buttonList").on("click","#addButton",function() {
		      $.ajax({
		         url:"/flyingturtle/user/video/subjectwrite.do",
		         success:function(result){
		        	 $(".buttonList:last-child").append("<li>"
		        			 + "<button class='sideMenu'><input class='menuInput' data-sbjNo='"
		        			 +result
		        			 +"' type='text' name ='menu' placeholder='과목 작성' ></button>"  
		        			 +" </li>");
		         }
		      });
		   });

$(".buttonList1").on("click",".menuInput",function() {
	alert("한번");
	var num = $(this).attr("data-sbjno");
	console.log(num);
			$.ajax({
		        url:"/flyingturtle/user/video/subnolist.do",
		        data:{"subjectNo":num},
		        dataType:"json",
		        success:function(data){
		        	console.dir(data);
		        	html="";
		        	for(i=0; i< data.length;i++){
		        		var jbAry = data[i].videoAddr.split('/');
		        		var realurl = jbAry[jbAry.length-1];	
		             html+=`<tr data-url="`+realurl+`" id="`+data[i].videoNo+`">
			                <td>`+data[i].videoNo+`</td>
			                <td><div class="thumb"></div></td>
			                <td><a href='/flyingturtle/user/video/detail.do?videoNo=`+data[i].videoNo+`'>`+data[i].title+`</a></td>
			                <td>`+data[i].memberNo+`</td>
			                <td>`+data[i].regDate+`</td>
			                <td><a href="javascript:void(0)" class="btn btn-info playBtn">Play</a></td>
						 </tr>` 	
	                }
		        	$("#listBox").html(html);
			$('#music tbody tr').addClass('list');
			$('.list').each(function() {
				var youtube_video_id   =   $(this).attr('data-url');
				if (youtube_video_id.length == 11) {
					var video_thumbnail = $('<img src="https://i.ytimg.com/vi/'+ youtube_video_id +'/hqdefault.jpg" class="img-responsive">');
					$(this).find('.thumb').append(video_thumbnail);
				}      
				var jd   =   $(this).index()+1
				$(this).find('td').eq(0).text(jd);
			});
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
	    	alert('왜안돼?');
		      $.ajax({
		         url:"/flyingturtle/user/video/subjectupdate.do",
		         data:{"subjectName":$(this).val(),"subjectNo":no},
		         dataType:"json",
		         success:function(result){
		        	 alert("수정성공")
		            getSubjectList();
		         }
		      });
	    }

	});


});