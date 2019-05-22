window.onload = function() {
     $('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/video/detail.css"/>'+
                      '<link rel="stylesheet" href="/flyingturtle/resources/user/css/video/subject.css">');
};


$(function() {
	 $.ajax({
           type:'POST',
           url : "/flyingturtle/user/video/listaddr.do",
           success : function(data){
               for(var i =0; i<data.length;i++){
            	   var jbAry = data[i].videoAddr.split('/');
            	   var realurl = jbAry[jbAry.length-1];   
                 
                   $("#inputvideo").append(' <div class="thumbody" data-url="'+realurl+'" id="'+data[i].videoNo+'"> ' +
											' <div class="item"> ' +
                  							'<iframe width="600px"; height="300px"; src="https://www.youtube.com/embed/' + realurl + '?llist=PLuHgQVnccGMCeAy-2-llhw3nWoQKUvQck"></iframe>'+                    		
                  							'</div>'+
                   						'</div>');

               }
             
           }
       });
	 
});



// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
   event.target.stopVideo();
} 

var flag1 = true;
var flag2 = true;
var flag3 = true;
var flag4 = true;


$(document).on("show1Cover", function() {
   if (flag1) {
      player.pauseVideo();
      $(".step2Cover").css("display", "flex");
      var step2Show = anime({
         targets: ".step2Cover",
         opacity: 1,
         easing: "easeOutExpo",
         duration: "1140"
      });

      flag1 = false;
   }
});

$(document).on("show2Cover", function() {
   if (flag2) {
      player.pauseVideo();
      $(".step3Cover").css("display", "flex");
      var step2Show = anime({
         targets: ".step3Cover",
         opacity: 1,
         easing: "easeOutExpo",
         duration: "680"
      });
      flag2 = false;
   }
});

$(document).on("show3Cover", function() {
   if (flag3) {
      player.pauseVideo();
      $(".step4Cover").css("display", "flex");
      var step3Show = anime({
         targets: ".step4Cover",
         opacity: 1,
         easing: "easeOutExpo",
         duration: "680"
      });

      var keyframes = anime({
         targets: ".copyLi b",
         opacity: [
            { value: 1, duration: 400, delay: 4000, elasticity: 0 },
            { value: 0, duration: 400, delay: 0, elasticity: 0 },
            { value: 1, duration: 400, delay: 0, elasticity: 0 },
            { value: 0, duration: 400, delay: 0, elasticity: 0 }
         ]
      });

      flag3 = false;
   }
});


var flag5 = true;

var flag6 = true;

var flag7 = true;


