<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<div class="box">
                <div class="buttonList1">
                   <a id="goCanvas" sbjNo="" ssbjNo="" onclick="goCanvas();" style="color:blue;">그림판이동</a>
                 <ul class="buttonList">
                   <li>
                     <img class="addButton" id="addButton"src="<c:url value="/resources/images/add.png"/>" />
                     <img class="Button" id="minusButton" src="<c:url value="/resources/images/minus.png"/>" />
                  </li>
                   
                  </ul>
                </div>
               <div id="title">
					<table class="thumbBox paginated" id="thumbBox">
					</table>
				<div id="container">
				  <img id="mainImage" src="https://www.dropbox.com/s/iflhdhnwjsla6sc/01_bambies.jpg?raw=1" alt='current image'>
				</div>
				</div>
               
</div>
<div style="height: 400px;position: relative;background-color: lime;top:300px; opacity: 0.5;">


</div>
<script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/list.js"/>"></script>
<script>
function goCanvas() {
	var sbjNo = $("#goCanvas").attr("sbjNo");
	var ssbjNo = $("#goCanvas").attr("ssbjNo");
	location.href = "/flyingturtle/admin/canvas/canvas.do?sbjNo="+sbjNo+"&ssbjNo="+ssbjNo;
}
function canvasmove(id,id2) {
	var sbjNo = $("#"+id).attr("data-sbjNo");
	var ssbjNo = $("#"+id2).attr("data-no");
	alert("id"+id+"id2"+id2+"sbjNo"+sbjNo+"ssbjNo"+ssbjNo);
	
	if(sbjNo==0){
		sbjNo=1;
		ssbjNo=1;
	}
	loadData(sbjNo,ssbjNo);
}

function loadData(a,b){
	alert("리스트 다른거 불러올라고");
	
	$.ajax({
		url:"/flyingturtle/admin/canvas/canvasView.do",
		type:"GET",
		dataType: "json",
		data: {"sbjNo":a,"ssbjNo":b},
		success:function (data){
			console.dir(data);
			console.log("data.parentPath : "+data.parentPath);
			console.log("data.lists"+data.lists[0]);
			
			var temp = "<tbody>";
			for (var i=0; i< data.lists.length-1; i++) {
			temp += `<tr>
				<td class="listtd" >
					<img class="thumbnail" src="${pageContext.request.contextPath}/resources/images/canvas/`
					+data.parentPath+data.lists[i]+`"></td></tr>`;
			}
			temp += "</tbody>";
			$("#goCanvas").attr("sbjNo",a);
			$("#goCanvas").attr("ssbjNo",b);
			$("#thumbBox").html(temp);
			page();
		}
	}); 

}	
	
	// 만들어진 테이블에 페이지 처리
	function page(){ 
	var reSortColors = function($table) {
	  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
	  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
	 };
	 $('table.paginated').each(function() {
	  var pagesu = 10;  //페이지 번호 갯수
	  var currentPage = 0;
	  var numPerPage = 5;  //목록의 수
	  var $table = $(this);    
	  
	  //length로 원래 리스트의 전체길이구함
	  var numRows = $table.find('tbody tr').length;
	  //Math.ceil를 이용하여 반올림
	  var numPages = Math.ceil(numRows / numPerPage);
	  //리스트가 없으면 종료
	  if (numPages==0) return;
	  //pager라는 클래스의 div엘리먼트 작성
	  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
	  
	  var nowp = currentPage;
	  var endp = nowp+10;
	  
	  //페이지를 클릭하면 다시 셋팅
	  $table.bind('repaginate', function() {
	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	  
	   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
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
	<style type="text/css">
	.page-number{font-size:12px;}
	.clickable {cursor: pointer;}
	.hover {text-decoration: underline;}
	.odd{ background: #FFC;}
	.even{ background: #FF9;}
	.active{ width:10px; height:10px; background:#f60; color:white;}
	</style>
