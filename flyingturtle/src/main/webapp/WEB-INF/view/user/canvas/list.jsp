<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready( function() {
	// css 추가
	$('head').append('<link rel="stylesheet" type="text/css" href="/flyingturtle/resources/user/css/canvas/list.css">'
			+ '<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">'
	);
});
</script>

	<div id="totalBox">
	<div class="buttonList1">
		<ul class="buttonList">
		</ul>
	</div>
		<div id="container">
			<img id="mainImage"
				src="${pageContext.request.contextPath}/resources/images/canvas/사용자화면_없습니다.jpg"
				alt='current image'>
		</div>
		<table class="thumbBox paginated" id="thumbBox">
		</table>
	</div>


<script type="text/javascript"
	src="<c:url value="/resources/user/js/canvas/list.js"/>"></script>
<script>

//처음 로딩시 리스트는 첫번재 과목으로 설정
$(document).ready(function (){
	loadData(1,1);
});

// 메뉴클릭시 element의 정보에 db값 설정
function canvasmove(id,id2) {
	var sbjNo = $("#"+id).attr("data-sbjNo");
	var ssbjNo = $("#"+id2).attr("data-no");

	//과목에 해당하는 리스트 불러옴
	loadData(sbjNo,ssbjNo);
}

//폴더에 있는 그림 리스트 + main그림으로 확대
function loadData(a,b){
	$.ajax({
		url:"/flyingturtle/user/canvas/canvasView.do",
		type:"GET",
		dataType: "json",
		data: {"sbjNo":a,"ssbjNo":b},
		success:function (data){
			if(data.lists != null){
				var temp = "<tbody><tr style='	height: 140px;'>";
				for (var i = data.lists.length-1; i >=0; i--) {
				temp += `<td class="listtd" ><img  class="thumbnail " src="${pageContext.request.contextPath}/resources/images/canvas/`
						+data.parentPath+data.lists[i]+`"><div class="imgName">`+data.lists[i]+`</div></td>`;
				}
				temp += "</tr></tbody>";
				$("#thumbBox").html(temp);
				$("#mainImage").attr("src",`${pageContext.request.contextPath}/resources/images/canvas/`+data.parentPath+data.lists[data.lists.length-1]);
				page();
			}
			if(data.lists.length == 0){
				$("#mainImage").attr("src",`${pageContext.request.contextPath}/resources/images/canvas/사용자화면_없습니다.jpg`);				
			}
		}
		
	}); 

}	
	
	// 만들어진 테이블에 페이지 처리
	function page(){ 
	var reSortColors = function($table) {
	  $('tbody tr td:odd', $table).removeClass('even').removeClass('listtd').addClass('odd');
	  $('tbody tr td:even', $table).removeClass('odd').removeClass('listtd').addClass('even');
	 };
	 $('table.paginated').each(function() {
	  var pagesu = 10;  //페이지 번호 갯수
	  var currentPage = 0;
	  var numPerPage = 5;  //목록의 수
	  var $table = $(this);    
	  
	  //length로 원래 리스트의 전체길이구함
	  var numRows = $table.find('tbody tr td').length;
	  //Math.ceil를 이용하여 반올림
	  var numPages = Math.ceil(numRows / numPerPage);
	  //리스트가 없으면 종료
	  if (numPages==0) return;
	  //pager라는 클래스의 div엘리먼트 작성
	  var $pager = $('<td id="remo" class="imgName"><div class="pager"></div></td>');
	  
	  var nowp = currentPage;
	  var endp = nowp+10;
	  
	  //페이지를 클릭하면 다시 셋팅
	  $table.bind('repaginate', function() {
	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	  
	   $table.find('tbody tr td').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	   $("#remo").html("");
	   
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
	    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
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

</script>