function onPlayerStateChange(event) {
   var count1Play = anime({
      targets: "#countCircle",
      strokeDashoffset: [anime.setDashoffset, 0],
      opacity: 1,
      easing: "linear",
      autoplay: false
   });

   var count1Move = anime({
      targets: ".counter1",
      translateX: ["70px", "0"],
      opacity: 1,
      easing: "easeOutExpo",
      duration: 1200,
      autoplay: false
   });

   if (event.data == 0) {
      $(".videoCoverEnd").css("display", "flex");
      var coverHide = anime({
         targets: ".videoCoverEnd",
         opacity: 1,
         easing: "easeOutExpo",
         duration: "680"
      });
   } // If Ended

   if (event.data == 2) {
   } // If Paused

   if (event.data == 1) {
      $(document).trigger("count1Play");
      flag6 = true;

      var coverHide = anime({
         targets: ".videoCoverStart",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".videoCoverStart").delay(680).queue(function(next) {
         $(".videoCoverStart").css("display", "none");
         next();
      });

      var coverHide = anime({
         targets: ".videoCoverEnd",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".videoCoverEnd").delay(680).queue(function(next) {
         $(".videoCoverEnd").css("display", "none");
         next();
      });
   } // If Playing


   if (event.data == 1) {
      function checkTime() {
         if (player.getCurrentTime() >= 1) {
         } /// Step 1 Time

         // Counters

         if (player.getCurrentTime() >= 22) {
            count1Play.seek(
               count1Play.duration * ((player.getCurrentTime() - 22) / 20)
            );

            $(document).trigger("count1Show");
         } /// Step 1 Time

         if (player.getCurrentTime() <= 42) {
            flag1 = true;
         } /// Step 1 Time

         if (player.getCurrentTime() >= 42) {
            $(document).trigger("show1Cover");

            $(".counter").css("opacity", "0");
         } /// Step 1 Time

         if (player.getCurrentTime() <= 62) {
            flag2 = true;
         } /// Step 2 Time

         if (player.getCurrentTime() >= 62) {
            $(document).trigger("show2Cover");
         } /// Step 2 Time

         if (player.getCurrentTime() <= 82) {
            flag3 = true;
         } /// Step 3 Time

         if (player.getCurrentTime() >= 82) {
            $(document).trigger("show3Cover");
         } /// Step 3 Time

         if (player.getCurrentTime() >= 120) {
         } // Flasher

         if (player.getCurrentTime() <= 120) {
            flag4 = true;
         } /// Step 4 Time

         if (player.getCurrentTime() >= 120) {
            $(document).trigger("show4Cover");

            $(".stepsWrapp").css("overflow-y", "auto");
         } else window.setTimeout(checkTime, 50); /// Step 4 Time
      }
      window.setTimeout(checkTime, 50);
   } ////// Current Time Logic - End
} // Listening to Player state change


$(document).ready(function() {
   window.onblur = function() {
      player.pauseVideo();
      console.log("blur");
   };

   $(".startCTA , .videoCoverStart div").click(function() {
      $(".fader").css("display", "block");
      var showSteps = anime.timeline();

      showSteps
         .add({
            targets: ".stepsWrapp",
            translateX: ["408px", "0"],
            easing: "easeOutExpo",
            duration: "680"
         })
         .add({
            targets: ".opener",
            translateX: ["0", "-50px"],
            easing: "easeOutExpo",
            duration: "680",
            offset: "-=630"
         })
         .add({
            targets: ".fader",
            opacity: 0.3,
            easing: "easeOutExpo",
            duration: "1200",
            offset: "-=680"
         }); // Slide to Steps

      player.playVideo();
   }); // Start CTA Click

   $(".videoCoverEnd div").click(function() {
      $(".stepsWrapp").scrollTo({ top: "0px", left: "0" }, 680);
      player.playVideo();
      player.seekTo(22);
   }); // End CTA Click

   $(".backRow").click(function() {
      $(".stepsWrapp").scrollTo({ top: "0px", left: "0" }, 680);
      player.playVideo();
      player.seekTo(22);
   }); // Back Row Click

   // Step 2 Cover Actions
   $(".step2Cover .replayStepBtn").click(function() {
      $(document).trigger("count1Restart");

      player.seekTo(22);
      player.playVideo();
      var step2CoverHide = anime({
         targets: ".step2Cover",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".step2Cover").delay(680).queue(function(next) {
         $(".step2Cover").css("display", "none");
         next();
      });

      $(".stepsWrapp").scrollTo({ top: "0px", left: "0" }, 680);
   }); // Replay Actions

   $(".step2Cover .nextStepBtn").click(function() {
      player.seekTo(43);
      player.playVideo();

      var step2CoverHide = anime({
         targets: ".step2Cover",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".step2Cover").delay(680).queue(function(next) {
         $(".step2Cover").css("display", "none");
         next();
      });

      $(".stepsWrapp").scrollTo({ top: "389px", left: "0" }, 680);
   }); // Next Step Actions

   // Step 2 Cover Actions - End

   // Step 3 Cover Actions
   $(".step3Cover .replayStepBtn").click(function() {
      player.seekTo(43);
      player.playVideo();
      var step2CoverHide = anime({
         targets: ".step3Cover",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".step3Cover").delay(680).queue(function(next) {
         $(".step3Cover").css("display", "none");
         next();
      });

      $(".stepsWrapp").scrollTo({ top: "389px", left: "0" }, 680);
   }); // Replay Actions

   $(".step3Cover .nextStepBtn").click(function() {
      player.seekTo(64);
      player.playVideo();

      var step2CoverHide = anime({
         targets: ".step3Cover",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".step3Cover").delay(680).queue(function(next) {
         $(".step3Cover").css("display", "none");
         next();
      });

      $(".stepsWrapp").scrollTo({ top: "778px", left: "0" }, 680);
   }); // Next Step Actions

   // Step 3 Cover Actions - End

   // Step 4 Cover Actions
   $(".step4Cover .replayStepBtn").click(function() {
      player.seekTo(62);
      player.playVideo();
      var step2CoverHide = anime({
         targets: ".step4Cover",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".step4Cover").delay(680).queue(function(next) {
         $(".step4Cover").css("display", "none");
         next();
      });

      $(".stepsWrapp").scrollTo({ top: "778px", left: "0" }, 680);
   }); // Replay Actions

   $(".step4Cover .nextStepBtn").click(function() {
      player.seekTo(83);
      player.playVideo();

      var step2CoverHide = anime({
         targets: ".step4Cover",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".step4Cover").delay(680).queue(function(next) {
         $(".step4Cover").css("display", "none");
         next();
      });

      $(".stepsWrapp").scrollTo({ top: "1167px", left: "0" }, 680);
   }); // Next Step Actions

   // Step 4 Cover Actions - End

   // Step 5 Cover Actions
   $(".step5Cover .replayStepBtn").click(function() {
      player.seekTo(82);
      player.playVideo();
      var step2CoverHide = anime({
         targets: ".step5Cover",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".step5Cover").delay(680).queue(function(next) {
         $(".step5Cover").css("display", "none");
         next();
      });

      $(".stepsWrapp").scrollTo({ top: "1167px", left: "0" }, 680);
   }); // Replay Actions

   $(".step5Cover .nextStepBtn").click(function() {
      player.seekTo(120);
      player.playVideo();

      var step2CoverHide = anime({
         targets: ".step5Cover",
         opacity: 0.0,
         easing: "easeOutExpo",
         duration: "680"
      });

      $(".step5Cover").delay(680).queue(function(next) {
         $(".step5Cover").css("display", "none");
         next();
      });

      $(".stepsWrapp").scrollTo({ top: "1656px", left: "0" }, 680);
   }); // Next Step Actions

   // Step 5 Cover Actions - End

   // Copy Script //

   $(".copy1 p span").click(function() {
      $(".copyField1").select();
      document.execCommand("copy");

      var opiedShow = anime({
         targets: ".copy1 object",
         opacity: [
            { value: 1, duration: 680, delay: 0, easing: "easeOutExpo" },
            { value: 0, duration: 680, delay: 500, easing: "easeOutExpo" }
         ],
         translateX: [
            { value: ["25px", "0"], duration: 320, delay: 0, elasticity: "10" }
         ]
      });
   });

   $(".copy2 p span").click(function() {
      $(".copyField2").select();
      document.execCommand("copy");

      var opiedShow = anime({
         targets: ".copy2 object",
         opacity: [
            { value: 1, duration: 1000, delay: 0, easing: "easeOutExpo" },
            { value: 0, duration: 1000, delay: 500, easing: "easeOutExpo" }
         ],
         translateX: [
            { value: ["25px", "0"], duration: 320, delay: 0, elasticity: "10" }
         ]
      });
   });

   
}); // Document Ready



///////댓글 

 /*=======댓글창 열고 닫기====================================================*/
   function comOpen(result,id){
    $("#"+result).toggle("display");
    if( $("#"+id).text() == '댓글 펼치기' ) {
      $("#"+id).text('댓글 접기');
    }
    else {
      $("#"+id).text('댓글 펼치기');
    }
   }
   
  
 /*댓글 등록하기(Ajax)*/
     
    function fn_comment(){
       $.ajax({
          type:'POST',
          url : "/flyingturtle/user/video/commentwrite.do",
          data:$("#commentForm").serialize(),
          success : function(commentLista){
                 getCommentList(commentLista);
                $("textarea[name='content']").val("");
          }
          
       });
    }
     
    
     /*댓글 삭제*/
    function commentdelete(num){
       $.ajax({
          type:'POST',
          url : "/flyingturtle/user/video/commentdelete.do",
          data:"comNo="+num,
          success : function(){
                 $("#"+num).remove();
          }
       });
    } 
    
     /*댓글 수정폼*/
    function commentupdateform(comNo){
      $.ajax({
         type:'GET',
         url : "/flyingturtle/user/video/commentupdateform.do",
         data:"comNo="+comNo,
         dataType : "json",
         success : function(data){
            $("#"+comNo).html(`<textarea id="text`+comNo+`" style="resize:none;width: 1100px;height: 70px;"></textarea><a onclick="commentupdate(`+comNo+`);">등록</a>`);
            $("#text"+comNo).val(data.content);
         }
         
      });
    } 
     
     
    function commentupdate(comNo){
      var data = $("#text"+comNo).val();
      $.ajax({
         type:'GET',
         url : "/flyingturtle/user/video/commentupdate.do",
         data:{"content":data,"comNo":comNo},
         success : function(){
            getCommentList();
            
         }
         
      });
    } 
 
    /**
     * 초기 페이지 로딩시 댓글 불러오기
     */
    $(function(){
       
       getCommentList();
       
    });
     
    /**
     * 댓글 불러오기(Ajax)
     */
     function getCommentList(){
         
         $.ajax({
            type:'GET',
            url : "/flyingturtle/user/video/commentlist.do",
            dataType : "json",
            data:$("#commentForm").serialize(),
            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
            success : function(commentLista){
               //alert("성공");
               console.log("들어왔나1"+commentLista[0].content);
               console.dir("들어왔나2"+commentLista[0].regDate);
               
                   var html = "";
                      var cCnt = commentLista.length;
                      
                      if(commentLista.length > 0){
                          
                      for(i=0; i<commentLista.length; i++){
                          html += `<div id="`+commentLista[i].comNo+`"><div>
                                  <table> <p class="memid">`+ commentLista[i].memberNo+` 학생</p> <span id=comcontent style="width: 900px;"><p>`+ commentLista[i].content+`</p></span> <a class="comdel" onclick="commentdelete('`+commentLista[i].comNo+`');">삭제</a><a class="comupdt" onclick="commentupdateform('`+commentLista[i].comNo+`');">수정</a></table>
                                  <hr>`;
                          }
                          
                      } else {
                          
                          html += "<div>";
                          html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                          html += "</table></div>";
                          html += "</div>";
                          
                      }
                      
                      $("#cCnt").html(cCnt);
                      $("#commentList").html(html);
               
            }
            
         });
      }
    


//메뉴 스크롤
$(document).ready(function(){
 
   //고정할 것 : topBar 
    var topBar = $(".buttonList").offset();
 
    $(window).scroll(function(){
        var docScrollY = $(document).scrollTop();
      var barThis = $(".buttonList");
      //하단 내용 : fixNext 
        var fixNext = $(".wrapper");
 
        if( docScrollY > topBar.top ) {
            barThis.addClass("top_bar_fix");
            fixNext.addClass("pd_top_80");
        }else{
            barThis.removeClass("top_bar_fix");
            fixNext.removeClass("pd_top_80");
        }
 
    });
 
})
 