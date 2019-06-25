<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div id="totalBox">
	<div class="buttonList1">
		<ul class="buttonList">
			<li>
			<img id="addButton" src="<c:url value="/resources/images/add.png"/>" />
			 <img class="Button" id="minusButton" src="<c:url value="/resources/images/minus.png"/>" />	
			</li>
		</ul>
	</div>
	<div id="mmove" style=" width: 1018px;height: 31px;display: inline-block;">
	<div style="display: inline-block;border-bottom: 1px solid gray;">대과목:<span id="bigInfo"></span></div>
	<div style="display: inline-block;border-bottom: 1px solid gray;">소과목:<span id="smallInfo"></span></div>  
	<button class="saveBtn" id="goCanvas" sbjNo="1" ssbjNo="1" onclick="goCanvas();">그림판이동</button>	
	</div>
	<div id="container2">
			<img id="mainImage" src="${pageContext.request.contextPath}/resources/images/canvas/관리자_과목추가.jpg" alt='관리자 이미지'>
	</div>
		<table class="thumbBox paginated" id="thumbBox">
		</table>
	</div>

<script type="text/javascript"
	src="<c:url value="/resources/admin/js/canvas/list.js"/>"></script>
<script>

//처음 로딩시 리스트는 첫번재 과목으로 설정
$(document).ready(function (){
	loadData(1,1);
});

//과목에 해당하는 그림판으로 이동
function goCanvas() {
	var sbjNo = $("#goCanvas").attr("sbjNo");
	var ssbjNo = $("#goCanvas").attr("ssbjNo");

	location.href = "/flyingturtle/admin/canvas/canvas.do?sbjNo="+sbjNo+"&ssbjNo="+ssbjNo;
}

// 메뉴클릭시 element의 정보에 db값 설정
function canvasmove(id,id2,name1,name2) {
	var sbjNo = $("#"+id).attr("data-sbjNo");
	var ssbjNo = $("#"+id2).attr("data-no");
	
	//그림판 이동에 활용할 과목정보 설정
	 $("#goCanvas").attr("sbjNo",sbjNo);
	 $("#goCanvas").attr("ssbjNo",ssbjNo);
		$("#bigInfo").text(name1);
		$("#smallInfo").text(name2);

	//과목에 해당하는 리스트 불러옴
	loadData(sbjNo,ssbjNo);
}

//폴더에 있는 그림 리스트 + main그림으로 확대
function loadData(a,b){
	$.ajax({
		url:"/flyingturtle/admin/canvas/canvasView.do",
		type:"GET",
		dataType: "json",
		data: {"sbjNo":a,"ssbjNo":b},
		success:function (data){
				$("#goCanvas").attr("sbjNo",a);
				$("#goCanvas").attr("ssbjNo",b);
			if(data.lists != null){
				var temp = "<tbody><tr>";
				for (var i = data.lists.length-1; i >=0; i--) {
				temp += `
					<td class="listtd">
						<img class="thumbnail" src="${pageContext.request.contextPath}/resources/images/canvas/`
						+data.parentPath+data.lists[i]+`"><div class="imgName">`+data.lists[i]+`</div></td>`;
				}
				temp += "</tr></tbody>";
				$("#thumbBox").html(temp);
				$("#mainImage").attr("src",`${pageContext.request.contextPath}/resources/images/canvas/`+data.parentPath+data.lists[data.lists.length-1]);
				page();
			}
			if(data.lists.length == 0){
				$("#mainImage").attr("src",`${pageContext.request.contextPath}/resources/images/canvas/관리자_과목추가.jpg`);				
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
