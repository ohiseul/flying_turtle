/* 1. 회원정보 수정 */
$(".form").submit(function(){
		var $name  = $("#first_name").val();
		var $email = $("#email").val();
		var $major = $("#major").val();
		var $pass  = $("#pass").val();
		var $patternpass = $("#patternpass").val();
		
	//	alert($pass + $name+ $email);
		if($pass == "" || $name =="" || $email == "") {
			alert("비밀번호,이름,이메일을 모두 입력하세요");
			return;
		}
});



/* 2. 작성글 보기 */
$(".write").click(function(){  
	
	$.ajax({
		url:"/flyingturtle/user/mypage/myWrite.do",
		success : function(result){
			console.dir(result);
			console.log("결과값(배열) 길이 : "+ result.length);
			
			if(result.length>0) {
				var temp = "<tbody>";
				 for(let i=0; i<result.length; i++) {
					 var regDate = new Date(result[i].regDate).toLocaleDateString();
					 console.log("regDate",regDate);
					
					 console.log("회원번호"+result[i].memberNo);
					if(result[i].btype=='v') {
						console.log(result[i]);
							temp += `<tr><td class="listtd">[VIDEO]&nbsp;<a href="/flyingturtle/user/video/detail.do?videoNo=`+result[i].no+`">`+result[i].title+`</a><span class="regdate">`+regDate+`</span></td></tr>`;									
						 }
					else {
							temp += `<tr><td class="listtd">[QNA]&nbsp;<a href="/flyingturtle/user/qna/detail.do?qnaNo=`+result[i].no+`">`+result[i].title+`</a><span class="regdate">`+regDate+`</span></td></tr>`;							
					      }
				}	
			} else  {
					  temp += `<tr><td class="listtd"> 작성한 글이 없습니다.</td></tr>`;
					}
			temp += "</tbody>";
			$("#tbl").html(temp);
			page(1);
		}
	});
});



/* 3. 작성댓글 보기 */
$(".comment").click(function(){
	
	$.ajax({
		url:"/flyingturtle/user/mypage/myComment.do",
		success : function(result){
			console.dir(result);
			console.log("결과값(배열) 길이 : "+ result.length);
		if(result.length>0) {
				var temp = "<tbody>";
				for(let i=0; i<result.length; i++) {
					 var regDate = new Date(result[i].regDate).toLocaleDateString();
					 if(result[i].btype=='v') {
						 temp += `<tr><td class="listtd">[VIDEO]&nbsp;<a href="/flyingturtle/user/video/detail.do?videoNo=`+result[i].no+`">`+result[i].content+`</a><span class="regdate">`+regDate+`</span></td></tr>`;									
						}
					else  { 
						temp += `<tr><td class="listtd">[QNA]&nbsp;<a href="/flyingturtle/user/qna/detail.do?qnaNo=`+result[i].no+`">`+result[i].content+`</a><span class="regdate">`+regDate+`</span></td></tr>`;
						   }
					}
			} else {
				temp += `<tr><td class="listtd">작성한 글이 없습니다.</td></tr>`;
			}
			temp += "</tbody>";
			$("#tbl2").html(temp);
			page(2);
		}
	});
});


$(".page-number").click(function(){
	$(this).css("color", "red");
});


/* ================= 페이징 함수 ================= */
// 만들어진 테이블에 페이지 처리
	function page(no){ 
	var reSortColors = function($table) {
	  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
	  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
	 };
	 
	 $('table.paginated'+no).each(function() {
	  var pagesu = 10;  //페이지 번호 갯수
	  var currentPage = 0;
	  var numPerPage = 10;  //목록의 수
	  var $table = $(this);    
	  
	  //length로 원래 리스트의 전체길이구함
	  var numRows = $table.find('tbody tr').length;
	  //Math.ceil를 이용하여 반올림
	  var numPages = Math.ceil(numRows / numPerPage);
	  //리스트가 없으면 종료
	  if (numPages==0) return;
	  //pager라는 클래스의 div엘리먼트 작성
	  var $pager = $(`<td align="center" id="remo${no}" colspan="10"><div class="pager"></div></td>`);
	  
	  var nowp = currentPage;
	  var endp = nowp+10;
	  
	  //페이지를 클릭하면 다시 셋팅
	  $table.bind('repaginate', function() {
	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	  
	   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	   $(`#remo${no}`).html("");
	   
	   if (numPages > 1) {     // 한페이지 이상이면
	    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
	     nowp = 0;     // 1부터 
	     endp = pagesu;    // 10까지
	    }else{
	     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
	     endp = nowp+pagesu;   // 10까지
	     pi = 1;
	    }
	    
	    if (numPages < endp) {   // 10페이지가 안되면
	     endp = numPages;   // 마지막페이지를 갯수 만큼
	     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
	    }
	    if (nowp < 1) {     // 시작이 음수 or 0 이면
	     nowp = 0;     // 1페이지부터 시작
	    }
	   }else{       // 한페이지 이하이면
	    nowp = 0;      // 한번만 페이징 생성
	    endp = numPages;
	   }
	   // [처음]
	   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
	          currentPage = 0;   
	          $table.trigger('repaginate');  
	          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
	      }).appendTo($pager).addClass('clickable');
	    // [이전]
	      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
	          if(currentPage == 0) return; 
	          currentPage = currentPage-1;
	    $table.trigger('repaginate'); 
	    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	    // [1,2,3,4,5,6,7,8]
	   for (var page = nowp ; page < endp; page++) {
	    $('<span class="page-number" id="pagenum" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
	     currentPage = event.data['newPage'];
	     $table.trigger('repaginate');
	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	     }).appendTo($pager).addClass('clickable');
	   } 
	    // [다음]
	      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
	    if(currentPage == numPages-1) return;
	        currentPage = currentPage+1;
	    $table.trigger('repaginate'); 
	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	    // [끝]
	   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
	           currentPage = numPages-1;
	           $table.trigger('repaginate');
	           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	     
	     $($(".page-number")[2]).addClass('active');
	reSortColors($table);
	  });
	   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
	   $pager.appendTo($table);
	   $table.trigger('repaginate');
	 });
}

