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
    iframe = $('<iframe width="400px;'
//              + videoWidth
              + '" height="265px;'
//              + videoHeight
              + '" src="https://www.youtube.com/embed/'
              + videoId
              + '" frameborder="0" allowfullscreen></iframe>');
 $('.video_body').html(iframe);
 $('.video_box').fadeIn(550);
 $('body').addClass('modal-open');
});

$('.modal-close').click(function(){
 $('.video_box').fadeOut(500)
 $('body').removeClass('modal-open');
})
});

//====================================================================================
$(".buttonList ul > li").hide();	// 과목 하위메뉴 접은 상태로 로딩
$(".removeBtn").hide();

$(document).on("click", ".sideMenu", function() {
	let dropdownUl = $(this).next().next().next();
	dropdownUl.find("li[class='proc']").remove();
	if (dropdownUl.find("li:last").prev().css("display") == "none") {
		dropdownUl.find("li[class='com']").removeClass("com").hide();
	} else {
		dropdownUl.find("li[class='com']").removeClass("com").show();
	}
				//	과목 클릭시 하위 메뉴 펼치기
				$(this).children().attr("readonly", true);
				
				var $this = $(this).parent().find('li');
				$(".buttonList ul > li").not($this).slideUp(100);
				$this.slideToggle(200);
			});

// 과목 추가(화면)
var num = 0;
$("#addButton").click(function() {
    num++;
    let buttonList = $(this).parent().next();
    let isproc = false;
    buttonList.children().find("li").each(function(){
    	if($(this).hasClass("pro")) isproc = true;
    });
    if(isproc){Swal.fire("과목을 작성해주세요");return}
    buttonList.find(".scroll").append(
		"<li class='pro'>" +
    		"<div class='sideMenu'>" +
	    		"<input class='menuInput' type='text' name ='menu' placeholder='과목 작성'>" +
	    		"</div>" +
	    	"<span  class='go' style='display=none;' id='del"+num+"'><i class='fas fa-angle-double-right'></i></span>"+
	    	"<span class='removeBtn'>-</span>" +
	   "</li>"
	);
    buttonList.find(".menuInput").attr("readonly",false).focus();
});

// 과목명 더블클릭 - 수정 가능
$(".buttonList1").on("dblclick",".menuInput", function() {
	let menu = $(".menuInput").val();
	if (menu != null) {
		$(this).attr("readonly", false);
		return;
	}
});

// 과목명 등록(db 저장)
$(".buttonList").on("keyup", ".menuInput",function(e) {
	let $this = $(this);
	let url;
	let sbjNo = $(this).attr("data-sbjNo");
	
	if(sbjNo == null) {
		url = "subjectWrite.do";
	} else {
		url = "subjectupdate.do";
	}
	
	if(e.keyCode == 13) {
		$.ajax({
			url : url,
			data: {
				sbjName : $(this).val(),
				sbjNo
			}
		})
		.done(function (result) {
			$this.attr({ "data-sbjNo" : result, "readonly": true });
			$("li[class='pro']").attr("id", "subjectMenu" + result);
			$("li[class='pro']").removeClass("pro").addClass("comm");
			Swal.fire("과목명 등록 성공", "You clicked the button!", "success");
			$this.attr("readonly",true);
			
		});
	};
});

//- 버튼 눌렀을 때 +버튼이 -로 바뀌게
$("#minusButton").click(function(){
	let delBtn = $(this).parent().nextAll().find(".msBtn");
	if(delBtn.css("display")=="none"){
		delBtn.css("display","none");
	}
	else{
		delBtn.css("display","block");
	}
});

$(".buttonList").on("click",".msBtn",function(){
	let sbjNo = $(this).prev().children().attr("data-sbjno");
	let delBtn = $(".msBtn");
	$.ajax({
		url:"subjectDelete.do",
		 data:{"subjectNo":no},
		success:function(result){
			$("#subjectMenu"+sbjNo).remove();
			 
			 delBtn.css("display","none");
			 Swal.fire("과목 삭제 완료", "You clicked the button!", "success");
		}
	});
});


